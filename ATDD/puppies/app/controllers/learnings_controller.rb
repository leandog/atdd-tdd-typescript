class LearningsController < ApplicationController
  skip_before_action :authorize, raise: false

  def show
  end
end
