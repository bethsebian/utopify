## Utopify

### Authors
[Beth Sebian](https://github.com/bethsebian)
[Lenny Meyerson](https://github.com/theobtuseautodidact)
[Justin Pease](https://github.com/Jpease1020)

### The Project
In this project, we converted a single-tenancy store into a multi-tenancy store.

Utopify is a store for carbon-offsets and other environmentally-focused products. We host multiple shops, support 3 levels of users (platform admin, store admin, and customer), and allow store and platform admins to manage site content in their admin areas.

![logo](./app/assets/images/utopify.png)

### To Run Locally
1. Clone repo `$ git clone git@github.com:bethsebian/utopify.git`
2. Install gems `$ bundle install`
3. Set up and seed database `$ rake db:create db:migrate db:seed`
3. Start Rails server `$ rails server`
4. Visit application at `localhost:3000` in your browser

### Highlights
* We manage user permissions through a Permission Service
* Our models hold all the calculations necessary for the site's views.
* We used partials to extract view elements that are repeated.

### Areas for Improvement
* We ran out of time to install a jQuery filter in the display items section of the home page, so the site's entire 500+ items are displayed.
* Controllers could be skinnier.
* Various issues with our views: sizing of item cards needs to be consistent, etc.




