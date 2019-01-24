# README

Sweater Weather is a micro-service API made to serve as the backend for weather forecast web application. Sweater Weather uses the Geocoder Gem to retrieve coordinates for a given location. Those coordinates are used to retrieve local forecasts from the dark sky API and present them with a random, associated gif.

## Versions
Ruby 2.4.4,
Rails 5.1.6

* Database: Postgresql

## Gems
- ``gem 'pg', '>= 0.18', '< 2.0'``
- ``gem 'puma', '~> 3.7'``
- ``gem 'geocoder'``
- ``gem 'figaro'``
- ``gem 'faraday'``

- ``gem 'bcrypt', '~> 3.1.7'``
- ``gem 'fast_jsonapi'``

##### Testing & Development:
- ``gem 'rspec-rails'``
- ``gem 'factory_bot_rails'``
- ``gem 'simplecov'``
- ``gem 'shoulda-matchers', '~> 3.1'``
- ``gem 'database_cleaner'``
- ``gem 'capybara'``
- ``gem 'pry'``
- ``gem 'webmock'``
- ``gem 'vcr'``

## Install
1 - Setup Environment: Upon download, run ``bundle install``.

2 - Setup DB: ``bundle exec rake db:{drop,create,migrate,seed}``

3 - Setup Dark Sky API:
  - Get an [api_key](https://darksky.net/dev/register)
  - ``bundle exec figaro install``
  - Store API keys in config/application.yml
    - dark_sky_key: <api_key>

4 - Setup Giphy API:
  - Get an [api_key] (https://developers.giphy.com)
  - ``bundle exec figaro install``
  - Store API keys in config/application.yml
    - giphy_key: <api_key>

    ## Testing
    MiniTest has been excluded from this app, opting for RSpec instead.

    Run RSpec via ``bundle exec rspec``

    Test data is mocked with [WebMock](https://github.com/bblimke/webmock) and [VCR](https://github.com/vcr/vcr)
