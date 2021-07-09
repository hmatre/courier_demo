class CourierNotificationMailer < ApplicationMailer

  def send_tracking_number_to_sender
    @order = params[:order]
    mail(
        to: @order.sender_email,
        from: 'test@gmail.com',
        subject: 'Tracking reference number',
        body: "Hi #{@order.sender_name}, Your Courier Tracking reference number is- #{@order.tracking_reference_number}."
    )
  end

  def send_tracking_number_to_receiver
    @order = params[:order]
    mail(
        to: @order.receiver_email,
        from: 'test@gmail.com',
        subject: 'Tracking reference number',
        body: "Hi #{@order.receiver_name}, Your Courier Tracking reference number is-  #{@order.tracking_reference_number}."
    )
  end
end
