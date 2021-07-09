class OrdersController < ApplicationController

  def new
    @order = current_user.orders.new

    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @order }
    end
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      format.html  { render :action => "new" }
      format.json  { render :json => @order.errors, :status => :unprocessable_entity }
    end
  end

  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @order }
    end
  end

  def track_courier_status
    @order = Order.find_by(tracking_reference_number: params[:tracking_reference_number])
    if @order.present?
      redirect_to order_path(@order)
    else
      respond_to do |format|
        format.html
        format.json  { render :json => @order }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:sender_name, :sender_email, :sender_address, :sender_mobile_number, :sender_pincode, :receiver_name, :receiver_address, :receiver_email, :receiver_mobile_number, :receiver_pincode, :parcel_weight, :service_type, :service_charges, :payment_mode, :status, :user_id)
  end
end
