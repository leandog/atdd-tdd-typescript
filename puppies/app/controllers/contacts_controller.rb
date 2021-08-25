class ContactsController < ApplicationController
  skip_before_action :authorize, raise: false

  def new
    @message = ContactMessage.new
  end

  def create
    @message = ContactMessage.new(contact_message_params)

    respond_to do |format|
      if @message.valid?
        format.html { redirect_to(agency_url, :notice => 'Thank you for contacting us!') }
        format.json { render :json => @message }
      else
        format.html { render :action => "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def contact_message_params
    params.require(:contact_message).permit(:name, :email, :body)
  end
end
