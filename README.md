# ObituaryHub

## Table of Contents

  1. [Introduction](#intro)
  2. [Team](#team)
  3. [Reflection](#reflection)
  4. [Successes](#successes)
  5. [Challenges](#challenges)
  6. [Tech Stack](#techstack)
  7. [Schema](#schema)
  8. [Design](#design)
  9. [Microservice](#microservice)
  10. [The New York Times API](#nyt)
  11. [Optimization](@optimization)
  12. [Extensions](#extensions)
  13. [Testing](#testing)
  14. [Development Implementation Instructions](#instructions)
  15. [Project Board](#project)

## Introduction <a name="intro"></a>

[ObituaryHub](https://obituary-hub.herokuapp.com/) is a Ruby on Rails application, built by students in Module 3 (of 4) at Turing School of Software and Design in Denver, CO.

It was inspired by the COVID-19 pandemic and the climbing death toll in the United States, as well as the abundance of obituaries being published in honor of victims of COVID-19. Because of the pandemic, we as a society are being forced to deal with the overwhelming death toll in isolation; there are few opportunities to express our grief collectively. The obituary, already a weighty document, has become an essential way that we are able to communicate our grief and to invite others to join us in mourning as well as celebrate the lives of those we've lost.

Many of us can think back to our childhood when our parents or grandparents would read the obituary section of the newspaper, discuss people in the community who had passed away, send condolences to friends and family with whom we were acquainted, and make plans to attend a funeral or memorial. Today, we often find out that friends, family, and community members have passed away on Facebook. It is traumatic to discover a loved one has died while scrolling through the Facebook newsfeed, sifting through ads, politial posts, and memes.

We believe these beautiful expressions of love and sorrow deserve a better ecosystem. This is why we created [ObituaryHub](https://obituary-hub.herokuapp.com/). It is built with the dignity of the deceased in mind as well as the tender hearts of those in mourning. It is a place to celebrate life and honor death.

### Team <a name="team"></a>

[Stella Bonnie](https://github.com/stellakunzang)

[Jack Cullen](https://github.com/jpc20)

[Eric Larson](https://github.com/EricLarson2020)

[Sage Lee](https://github.com/sagemlee)

## Reflection <a name="reflection"></a>

When we originally discussed what our Minimum Viable Product would include and what we wanted displayed on the different pages, the word "community" never came up. As we got further along with the project and started thinking about how we would use it and the benefit we would derive as users, we started describing the obituaries in our database as obituaries from our community.

From a technical and academic standpoint, this project was a success. However, it is much more significant to us that we succeeded in building something that is meaningful and that we believe brings value to our users and our society. Software is built by human beings and for human beings. At times, it is easy to lose sight of this fact and become ensnared in the code, forgetting the end user; this is especially true for us a Back End developers. This project gave us an opportunity to deeply think about and connect with our end users, and this experience will certainly inform the trajectory our careers take after our graduation from Turing.

All this said, there are still things that we want to improve and expand. We have elaborated on these in the section titled [Challenges](#challenges)

### Successes <a name="successes"></a>

[Microservice](#microservice)

[Caching](#optimization)

**Email service**

  Using the Sendgrid API in conjunction with Rails mailers, we are able to send emails on behalf of our users. When you visit the show page for a particular you should see a button to share the obituary with someone else. This button takes you to a form where you add your email and the email address of the person you want to share the obituary with. When you hit submit, we automatically send an email to that person. This piece of functionality was completed by [Sage Lee](https://github.com/sagemlee).

**Javascript**

  As students in the Back End Software Engineering program at Turing, this was our first project that implemented Javascript. The first piece we added was very simple JS for our flash messages. When you login for instance you will see a message pop up verifying that you are logged in. This box has an 'x' in the top right corner, so you can close it without having to reload the page.

  The second implementation of JS was significantly more complicated. We wanted to be able to display search results from our local database and The New York Times on the same page without having to stack the two tables awkwardly. We couldn't render them all in one table since they display different data. We dreamed of creating a page with two tabs: one for results from our community and one that displayed results from NYT. With great effort, [Jack Cullen](https://github.com/jpc20) learned basic JS and JQuery and created exactly the functionality we dreamed of!

**OAuth**

  Visitors to ObituaryHub have the option to sign-up for an account and login using either Google or Facebook using omniauth. Google was relatively easy to setup compared to Facebook, whose documentation was challenging to parse. We ended up having to create different apps on their site: one for testing and one for production. This functionality was completed painstakingly by [Sage Lee](https://github.com/sagemlee). [Jack Cullen](https://github.com/jpc20) helped to get Google up and running.

### Challenges <a name="challenges"></a>

We had originally intended to make our website as friendly as possible to the elderly. To an extent, this was our imagined user. The further along we got in the project, we realized that we (4 millenials) were building something that we could imagine using and deriving benefit from. Since we were all very new to Front End Development, we struggled with getting basic functionality accomplished, let alone taking into account extra accessibility issues. We hope that someone will join our efforts in the future and help us to accomplish this goal.

As for the more mundane, we had all the normal challenges with remote group work, but were able to rely on GitHub heavily for conversations about code. We had an extremely detailed project board and strict rules that all members must approve a pull requests, including extensive comments both by the person submitting the PR and other group members. This helped us catch errors and also get better acquainted with the code that each other was contributing to the project.

This is still a work in progress and there are definitely still many bugs. For example, the table columns for search results aren't sized correctly and when you condense the window width-wise while on a show page the text overlaps with the image. Though we are excited about the JS tabs on the search results page, from a UX standpoint there is room for improvement. Furthermore, we have a lot of functionality in our extensions that we weren't able to complete in the 10 days alotted for this project. That is why we have announced on [our website](https://obituary-hub.herokuapp.com/resources) that this project will now be open source and we are inviting others in the Turing community and beyond to make contributions.

## Tech Stack <a name="techstack"></a>

 - Ruby 5.1.7
 - Rails 5.2.4.3
 - PostgreSQL
 - Sendgrid
 - JQuery
 - Heroku
 - TravisCI
 - Sinatra
 - Omniauth

## Schema <a name="schema"></a>

Our database is extremely simple for this project, since we are sourcing a lot of our data from NYT and not storing it in our database. In the future we would like to have separate tables for events and NYT obituaries that have been bookmarked or designated "Editor's Choice".

![Schema](/public/schema.png)

## Design Strategy <a name="design"></a>

Since this was a school project, we tried our best to demonstrate our understanding of the 4 Pillars of Object Oriented Programming as well as ReSTful APIs and ReSTful routes. Evidence of these efforts can be found in the encapsulation of our microservice, our use of partials for rendering the different views, and our adherence to MVC. Within the Turing community, MVC means "skinny controllers" and "bulkier models"; therefore, we pushed all logic into models (as well as poros and facades).

All our API endpoints are ReSTful, compliant with the JSON API spec through the use of serializers, and exposed under an api/v1 namespace. Versioning will come in handy as this project continues to expand; when we make changes to the API down the road, we will be able to distinguish those changes using a `v2` namespace.

It is our understanding that the emphasis on ReSTful architecture at Turing is because this makes our app easier for both end users and developers to engage with. Following best practices isn't just a flex - it is an act of kindness.

## Microservice <a name="microservice"></a>
For this project, we used [The New York Times API](https://developer.nytimes.com/), and consumed it using a Sinatra microservice, which was built by [Jack Cullen](https://github.com/jpc20) and [Eric Larson](https://github.com/EricLarson2020).

You can find the endpoints from our microservice listed in the README for that project [here](https://github.com/jpc20/obituary_microservice)

### NYT Endpoints <a name="nyt"></a>

All requests below are tacked onto the end of this root URL: [https://api.nytimes.com/svc/search/v2//articlesearch.json](https://api.nytimes.com/svc/search/v2//articlesearch.json)

  Returns all obituaries:

    `GET ?fq=new_desk:(obituaries)&fq=section_name:(obituaries)`

  Returns obituaries that contain the name provided:

    `GET ?fq=headline:("#{name}") AND section_name:(obituaries)&q=relevance`

  Returns obituaries for individuals who died from COVID-19:

    `GET ?fq=section_name:(obituaries)&q=coronavirus`

  Returns obituaries that were published on a particular date:

    `GET ?fq=section_name:(obituaries)&facet_fields=pub_year&facet=true&begin_date="#{beginning_date}"&ending_date="#{ending_date}"`

  Returns most recently published obituaries:

    `GET ?fq=section_name:(obituaries)&sort=newest`

  Returns obituaries that match the name and year provided:

    `GET ?fq=section_name:(obituaries) AND headline:("#{name}") AND pub_year:("#{year}")`

  Returns obituaries that were published during a given year:

    `GET ?fq=section_name:(obituaries) AND pub_year:("#{year}")`

## Optimization <a name="optimization"></a>

The requirements of this project dictated we needed to implement one of three different types of optimization. We chose to focus on caching. All obituaries from our database are cached so that when a page is reloaded of the obituary appears on another page the results have already been cached and the website loads quickly because it is not making a redundant request of our database. The caching portion of our project was implemented single-handedly by [Eric Larson](https://github.com/EricLarson2020).

## Extensions <a name="extensions"></a>

The extensions that we were able to complete include:
  * Automated emails
  * Google Oauth

Future iterations:
  * Admin is able to designate an obituary "Editor's Choice"
  * Tagging and search by category
  * Import facebook posts
  * Link together multiple obituaries and tributes for the same deceased person
  * Events for funerals and memorials
  * Visitors can leave comments
  * Obituaries by location display on a map
  * Subscribe to notifications for a particular zip code

## Testing <a name="testing"></a>

For testing we used RSpec with [Capybara](https://github.com/teamcapybara/capybara), [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers), [FactoryBot](https://github.com/thoughtbot/factory_bot_rails) and [Faker](https://github.com/faker-ruby/faker) gems, as well as [SimpleCov](https://github.com/colszowka/simplecov) to determine our test coverage and pinpoint areas that were overlooked.

As of writing this, our test coverage is 99.7%.

![TravisCI Badge](/public/travis_badge.png)

## Development Implementation Instructions <a name="instructions"></a>

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

## Project Board <a name="project"></a>

If you would like to contribute, this project is open source and you are welcome to check out our project board and see if there are any issues you feel enthusiastic about completing. Once you submit a PR with detailed comments explaining how your code improves our existing code base, we will be happy to participate in a code review and merge your code into production.
