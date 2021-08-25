class CartsController < ApplicationController
  skip_before_action :authorize, :only => [:show, :create, :update, :destroy], raise: false
  before_action :set_cart, only: [:edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to agency_url, :notice => 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
      end
    end
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to(cart_path(@cart), :notice => 'Cart was successfully created.') }
        format.json { render :show, status: :created, location: cart_path(@cart) }
      else
        format.html { render :action => "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to(cart_path(@cart), :notice => 'Cart was successfully updated.') }
        format.json { render :show, status: :ok, location: cart_path(@cart) }
      else
        format.html { render :action => "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to(agency_url, :notice => 'Your cart is currently empty') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:puppy_id, :cart_id)
    end
end
