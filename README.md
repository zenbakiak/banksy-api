# README

This project is an assessment.

To start application:

- Clone this repo
- `bundle install`

* Ruby version:

  ruby 2.6.5p114

* System dependencies:
  - Postgres.

* Database creation

  Ensure you have your `config/database.yml` file correctly,
  then run `rake db:create`

* Database initialization:

  `rake db:setup `*

  > \* this will create the database an run migrations and seeds.


* How to run the test suite

  `rspec`

  `rubocop` to check code offenses

* To deploy on heroku:

  - `heroku create`

  - `Add the JWT_SECRET_KEY into your heroku env vars`

  - `git push heroku master`

  - `heroku run rake db:migrate`

  Author:
  [@zenbakiak](https://github.com/zenbakiak)