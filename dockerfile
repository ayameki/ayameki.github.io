FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile /app/
COPY Gemfile.lock /app/

# Install Bundler and Gems
RUN gem install bundler
RUN bundle install

# Copy the rest of the application into the container
COPY . /app/

# Set up the build command
CMD ["bundle", "exec", "jekyll", "build"]
