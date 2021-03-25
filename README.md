<h1> Jobs </h1>

The application allows people who work in the same company create and manage job opportunities and find candidates interested in them.

![root_path](root_path.png)

<h1> Status </h1>

Under development

<h1>Functionalities</h1>

<br> [X] Employee creates account using corporate email, creating company
<br> [X] Employee fills in company data, if the first person in the company to join
<BR> [X] Visitor views registered companies
<br> [X] Visitor views job opportunities
<br> [X] Visitor creates candidate account to confirm application
<br> [X] Candidate fills resume
<br> [X] Company employee views applications received
<br> [X] Visitors, employees and candidates search job opportunities by name and by company
<br> [X] Company employee makes a job proposal to a candidate
<br> [X] Candidate sees proposals received
<br> [X] Candidate can accept or reject proposal
<br> [X] Employee approves/disapproves candidate's application
<br> [X] Job opportunity is deactivated when the needed number of candidates are approved

<h1>Ruby version</h1>

'3.0.0'

<h1>Rails version</h1>

'~> 6.1.0'

<h1>How to run the application</h1>

In your terminal...<br>

Install Node.js

<p><code>sudo apt-get install nodejs</code></p>

Clone the project:

<p><code>git clone https://github.com/leticiaoliveira5/jobs</code></p>

Go to project folder:

<p><code>cd ~/jobs</code></p>

Install dependencies:

<p><code>bundle install</code></p>

To populate the database:

<p><code>rake db:setup</code></p>

Run:

<p><code>rails server</code></p>

Now you can use the application on your web browser from http://localhost:3000/

<h1>Seeds</h1>

Database populated via file <code>db/seeds.rb</code>
<br>Pre-saved logins:
<br>candidates:
<br>email: 'aline@mail.com', password: '123456'
<br>email: 'bianca@mail.com', password: '123456'
<br>employees:
<br>email: 'fatima@startv.com', password: '123456'
<br>email: 'monique@startv.com', password '123456'
<br>email: 'arthur@fly.com', password '123456'

<h1>Languages</h1>

Ruby 
<br>HTML 
<br>CSS 
<br>JavaScript 

<h1>Tests</h1>

Run <code>rspec</code>


<h1>Coded by Letícia Oliveira</h1>

leoliveira994@gmail.com