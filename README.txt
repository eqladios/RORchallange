== README

* Ruby version
  2.1.5
  
* Rails version
  4.2.5.1
  
* Getting up and running
$ git clone git@github.com:eqladios/RORchallange.git
$ bundle install
$ rake db:migrate

* Database creation
$ rake db:migrate

* Testing/Trying
When you create an account,the only way you can make it an admin is through Rails Console, I could have done a method to do it but there were more important tasks so ¯\_(ツ)_/¯
All accounts are created as Regular Users
If you try on Heroku
Admin Access:
email: shafik@email.com
password: 88888888

* API for posting trips
There is an API for posting trips where you can send POST request to https://raye7carl.herokuapp.com/api/v1/trips with trips_params
it lacks authentication and many other feautures to make it useful. However, it's just a demo.

* Deployment instructions
Already Deployed on Heroku
https://raye7carl.herokuapp.com/
but typical steps would be:
$ git push heroku master
$ heroku run rake db:migrate
The database on heroku would be empty as Postgresql is used in Production and SQLite3 is used in Development
so you have to populate it. A fix would be using Postgresql on Production, Development and Testing.

* Application feautures
Designed with Bootstrap3, so its UI is dynamic and multi-platforms-friendly
Authentication with Devise with additional required fields(work,home)
Admins and Users multiple views
Join trip through a Bootstrap Modal
Trips and Users are connected through 'Membership' relationship with multiple-index key (trip_id, user_id) to prevent duplications
UI Buttons change upon your access-level
Time and Date fields and formatting in views to match locale time
