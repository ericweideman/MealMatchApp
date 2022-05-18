# MealMatchApp v0.0.1

Tinder but for dinner. A side project that utilizes the Yelp Fusion database to present information about 
local restuarants. Play with a partner in this swipe style interface to help settle the never ending question about 
what to eat for dinner.

Current Capabilities: 
* Builds a Yelp HTTPRequest based on search paramaters to retrieve on up to 50 local restaurants
* Parses the JSON response
* Displays the information in a CardView
    . includes converting the rating of the restaurant (a Double) to an image in accordance with Yelp Display Guidelines
    . correctly attributes the information to the Yelp database


Features to be added:
* Swipe gesture for the card view
* "More Photos" View
* Bottom Tab view to replace navigation view
* Add a view to change the search parameters 
* Add button to end user round and pass to partner
* Add animation while app downloads JSON data

Known bugs: 
* Application Crashes when if MealSwipeView is presented while [Buisiness] is empty or if user advances past the last business in the array. 
* CardView does not scale for screens smaller than the iPhone 12

