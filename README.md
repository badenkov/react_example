# README

Experiments with ReactJS, FlickrAPI and WebSockets

## Configuration

Use environment variables for configure application

    DATABASE_URL
    FAYE_URL

For **production** environment also need

    SECRET_KEY_BASE

For prepare development environment you can use
*.env.development* and *.env.test* files, where you can declare environment
variables.

For example **.env.development** file:

    DATABASE_URL: postgresql://postgres@localhost/banners_development?pool=5
    FAYE_URL: http://172.28.128.10:9292/faye

## Prepare and run application

    git clone <repo> ./react_example
    cd ./react_example

    bundle install

    bundle exec db:setup

    bundle exec rake db:test:prepare

For run tests

    bundle exec rake spec

For generate coverage report

    bundle exec rake spec:coverage

For run application

    bundle exec foreman start
