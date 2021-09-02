class PuppiesController < ApplicationController
  skip_before_action :authorize, only: [:index, :show], raise: false
  before_action :set_puppy, only: [:show, :edit, :update, :destroy]

  def index
    @puppies = Puppy.all
  end

  def show
  end

  def new
    @puppy = Puppy.new
  end

  def edit
  end

  def create
    @puppy = Puppy.new(puppy_params)

    respond_to do |format|
      if @puppy.save
        format.html { redirect_to(puppy_path(@puppy), notice: 'Puppy was successfully created.') }
        format.json { render :show, status: :created, location: @puppy }
      else
        format.html { render :new }
        format.json { render json: @puppy.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @puppy.update(puppy_params)
        format.html { redirect_to(puppy_path(@puppy), notice: 'Puppy was successfully updated.') }
        format.json { render :show, status: :ok, location: @puppy }
      else
        format.html { render :edit }
        format.json { render json: @puppy.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @puppy.destroy

    respond_to do |format|
      format.html { redirect_to(puppies_url) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puppy
      @puppy = Puppy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def puppy_params
      params.require(:puppy).permit(:name, :breed, :image_url, :fees)
    end
end
