[![CircleCI](https://circleci.com/gh/krislitman/caffeination_be.svg?style=shield)](https://circleci.com/gh/krislitman/caffeination_be)

# Caffeination

### Rails API Application

**Find local coffee shops near you!**

## Table of Contents

  - [Author](#author)
  - [Getting Started](#getting-started)
  - [Endpoints](#endpoints)
  - [Runing the tests](#running-the-tests)
  - [Built With](#built-with)
  - [Versioning](#versions)
  - [Acknowledgements](#acknowledgements)

## Author

  - **Kris Litman**<br>
    [GitHub](https://github.com/krislitman)<br>
    [LinkedIn](https://www.linkedin.com/in/kris-litman/)

## Getting Started

### API Keys

Before getting started with installation, you will need to create an account and get an API key from
[Yelp](https://fusion.yelp.com/)
Please sign up to get your own copy and include them as environment variables with Figaro.
Run `figaro install` to add your own application.yml file to the application.

### Installing

These instructions will get you up and running with a copy of the project on
your local machine for development and testing purposes.

1. Fork and Clone this repo
2. Install gem packages: `bundle install`
3. Run `rails db:{drop,create,migrate,seed}` -- (you may see errors from pg_restore that you can ignore)
4. Run rails s to start the rails server
5. Enter endpoints (see below) into Postman to see JSON responses!

### Redis

You will need to have Redis installed on your local machine to run the test suite correctly.
Please follow these instructions to install Redis: [Redis](https://redis.io/download).
Run `redis-server` before running the test suite.

## Endpoints

## Running the tests

**Testing with RSpec**
To run the full test suite you will need to run the command:
`bundle exec rspec`

To run individual tests use:
`bundle exec rspec spec/folder/file`

## Built With

- Rails
- PostgreSQL
- Postman
- RSpec
- Capybara
- JSON API Serializer
- HTTParty
- Shoulda Matchers
- Redis
- Factory Bot Rails
- Launchy
- Better Errors

## Versions

- Ruby 3.0.0

- Rails 6.1

## Acknowledgements

- [Yelp](https://www.yelp.com/developers/)
