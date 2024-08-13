version: 0.2

phases:
  install:
    runtime-versions:
      ruby: 3.1
      nodejs: 16
    commands:
      - echo Installing dependencies...
      - gem install bundler
      - bundle install
      - npm install -g yarn
      - yarn install
  pre_build:
    commands:
      - echo Running database migrations...
      - bundle exec rake db:migrate
  build:
    commands:
      - echo Running tests...
      - bundle exec rake test
      - echo Precompiling assets...
      - bundle exec rake assets:precompile
  post_build:
    commands:
      - echo Build completed on `date`
artifacts:
  files:
    - '**/*'
  base-directory: 'public'
