# CSCI4100U Group Project
---
App Name: Zamazon

Group Members: Gowtham Rajendra, Ivan Wang, Ravi Pogaku

## Overview
---
The app that our group made is a delivery app that allows users who have created an account to make pruchases on a variety of different products online and hace it delivered to where ever they want within Canada.

ACCOUNT FOR THE PROFESSOR:
USERNAME: prof@coolguy.com
PASSWORD: Password1

## Group Members
---
| Members | Contributions |
| ------ | ------ |
| Gowtham | Home page, Product page, Shopping cart and wishlist, local storage, geocoding and geolocation, data tables and charts, general UI, setup firestore |
| Ivan | Sign in and sign up page, settings page, theme changer, regex for authentication, local storage, localization, and technical report |
| Ravi | Checkout page, Firebase authentication for sign in and sign up,contributed to regex, web scraping, notifications, general UI, setup firestore |

## Code Design
---
In the coding design process, we follow more of the Agile software development. In other words, we break up the massive project into smaller parts in order to spend less time planning for features that may or may not even be in the final product. During the course of development for the app, we were constantly changing the app in order to integrate more features into it. Many widgets and files within the project was created as a result of this since we create them as we realize that we needed them.

## Guide to the App
---
To use the app, one would first have to download the app and have access to working internet. When opening the app, they would first be greeted by a welcoming screen prompting them to login. If the user has no account then they can enter the create account page by clicking the highlighted "create an account" back at the sign in page. After filling out the informations needed on the sign up page, they will be redirected to the customer information page where they must fill out their name and address. Doing so will finally allow them to access the store. Within the homepage are numerous products that the user can click to see more informations such as brand, rating, price, descriptions and option to add them to cart or wish list via the heart next to the add to cart button. The search bar on the home page can be use to search for a more specfic product if the product the user is looking for is not on the home page. On the bottom of the screen is a navigation bar that allows the user to swap between the different pages ranging from the home page, user profile page, shopping cart, wish list, and settings. On home page, one can add any products that takes their fancy and add them to either the shopping cart or wish list. User profile page is where the user can change their name or address if it was ever change or incorrect. Items that the user added from the homepage can be viewed from both the shopping cart and the wish list page with the difference being that users can not make purchases on the wish list and must add them to shopping cart in order to be able to purchase the product. In the shopping cart page, there will be a total cost of all the products within that page added together as well as a head to checkout on the bottom if there are items in this page other wise it will be empty. The checkout at shopping cart page will direct the user to the checkout page where a final confirmation is needed before the purchase can be finalized. Once the purchase is finalize, the user can go to the order history to see where their order is on the map as well as the route it is taking. Once the delivery has arrived, a notification will go off in order to inform the customer that their order has arrived. The last page is the settings page, within here, the user can freely change the theme of the entire app from 2 different modes and change the language of the app as well.

## Functional Requirements
---
| Members | Contributions |
| ------ | ------ |
| Multiple screens and Navigation | This was use to create all the variety of pages needed to make this app work, the bottom navigation bar allows the user to switch between multiple screens to show all the pages within the app.  |
| Dialogs and Pickers | Dialogs and Pickers were use to choose the size of products if there was more than one option for size. |
| Snackbars and Notifications | Snackbar is used to greet the user whenever they log in or log off while notification is used to notify the user when their product arrives. |
| Local Storage | Local storage was use to store the variable of themes, this way, themes will stay as whichever theme the user pick even if they close the app. |
| Cloud Storage | Firestore was used for the cloud storage part. In here, all the customers information are store here and product information is also generated and pulled from here. |
| Data Tables and Charts | Data tables was use to show the user their order history. |
| Maps | Maps is use in conjection with geocoding to display product and the route to their destination. |
| Geolocation | Geolocation is used for the address bar where a button lets the user choose their current location as their shipping address. |
| Geocoding | Maps is use in conjection with geocoding to display product and the route to their destination. |
| Internationalization | Internationalization is used to change the language for all static texts. |

## Citations
https://github.com/Imperial-lord/mapbox-flutter - Map Routes, Address Search Bar
www.youtube.com/@JohannesMilke - Used multiple tutorials from this channel
https://stackoverflow.com
https://github.com/CSCI4100U/LectureExamples2022 
