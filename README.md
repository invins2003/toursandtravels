Overview
The app will have multiple features: Cab Rental, Tour Packages and Holidays, and Bus Booking. It
will include authentication (login, registration), user settings, and notification management. This
documentation covers the UI components, their purposes, and navigation flow for each feature.
1. Home Screen
Purpose
To provide users with access to the main features of the app.
Components
• AppBar: Contains the title and a menu icon.
• Drawer: Contains links to Home, Cab Rental, Tour Packages, Bus Booking, Settings, etc.
• ListView or GridView: Main options for navigation.
o Card: Cab Rental
▪ Icon: Cab icon
▪ Text: "Cab Rental"
▪ OnTap: Navigate to Cab Rental Form Screen.
o Card: Tour Packages
▪ Icon: Tour packages icon
▪ Text: "Tour Packages"
▪ OnTap: Navigate to Tour Packages Homepage.
o Card: Bus Booking
▪ Icon: Bus icon
▪ Text: "Bus Booking"
▪ OnTap: Navigate to Bus Booking Seat Selection Screen.
Navigation
• Each card navigates to the respective feature screen.
2. Authentication
Login Screen
Purpose: Authenticate users to access the app.
Components:
• TextFormField: Email
• TextFormField: Password (obscured)
• Button: Login
• Button: Register (for new users)
• Button: Forgot Password
Navigation:
• On successful login, navigate to the Home Screen.
• On register, navigate to the Registration Screen.
• On forgot password, navigate to the Password Recovery Screen.
Registration Screen
Purpose: Register new users.
Components:
• TextFormField: Full Name
• TextFormField: Email
• TextFormField: Mobile Number
• TextFormField: Password
• TextFormField: Confirm Password
• Button: Register
Navigation:
• On successful registration, navigate to the Login Screen.
Password Recovery Screen
Purpose: Allow users to recover their password.
Components:
• TextFormField: Email
• Button: Send Recovery Link
Navigation:
• On successful submission, show a confirmation message and navigate back to the Login
Screen.
3. Cab Rental
Cab Rental Form Screen
Purpose: Collect user information for booking a cab.
Components:
• TextFormField: User Name
• TextFormField: Mobile Number
• TextFormField: Email
• DropdownButton: Vehicle Type
• DatePicker: Date of Journey and Time
• DatePicker: End of Journey
• TextFormField: Visiting Place
• Button: Submit
Navigation:
• On submit, navigate to the Available Vehicles Screen.
Available Vehicles Screen
Purpose: Display a list of available vehicles based on the user’s input.
Components:
• ListView: List of vehicles with details (e.g., image, vehicle type, price, availability).
• Button: Select Vehicle
Navigation:
• On selecting a vehicle, navigate to the Address and Payment Screen.
Address and Payment Screen
Purpose: Collect address details and process advance payment.
Components:
• TextFormField: Address Line 1
• TextFormField: Address Line 2
• TextFormField: City
• TextFormField: State
• TextFormField: ZIP Code
• Payment Integration: Payment gateway for advance payment
• Button: Proceed to Payment
Navigation:
• On successful payment, display a confirmation message and navigate back to the main
menu.
4. Tour Packages and Holidays
Homepage with Tour Packages
Purpose: Display available tour packages with images and brief descriptions.
Components:
• GridView or ListView: Tour packages with images, names, and brief descriptions.
• Card: Each card represents a tour package.
• Button: View Details
Navigation:
• On clicking view details, navigate to the Tour Package Details Screen.
Tour Package Details Screen
Purpose: Show detailed information about the selected tour package.
Components:
• Image: Tour package image
• Text: Tour package name
• Text: Detailed description
• Text: Price
• Button: Book Now
Navigation:
• On clicking Book Now, navigate to the Personal Details Form Screen.
Personal Details Form Screen
Purpose: Collect user personal details for booking the tour package.
Components:
• TextFormField: Full Name
• TextFormField: Mobile Number
• TextFormField: Email
• TextFormField: Address
• Button: Submit
Navigation:
• On submit, process the payment and show confirmation.
5. Bus Booking (myshivambus.in)
Seat Selection Screen
Purpose: Allow users to select available seats on the bus.
Components:
• GridView: Bus seat layout with selectable seats.
• Button: Proceed
Navigation:
• On selecting seats and clicking proceed, navigate to the Personal Details Form Screen.
Personal Details Form Screen
Purpose: Collect user personal details for bus booking.
Components:
• TextFormField: Full Name
• TextFormField: Mobile Number
• TextFormField: Email
• Button: Submit
Navigation:
• On submit, process the payment and show confirmation.
6. Settings Screen
Purpose: Provide user settings and preferences.
Components:
• ListTile: Edit Profile
o Icon: User icon
o Text: "Edit Profile"
o OnTap: Navigate to Edit Profile Screen
• ListTile: Change Password
o Icon: Lock icon
o Text: "Change Password"
o OnTap: Navigate to Change Password Screen
• ListTile: Notification Preferences
o Icon: Notification icon
o Text: "Notification Preferences"
o OnTap: Navigate to Notification Preferences Screen
• ListTile: Logout
o Icon: Logout icon
o Text: "Logout"
o OnTap: Perform logout action and navigate to Login Screen
Navigation:
• Each list tile navigates to the respective settings screen.
Edit Profile Screen
Purpose: Allow users to edit their profile information.
Components:
• TextFormField: Full Name
• TextFormField: Mobile Number
• TextFormField: Email (non-editable)
• Button: Save Changes
Navigation:
• On successful save, show a confirmation message and navigate back to the Settings
Screen.
Change Password Screen
Purpose: Allow users to change their password.
Components:
• TextFormField: Current Password
• TextFormField: New Password
• TextFormField: Confirm New Password
• Button: Change Password
Navigation:
• On successful change, show a confirmation message and navigate back to the Settings
Screen.
Notification Preferences Screen
Purpose: Allow users to manage notification settings.
Components:
• SwitchListTile: Email Notifications
o Text: "Email Notifications"
o Switch: Enable/disable email notifications
• SwitchListTile: SMS Notifications
o Text: "SMS Notifications"
o Switch: Enable/disable SMS notifications
• SwitchListTile: Push Notifications
o Text: "Push Notifications"
o Switch: Enable/disable push notifications
Navigation:
• On any change, save preferences and show a confirmation message.
Receipts
Purpose: Send booking receipts to user and admin emails, and via text message.
Triggers:
• After successful payment for cab booking or bus ticket booking.
Components:
• PDF Generation: Generate PDF receipt
• Email Service: Send PDF receipt to user and admin
• SMS Service: Send receipt details via text message
Summary of Navigation Flow
1. Home Screen:
o Main options for Cab Rental, Tour Packages, Bus Booking.
o Drawer for additional navigation options (e.g., Settings).
2. Authentication:
o Login Screen → Home Screen
o Registration Screen → Login Screen
o Password Recovery Screen → Login Screen
3. Cab Rental:
o Cab Rental Form Screen → Available Vehicles Screen → Address and Payment
Screen
4. Tour Packages:
o Homepage with Tour Packages → Tour Package Details Screen → Personal Details
Form Screen
5. Bus Booking:
o Seat Selection Screen → Personal Details Form Screen → Payment
6. Settings:
o Settings Screen → Edit Profile Screen
o Settings Screen → Change Password Screen
o Settings Screen → Notification Preferences Screen
o Settings Screen → Logout → Login Screen
