# Jobs

A web application that allows company employees to create and manage job opportunities and find candidates interested in them.

### :hammer: Status
_under developement_

### :white_check_mark: Features

#### Implemented:

* Employee creates account using corporate email, creating company
* Employee fills in the company data, if he/she is the first person in the company to join
* Visitor views registered companies
* Visitor sees job opportunities
* Guest creates candidate account to confirm registration
* Candidate fills CV
* Company employee sees incoming applications
* Visitors, employees and candidates search for job opportunities by name and by company
* Company employee makes a job offer to a candidate
* The candidate sees the proposals received
* The candidate can accept or reject the proposal
* Employee approves/disapproves candidate application
* The job opportunity is deactivated when the required number of applicants is approved
* System sends email when Application Form is accepted

#### TBD

* Frontend

### :gem: Prerequisites

* Ruby '3.0.0'
* Rails '~> 6.1.0'
* Node.js
* SQLite3

### Run locally

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

### :key: Logins

#### candidates

  email: 'aline@mail.com', password: '123456'

  email: 'bianca@mail.com', password: '123456'

#### employees

  email: 'fatima@startv.com', password: '123456'

  email: 'monique@startv.com', password '123456'

  email: 'arthur@fly.com', password '123456'

### :eyeglasses: Testes

Run
```bash
rspec
```

### :space_invader: Developer

  [/leticiaoliveira5](https://github.com/leticiaoliveira5)