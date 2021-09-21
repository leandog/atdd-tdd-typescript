# Base the image off of the latest pre-built rails image
FROM rails 

# make and switch to the /app directory which will hold our app
RUN mkdir /app 
WORKDIR /app

# move over the Gemfile and Gemfile.lock before the rest of the app so that we can cache the intalled gems
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# install all gems specified by the Gemfile
RUN bundle install

# copy over the rest of the rails app files
ADD . /app

# initialize
RUN rails db:migrate
RUN rails db:seed

# ensure db migration
ENTRYPOINT ["bin/migrate.sh"]

# start the rails server
# NOTE: The '-b 0.0.0.0' is very important!
# Especially if you are using a Mac.
CMD rails s -b 0.0.0.0