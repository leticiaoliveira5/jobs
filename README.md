# Jobs

[![Maintainability](https://api.codeclimate.com/v1/badges/c005119a689e2367251b/maintainability)](https://codeclimate.com/github/leticiaoliveira5/jobs/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/c005119a689e2367251b/test_coverage)](https://codeclimate.com/github/leticiaoliveira5/jobs/test_coverage)
[![Build Status](https://leticiaoliveira5.semaphoreci.com/badges/jobs/branches/master.svg?style=shields)](https://leticiaoliveira5.semaphoreci.com/projects/jobs)

A web application that allows company employees to create and manage job opportunities and find candidates interested in them.

## :white_check_mark: Implemented Features

-   Employee creates account using corporate email, creating company
-   Employee fills in the company data, if he/she is the first person in the company to join
-   Visitor views registered companies
-   Visitor sees job opportunities
-   Guest creates candidate account to confirm registration
-   Candidate fills CV
-   Company employee sees incoming applications
-   Visitors, employees and candidates search for job opportunities by name and by company
-   Company employee makes a job offer to a candidate
-   The candidate sees the proposals received
-   The candidate can accept or reject the proposal
-   Employee approves/disapproves candidate application
-   The job opportunity is deactivated when the required number of applicants is approved
-   System sends email when Application Form is accepted


## :hammer: Work in progress

- Frontend remodel using ViewComponent
- Bug fixes
- Security fixes

## :gem: Current Versions

-   Ruby 3.0.0
-   Rails 7.0.2.4

## :computer: Run locally

### :whale: with Docker

If you have Docker installed, try this:

Clone the repository:

```bash
git clone https://github.com/leticiaoliveira5/jobs.git
```

In the project directory:

```bash
docker-compose build
```

Setup the database:
```bash
docker-compose run --rm web bundle exec rake db:create db:migrate db:seed RAILS_ENV=development
```

And then:

```bash
docker-compose up
```

Now you can access the application at http://localhost:3000/

### :eyes: without Docker

Prerequisites:

-   Ruby 3.0.0
-   Node.js
-   SQLite3

Clone the repository:

```bash
git clone https://github.com/leticiaoliveira5/jobs.git
```

In the project folder, install dependencies:

```bash
bundle install
```

Set up and populate the database:

```bash
rake db:setup
```

Start the application:

```bash
rails server
```

Now you can access the application at http://localhost:3000/

## :key: Logins

-   **candidate**
    -   email: 'candidate@email.com', password: '123456'

-   **employee**
    -   email: 'admin@jobs.com', password: '123456'

## :eyeglasses: Testing the code

Simply run

```bash
rspec
```

## :space_invader: Writen and directed by

  [/leticiaoliveira5](https://github.com/leticiaoliveira5)
