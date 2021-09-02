class OrdersController < ApplicationController
  skip_before_action :authorize, :only => [:new, :create], raise: false
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  def show
  end

  def new
    @cart = current_cart

    if current_cart.adoptions.empty?
      redirect_to agency_url, :notice => "Your cart is empty"
      return
    end

    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @order }
    end
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.add_adoptions_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to(agency_url, :notice => 'Thank you for adopting a puppy!') }
        format.json { render :json => @order }
      else
        format.html { render :action => "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to(order_path(@order), :notice => 'Order was successfully updated.') }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :action => "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    adoption = @order.adoptions.first
    adoption.delivered_on = Time.now
    adoption.save

    respond_to do |format|
      format.html { redirect_to(orders_url, :notice => "Please thank #{@order.name} for the order!") }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end
