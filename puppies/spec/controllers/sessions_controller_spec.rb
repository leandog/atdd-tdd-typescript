require 'rails_helper'


RSpec.describe SessionsController, type: :controller do
  before(:each) do
    UsersController.skip_before_action :authorize, raise: false
  end

  def mock_user(stubs={})
    @user ||= mock_model(User, stubs).as_null_object
  end

  describe "POST create" do
    describe "when authentication successful" do
      it "should authenticate the user" do
        allow(User).to receive(:authenticate).with('name', 'pass')
        post :create, params: {:name => 'name', :password => 'pass'}
      end

      it "should create a user session when authentication is successful" do
        allow(User).to receive(:authenticate).and_return(mock_user(:id => 2))
        post :create, params: {:name => 'name', :password => 'pass'}
        expect(session[:user_id]).to eq(2)
      end

      it "should redirect to the admin page " do
        allow(User).to receive(:authenticate).and_return(mock_user)
        post :create, params: {:name => 'name', :password => 'pass'}
        expect(response).to redirect_to admin_url
      end
    end

    describe "when authentication failed" do
      before(:each) do
        allow(User).to receive(:authenticate).and_return(nil)
      end

      it "should redirect back to the login url" do
        post :create, params: {:name => 'name', :password => 'pass'}
        expect(response).to redirect_to login_url
      end

      it "should display 'Invalid user/password combination'" do
        post :create, params: {:name => 'name', :password => 'pass'}
        expect(flash[:alert]).to eq('Invalid user/password combination')
      end

    end
  end

  describe "DELETE destroy" do
    it "should remove the user's session" do
      session[:user_id] = 'session'
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "should redirect the user to the agency url" do
      delete :destroy
      expect(response).to redirect_to(agency_url)
    end

    it "should display the message 'Logged out'" do
      delete :destroy
      expect(flash[:notice]).to be == 'Logged out'
    end
  end
end
