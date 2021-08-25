class NewsController < ApplicationController
  skip_before_action :authorize, raise: false

  def index
  end
end
