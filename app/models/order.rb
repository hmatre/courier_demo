class Order < ApplicationRecord
  enum service_type: [:speed_post, :regular]
  enum payment_mode: [:cod, :prepaid]
  enum status: [:sent, :in_transit, :delivered]
  attribute :status, default: 0
  belongs_to :user

  validates_presence_of :sender_name, :sender_email, :sender_address, :sender_mobile_number, :sender_pincode, :receiver_name, :receiver_email, :receiver_address, :receiver_mobile_number, :receiver_pincode, :parcel_weight, :service_type, :service_charges, :payment_mode, :status, :user_id

  after_update :generate_tracking_number

  def generate_tracking_number
    if self.status == 'in_transit' && self.saved_change_to_status.present?
      set_code = SecureRandom.alphanumeric(3).upcase + Time.now.to_i.to_s
      self.update(tracking_reference_number: set_code)
      CourierNotificationMailer.with(order: self).send_tracking_number_to_sender.deliver
      CourierNotificationMailer.with(order: self).send_tracking_number_to_receiver.deliver
    end
  end
end
