class AdoptionsController < ApplicationController
  skip_before_action :authorize, raise: false
  before_action :set_adoption, only: [:show, :edit, :update, :destroy]

  # GET /adoptions
  def index
    @adoptions = Adoption.all
  end

  # GET /adoptions/1
  def show
  end

  # GET /adoptions/new
  def new
    @adoption = Adoption.new
  end

  # GET /adoptions/1/edit
  def edit
  end

  # POST /adoptions
  def create
    @cart = current_cart
    puppy = Puppy.find(params[:puppy_id])
    @adoption = @cart.add_puppy(puppy.id)

    respond_to do |format|
      if @adoption.save
        format.html { redirect_to(cart_path(@adoption.cart)) }
        format.json { render :json => @adoption }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /adoptions/1
  def update
    respond_to do |format|
      if @adoption.update(adoption_params)
        format.html { redirect_to(adoption_path(@adoption), :notice => 'Adoption was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /adoptions/1
  def destroy
    @adoption.destroy

    respond_to do |format|
      format.html { redirect_to(adoptions_url) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption
      @adoption = Adoption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_params
      params.require(:adoption).permit(:puppy_id, :cart_id)
    end

end
