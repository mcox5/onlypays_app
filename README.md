# README

**PLAGLAB STORE APP**
This is a project that consist of an analysis of the data of PLAGLAB-STORE, delivering the main results requested by the store manager.

**Getting Started**
The project was build under a MVC architecture, with a MySQL remote database. The name of the tables of the DataBase were the models that were the basics objects to manipulate with the controller (clients, sales, categories, etc). The controller works with the models informations and then the view show all information that the controller gave to it.

**Prerequisites**
List of software and tools required to run the project:
This project was build on a `RUBY ON RAILS` template.

Ruby version: 3.1.2
Rails version: 7.0.4.2
Data base MYSQL: We use a remote database which was delivered by the manager. To access to the configuration, please access to the  `configuration/database.yml`.

**Installing**
Step-by-step instructions on how to install the project:

1. Clone the repository from github
2. Run `bundler` or `bundle install` (Install al the dependences)
3. Database Setup: (It´s configure to access directly to the remote database)
4. Instructions on how to set up the database, such as:
**No need to run: ** `rails db:create` or `rails db:migrate`, because the app works directly with a remote database.


**Running the Application**
Instructions on how to start the application:
**Locally**
`Run rails server`  or `run rails s`
Open your web browser and navigate to http://localhost:3000
**Remote**
The app is in production at the following url: **https://onlypays.osc-fr1.scalingo.io/** (It takes 30 seconds to charge, an other NICETOHAVE is to optimize the queries to the database to load fast)
The production enviroment was made with SCALINGO, which is a similar platform like Heroku, to deploy apps.


**Running Tests (Nice-to-have)**
This app don´t have the tests ready, because I have a problem with the remote DB, because when I execute the `rails test`, automatically tries to reset the database deleting the rows, and I don´t have access to do that.


**Deployment**
Instructions on how to deploy the application to a production environment:
If you made changes:
1. You need first to update the master branch on github `git push origin master`
2. Check the remote connection to SCALINGO `git remote -v` (Need to appears the remote connection to GitHub and Scalingo)
3. Update the changes in Scalingo with `git push scalingo master`

**Configure a web server:**
List of technologies, frameworks, and libraries used in the project:
1. Ruby on Rails
2. MySQL
3. Git and GitHub

**Contributing**
Instructions on how to contribute to the project, such as:

1. Fork the repository
2. Create a new branch with a representive name of the changes you´re doing.
3. Submit a pull request (wait for the main author to accept the changes)
4. Authors: Matías Cox
5. List of the project authors and their contact information: GitHub: mcox5
