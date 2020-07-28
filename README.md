# ObituaryHub

[ObituaryHub](https://obituary-hub.herokuapp.com/) is a Ruby on Rails application, built by students in Module 3 (of 4) at Turing School of Software and Design in Denver, CO.
It was inspired by the COVID-19 pandemic and the climbing death toll in the United States, as well as the abundance of obituaries being published in honor of victims of COVID-19. Because of the pandemic, we as a society are being forced to deal with the overwhelming death toll in isolation; there are few opportunities to express our grief collectively. The obituary, already a weighty document, has become an essential way that we are able to communicate our grief and to invite others to join us in mourning as well as celebrate the lives of those we've lost.

Many of us can think back to our childhood when our parents or grandparents would read the obituary section of the newspaper, discuss people in the community who had passed away, send condolences to friends and family with whom we were acquainted, and make plans to attend a funeral or memorial. Today, we often find out that friends, family, and community members have passed away on Facebook. It is traumatic to discover a loved one has died while scrolling through the Facebook newsfeed, sifting through ads, politial posts, and memes.

We believe these beautiful expressions of love and sorrow deserve a better ecosystem. This is why we created [ObituaryHub](https://obituary-hub.herokuapp.com/). It is built with the dignity of the deceased in mind as well as the tender hearts of those in mourning. It is a place to celebrate life and honor death.

### Team

[Stella Bonnie](https://github.com/stellakunzang)
[Jack Cullen](https://github.com/jpc20)
[Eric Larson](https://github.com/EricLarson2020)
[Sage Lee](https://github.com/sagemlee)

## Reflection



### Successes

Microservice (link to that section)
Email service
Caching (link to optimization)
javascript/ajax
Search functionality
Oauth

### Challenges

We had originally intended to make our website as friendly as possible to the elderly. To an extent, this was our imagined user. The further along we got in the project, we realized that we (4 millenials?) were building something that we could imagine using and deriving benefit from.

We still have a lot of functionality in our extensions that we weren't able to complete in the 10 days alotted for this project. That is why we have announced on [our website](https://obituary-hub.herokuapp.com/resources) that this project will now be open source and we are inviting others in the Turing community and beyond to make contributions.

We had the normal challenges with remote group work, but were able to rely on GitHub heavily for conversations about code. We had an extremely detailed project board and strict rules that all members must approve a pull requests, including extensive comments both by the person submitting the PR and other group members.

## Tech Stack

 - Ruby 5.1.7
 - Rails 5.2.4.3
 - PostgreSQL
 - Gems
   * [Rack CORS Middleware](https://github.com/cyu/rack-cors)
   * [Factory Bot](https://github.com/thoughtbot/factory_bot_rails)
   * [Faker](https://github.com/faker-ruby/faker)

## Schema

![Schema](/public/images/schema.png)

## Microservice

## API

For this project, we used The New York Times API, and consumed it using a Sinatra microservice.

Endpoints:



## Optimization

## Extensions

The extensions that we were able to complete include:
  * Admin functionality
  * Automated emails
  * Google Oauth

Others on our wishlist:
  * Tagging and search by category
  * Import facebook posts
  * Link together multiple obituaries and tributes for the same deceased person
  * Events for funerals and memorials
  * Visitors can leave comments
  * Obituaries by location displayed on a map
  * Subscribe to notifications for a particular zip code

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

If you would rather enjoy the application in its finished form without messing with the command line, we are hosted on Heroku [here](https://obituary-hub.herokuapp.com/).
