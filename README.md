# HNG TASK 2

This is my assignment submission for the HNG stage two task. I was tasked to create a simple shopping app that has two items on the dashboard and displays items statically.

## Features

- Display a static list of products.
- Add and remove items from the checkout list.
- Navigate to an order successful screen from the checkout screen.
- Built using only native Flutter components (no third-party dependencies).

## Screenshots

### Products screen displaying a list of products.

![Products Screen](screenshots/products-screen.png)

### Checkout screen displaying items added for checkout.

![Checkout Screen](screenshots/checkout-screen.png)

### Order successful screen confirming the order.

![Order Successful Screen](screenshots/order-success-screen.png)

## Setup Instructions

### Prerequisites

- Flutter installed on your machine. Follow the instructions [here](https://flutter.dev/docs/get-started/install) to install Flutter.

### Steps

1. **Clone the Repository**

   ```sh
   git clone https://github.com/immadominion/simple_shopping_app.git
   cd simple_shopping_app

   ```

2. **Get Flutter Packages**

   ```sh
   flutter pub get

   ```

3. **Run the App**
   ```sh
   flutter run
   ```

## Appetize Demo

- You can view a live demo of the app on Appetize.io ([here](https://appetize.io/app/6fjrlfbjvtm2gv5nqkmundefwy?device=pixel7&osVersion=13.0))

## Project Structure

    lib/
    |- main.dart
    |- models/
    |   |- product.dart
    |- screens/
    |   |- products_screen.dart
    |   |- checkout_screen.dart
    |   |- order_successful_screen.dart
    |- widgets/
    |- product_item.dart

## Code Overview

### Models

- Product Model (lib/models/product.dart): Defines the structure of a product with id, title, and price.

### Screens

- Products Screen (lib/screens/products_screen.dart): Displays a list of products.
- Checkout Screen (lib/screens/checkout_screen.dart): Displays the products added for checkout and a button to navigate to the order successful screen.
- Order Successful Screen (lib/screens/order_successful_screen.dart): Displays a message confirming the order.

### Widgets

- Product Item Widget (lib/widgets/product_item.dart): Represents a single product item in the list.

### Main file

- Main File (lib/main.dart): Contains the main entry point of the app, sets up navigation, and manages the state of the checkout list.
