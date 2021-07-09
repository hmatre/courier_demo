class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string  :sender_name
      t.string  :sender_address
      t.string  :sender_mobile_number
      t.string  :sender_pincode
      t.string  :receiver_name
      t.string  :receiver_address
      t.string  :receiver_mobile_number
      t.string  :receiver_pincode
      t.string  :parcel_weight
      t.integer :service_type
      t.float   :service_charges
      t.integer :payment_mode
      t.integer :status
      t.integer :user_id
      t.string  :tracking_reference_number
      t.string  :sender_email
      t.string  :receiver_email

      t.timestamps
    end
  end
end
