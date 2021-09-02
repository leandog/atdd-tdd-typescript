class AgencyController < ApplicationController
  skip_before_action :authorize, raise: false

  def index
    @puppies = Puppy.order(:name)
  end

end
