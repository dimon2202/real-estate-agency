# Real Estate Company Website

This project is a real estate company website built using JavaScript (AJAX), PHP, phpMyAdmin (SQL), and the Google Maps API. The website allows users to add, view, and manage real estate listings.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [API Keys](#api-keys)
- [Contributing](#contributing)
- [Views](#views)

## Features

- Add real estate listings with details such as type, repair type, address, floor, number of rooms, space, year of construction, description, and cost.
- Use Google Maps API to get coordinates for the listing address.
- Display listings dynamically with AJAX.
- Server-side handling of listing data using PHP and MySQL.

## Installation

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your-username/real-estate-website.git
    cd real-estate-website
    ```

2. **Setup the Database:**

    - Create a new MySQL database using phpMyAdmin.
    - Import the provided SQL file to set up the necessary tables.

3. **Configure the Backend:**

    - Update the database configuration in `config.php` with your database credentials.

4. **Set Up the Google Maps API:**

    - Obtain a Google Maps API key from the [Google Cloud Console](https://console.cloud.google.com/).
    - Replace the placeholder API key in your JavaScript file with your actual API key.

5. **Start the Server:**

    - Ensure your web server (e.g., Apache) is running and serving the project directory.

## Usage

- Open the website in your browser.
- Use the form to add new real estate listings.
- View the list of added listings on the main page.
- Listings are added and displayed dynamically using AJAX.

## Folder Structure

- `index.php` - The main entry point of the website.
- `zapyt.php` - Server-side script to handle form submissions and database interactions.
- `zapyt.js` - JavaScript file containing AJAX logic and form validation.

## API Keys

- Ensure you replace any placeholder keys with your actual Google Maps API key.

## Views

![image](https://github.com/dimon2202/real-estate-agency/assets/114134488/e52ad3cc-83bc-4d6f-9103-85cf9711db8e)
![image](https://github.com/dimon2202/real-estate-agency/assets/114134488/e106f810-1b87-4f13-b441-aadf45e654c4)

