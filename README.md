# ObituaryHub

[ObituaryHub](Heroku site url) is a Ruby on Rails application, built by students in Module 3 (of 4) at Turing School of Software and Design in Denver, CO.

### Team

[Stella Bonnie]()
[Jack Cullen]()
[Eric Larson]()
[Sage Lee]()

## Reflection

### Successes

### Challenges

## Tech Stack

 - Ruby 5.1.7
 - Rails 5.2.4.3
 - PostgreSQL
 - Gems
   * [Fast JSON API](https://github.com/Netflix/fast_jsonapi)(Thanks Netflix!)
   * [Rack CORS Middleware](https://github.com/cyu/rack-cors)
   * [Factory Bot](https://github.com/thoughtbot/factory_bot_rails)
   * [Faker](https://github.com/faker-ruby/faker)

## Schema

![Schema](/public/images/schema.png)

## API

## Microservice

## Optimization

## Extensions

## Implementation Instructions

First you'll need these installed:
### Versions
- Rails 5.2.0
_(to find out what version you are using, run `$ rails -v` in the command line)_
- Ruby 2.5.x
_(`$ ruby -v`)_

Next, clone down this repository onto your local machine.
Run these commands in order to get required gems and database established.
- `$ bundle install`
- `$ bundle update`
- `$ rake db:create`
- `$ rake db:migrate`
- `$ rake db:seed`

Once this is all set up and you aren't getting any errors you can run our test suite.

- `$ bundle exec rspec`

If you would rather enjoy the application in its finished form without messing with the command line, we are hosted on Heroku [here]().
