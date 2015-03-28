# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

### Login Page 

* Users will be required to login to the web app before being able to access users, projects, or customers databases
* The login credentials will include “email” and “password”
  * Password needs to be at least 8 characters long
  * If users do not remember their password, a “Forgot your password?” option is available
* Forgot your password option will prompt the user for an email address. The application will then check if the email address exists in the database
* If exists, the user will receive reset password instructions via email
* If not, the user will receive an error that the email does not exist 
* Users will be given a “Remember me” option that will keep the user signed in
* Once the user successfully logs in, the website will redirect to a projects page that shows a list of all ongoing projects. 

### Project Page 

All Projects 
* Shows a table that lists all ongoing projects that is saved on the database
  * Column titles: “Name”, “Type”, “Customer”, “Stage”, “Sales Delivery”, “Rental Delivery”, “Rental Pickup”
* Each project listed will have options of “Show”, “Edit”, and “Destroy”
* Show Option – provides the users with a more detailed information page for the selected project including –
  * Customer
  * Project Type
  * Project Stage
  * Sales Delivery
  * Rental Delivery 
  * Rental Pickup
  * Attachments 
* Any documents related to each particular project
  * Customer Interactions presented in a table
* Past projects with the same customer
* Edit Option – allows the users to edit project details including –
  * Name
  * Project Type
  * Project Stage
  * Customer
  * Sales Delivery
  * Rental Delivery
  * Rental Pickup
  * Attachments 
* Ability to add additional documents to the project
* Destroy Option – removes the project from the database 

New Project
* Prompts the user for information required to create a new project 
* Required Information –
  * Name
  * Type
  * Stage
  * Customer
  * Sales Delivery
  * Rental Delivery
  * Rental Pickup
* Optional –
  * Attachments
* When “Create Project” is selected, the application will validate the information entered by the user and save the project if information is valid or output error messages if information is invalid

### Customers Page

All Customers
* Shows a table that lists all customers that is saved on the database
  * Column Titles: “Name”, “Company”, “Email”, “Phone”, “Cell”, “Address”, “Created At”, “Updated At”
* Each customer listed will have options of “Show”, “Edit”, and “Delete”
* Show Option – provides the users with a more detailed information page for the selected customer including –
  * Company
  * Email
  * Telephone
  * Cellphone
  * Address
  * Customer Interactions presented in a table
* Past projects with the customer 
* Edit Option – allows the user to edit customer information including –
  * Name
  * Organization
  * Email
  * Telephone
  * Cellphone
  * Address
  * City
  * State
  * Zip Code
* Delete Option – removes the customer from the database

New Customer 
* Prompts the user for information required to create a new customer 
* Required Information –
  * Name 
    * Min of 2 characters
  * Organization 
    * Min of 2 characters
  * Email
    * Valid email required
  * Telephone
    * 10 characters
    * Must be a number
  * Cellphone
    * 10 characters
    * Must be a number
  * Address line 1 
    * Min of 2 characters
  * City
    * Min of 2 characters
  * State
  * Zip code 
    * 5 characters
    * Must be a numer
* Optional –
  * Address line 2
* When “Create Customer” is selected, the application will validate the information entered by the user and save the customer if information is valid or output error messages if information is invalid

### Inventory Page 

All Inventory
* Shows a table that lists all inventory that is saved on the database
    * Column Titles: “Name”, “Manufacturer”, “Model Number”, “Color”
* Each inventory listed will have options of “Show”, “Edit”, and “Delete”
* Show Option – provides the users with a more detailed information page for the selected inventory including –
  * Name
  * Manufacturer
  * Model Number
  * Color
* Edit Option – allows the user to edit inventory information including –
  * Name
  * Manufacturer
  * Model Number
  * Color 
* Delete Option – removes the inventory from the database

New Style
* Prompts the user for information required to create a new style 
* Required Information –
  * Name 
  * Manufacturer
  * Model Number
  * Color
* Optional –
  * File attachment 
* Additional information about the inventory can be included
* When “Save” is selected, the application will validate the information entered by the user and save the style if information is valid or output error messages if information is invalid

### Users Page

All Users 
* Shows a table that lists all users that is saved on the database
  * Column Titles: “Name”, “Email”, “Role”
* Each user listed will have options of “Show”, “Edit”, and “Delete”
* Show Option – provides the users with a more detailed information page for the selected user including –
  * User ID
  * Name
  * Email
  * Role
* Edit Option – allows the user to edit user information including –
  * Name
  * Password
  * Email
  * Role (from a drop down menu)
    * Sales
    * Customer Service
    * Warehouse
    * Design
* Delete Option – removes the user from the database

New User 
* Prompts the user for information required to create a new user 
* Required Information –
  * Name 
  * Password
  * Password confirmation
  * Email
* Optional –
  * Role (from a drop down menu)
    * Sales
    * Customer Service
    * Warehouse
    * Design
* When “Create User” is selected, the application will validate the information entered by the user and save the style if all required information is valid or output error messages if information is invalid

