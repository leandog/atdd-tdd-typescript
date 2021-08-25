require 'rails_helper'

describe AdminController do

  describe "GET index" do
    it "should return the total order count" do
      AdminController.skip_before_action :authorize

      allow(Order).to receive(:count).and_return(2)
      get :index
      expect(assigns[:total_orders]).to be 2
    end
  end
end
