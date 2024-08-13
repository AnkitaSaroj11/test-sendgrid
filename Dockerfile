# Use the official Ruby image
FROM ruby:3.1

# Install Node.js and Yarn (if needed)
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs yarn

# Install required system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    libsqlite3-dev \
    libxml2-dev \
    libxslt1-dev

# Set the working directory
WORKDIR /myapp

# Copy Gemfile and Gemfile.lock
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gems
RUN bundle install --verbose

# Copy the application code
COPY . /myapp

# Precompile assets (optional, depends on your setup)
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expose port (optional, adjust based on your application)
EXPOSE 3000

# Define the command to run your app
CMD ["rails", "server", "-b", "0.0.0.0"]

