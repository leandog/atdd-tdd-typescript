class SessionsController < ApplicationController
  skip_before_action :authorize, raise: false

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to agency_url, :notice => "Logged out"
  end

end
