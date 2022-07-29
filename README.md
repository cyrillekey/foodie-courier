# Foodie Courier App


Foodie Courier app is a cross platform mobile application built in [flutter](https://flutter.dev/) and consumes a custom [spring-boot rest api](https://github.com/cyrillekey/restaurant-backend). The app allows courier to deliver make delivery of food ordered on the [Foodie Customer App](https://github.com/cyrillekey/foodie-app)

## Getting Started

Follow these instructions to build and run the project

### Setup Flutter

A detailed guide for multiple platforms setup could be find [here](https://flutter.dev/docs/get-started/install/)

### Setup Project

- Clone this repository using `git clone https://github.com/cyrillekey/foodie_courier`.
- `cd` into `gamereview`.
- `flutter pub get` to get all the dependencies.
- Generate files using Builder Runner (**required**) 
```
flutter pub run build_runner build --delete-conflicting-outputs
```



### Running the app

Make sure you have a connected Android/iOS device/simulator and run the following command to build and run the app in debug mode.

`flutter run`

#### Firebase Configuration

- Follow these steps to setup firebase. [Firebase setup](https://firebase.google.com/docs/flutter/setup?platform=android)


#### Google Configuration
- Follow the following steps to set up release signing for the app.[Release Signing.](https://docs.flutter.dev/deployment/android)
## Project Structure


## Features

### Account

- Authentication
- Edit Account Details
- Switch Account Status
- Change Account Password

### Delivery
- Push Notifications On New Orders
- Update Location To Server In The Background
- Accept Order To Deliver
- Google Maps Direction To Destination
- Get past Delivered Orders
- Pick Up New Orders If Free
- Scan Qr Code To Deliver Order
## Screenshots

<p>
<img src="https://github.com/cyrillekey/foodie_courier/blob/main/flutter_01.png?raw=true" alt="Splash View" width="200">
</p>



## Contributing

Whether you have some feauture requests/ideas, code improvements, refactoring, performance improvements, help is always Welcome. The more is done, better it gets.

If you found any bugs, consider opening an [issue](https://github.com/cyrillekey/foodie_courier/issues/new).

## License

This project is licensed under the [MIT License](LICENSE).