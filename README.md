# BonAppetit

### A Web App for a Food Ordering ans Delivery Service

This a small Web App for a 'Food Ordering and Delivery Service' currently with limited capablities with more functionalities, and building a plug-n-play solution in the future, so 'startups' can readily use the service with zeo setup.  

### Features

 - User Management (Login and Registration)
 - Order Management for Restaurants and Deliverer
 - Realtime Order Status
 - Typical Food Ordering, Payment Workflow.

### Powered By

 - **VueJS** (Webpack)
	 - **Axios** for outbound HTTP requests.
	 - **Vuex** for State Management
	 - **Buefy** - Vue implemetation of **Bulma** CSS Framework
	 - **mdi** Material Design Icons
 - **ExpressJS**
	 - **mysql** (Node JS Connector for MySQL)
	 - **jsonwebtoken** 
 - **MySQL** Database 
 - **ESLint** for ES6 complaint code

### Get It Running
 1. Make sure NodeJS with NPM is installed.
 2. Create a MYSQL database with the schema in **bonAppetit.sql**
 3. Edit MySQL credentials in *bonAppetit/server/src/config/config.js*
 4. Navigate to each of **server** and **client** directory and **npm install** all the dependencies
 5.  After the dependencies have been installed run using **npm run start** in both directories.


