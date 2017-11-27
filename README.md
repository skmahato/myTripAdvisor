<<<<<<< HEAD
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

* ...
=======
# myTripAdvisor
>>>>>>> 1ff5e120a22efa3be3e6b70b8a32e75ee23fcc29

You need to create a working, demonstrable and usable project using the Rails 5 framework.The project source code can live on Github and be deployed to Heroku (optional). You need to use Bootstrap framework for styling the views and pages.



Online Travel Rating/Review System

Build a web application to get the ratings and reviews of hotels etc. Users can search and find the ratings/reviews for the particular hotel they are looking for. The website will be something similar to TripAdvisor www.tripadvisor.in

User Access Control:

There will be two types of user categories - Admin and Regular User.

    The admin will be able to access all the features like create hotels along with the details like Overview, Provide Ratings and Reviews. The admin can edit, delete the existing data, approve and Reject regular users comments, ratings and review.


    Admin features should be under “/admin” path, After admin’s approval of ratings / reviews then only it should be publicly visible, for this feature you should save reference of admin user in approved_by column.   


    The regular user will be able to create account with Email Address and Password. Once login to the site, the users will be able to view hotels details like overview, ratings / reviews. Also the user can provide ratings and reviews and can comment on the other users reviews.


    Also the users will be able to sign in through their Social Network account like via Twitter


    While logging if the users put wrong Email Id or Password, it will show an error validation message.


    The Homepage will show the Hotels list along with Name, Ratings and Price, Contact Email.


Extension:

    The users will be able to upload photos of the hotels.


    Once the users will login to the site, they will be able to email to the hotels directly to know the booking status.


    There will be a search parameters for the hotels where the users have to give the check-in and check-out date for which date pickers should be there.


    The search filtration will be there to get the results based on Price, Location, Ratings, Number of Guests etc.
