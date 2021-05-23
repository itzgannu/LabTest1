# iOSParkingApp

Project Requirements and Implementation:
Create an iOS application for the Parking App with the following functionalities:

User Profile

Your app must provide appropriate interface to sign-up, sign-in, sign-out, update profile and delete account. Consider requesting name, email, password, contact number and car plate number from user when they create their account.
If you are inclined and interested in adding profile picture functionality, you may add that in your app. However, it is not the official requirement of the project. No additional grades will be awarded or deducted for including (or not including) this functionality.


Add Parking

The add parking facility should allow the user to create a new parking record with the following information.
- Building code (exactly 5 alphanumeric characters)
- No. of hours intended to park (1-hour or less, 4-hour, 12-hour, 24-hour)
- Car License Plate Number (min 2, max 8 alphanumeric characters)
- Suit no. of host (min 2, max 5 alphanumeric characters)
- Parking location (street address, lat and lng)
- date and time of parking (use system date/time)
You should allow the user to input the parking location in two ways:
- enter street name [In this case the app should obtain location coordinates using geocoding]
- use current location of the device [In this case the app should use reverse geocoding to obtain street address]

After accepting and verifying all information, all parking information must be saved to database. You must use either CoreData or Cloud Firestore to save the records. When adding the parking information in the database, make sure that you associate the record with the currently logged in user.


View Parking

This facility will allow the user to view the list of all the parking they have made. You should display the list with most recent parking first. You should also display the detail view of each parking when user taps on any item of the list. When displaying detail view, display all the information about the parking in appropriate format. In the detail view of parking, allow the user to open the parking location on map and display the route to the parking location from the current location of the device.



PROJECT PROGRESS :

The below details about the progress in the project are specified in the ReadMe file of the branch (SignIn)
- Screenshots of the UI screens designed
- ER-Diagram
- Google firebase plist files & DB details

Sign IN Page is designed with the below options

- User Name & Password field validation
- User Name & Password is saved in the database using FireBase
- When login is success, Navigation to the next page
- Create account button navigates to the account creation page

<img width="750" alt="Screenshot 2021-05-15 at 10 42 13 PM" src="https://user-images.githubusercontent.com/84138047/118372503-8dfda480-b5cf-11eb-8c4f-4fcb11f2f0c1.png">

<img width="750" alt="image" src="https://user-images.githubusercontent.com/84138047/118372527-b1285400-b5cf-11eb-815b-d4e8807d1500.png">

App Screenshot :
![image](https://user-images.githubusercontent.com/84138047/118807154-8c7cf680-b8c5-11eb-81b7-d1e1b5c26461.png)




Create Account Page :

- All required fields created (Name, Email, Password, Phone No, Car No)
- All field validation is done
- On successful account creation, the data is saved to the FireBase under the collection "Account Details"
- Also the username & password is created under the collection "Login Details"

<img width="750" alt="image" src="https://user-images.githubusercontent.com/84138047/118372990-f51c5880-b5d1-11eb-8fae-5fc709dd9024.png">

<img width="750" alt="image" src="https://user-images.githubusercontent.com/84138047/118373002-0bc2af80-b5d2-11eb-9cd3-0d40b7ab9162.png">

<img width="750" alt="image" src="https://user-images.githubusercontent.com/84138047/118373002-0bc2af80-b5d2-11eb-9cd3-0d40b7ab9162.png">

App screenshot: 

<img width="750" ![image](https://user-images.githubusercontent.com/84138047/118807191-9b63a900-b8c5-11eb-9fc6-0fee3048ae9b.png)>


Add Parking Screen :

- Requests all the required details from the user
- A date picker is diplayed only when the date field is clicked
- A pop up/ dialog box appers when the "Enter Location details" is clicked, which will then have options to enter the lat, log or street name"

<img width="750" alt="image" src="https://user-images.githubusercontent.com/84138047/118515173-c7125200-b752-11eb-896f-c3660ee9fede.png">

App Screenshots :

![image](https://user-images.githubusercontent.com/84138047/118807319-bfbf8580-b8c5-11eb-8cc4-92ea07d843fe.png)

![image](https://user-images.githubusercontent.com/84138047/118807338-c817c080-b8c5-11eb-8ad2-fe1bface8cc6.png)


ER-Diagram :

<img width="750" alt="image" src="https://user-images.githubusercontent.com/84138047/118445782-81cb3180-b70c-11eb-9fbf-352e62564cf3.png">




