class DataFixturesController < ApplicationController
  skip_before_action :authorize, raise: false

  def purge
    system('rake db:truncate')
    system('rake db:setup')

    sleep 5

    redirect_to agency_url, notice: 'Flushed database & reseeded test data'
  end
end
