
# TV Shows App

## Overview

This Flutter application demonstrates a simple TV shows app with a splash screen, login screen, and home screen. It retrieves TV show data from an API and displays detailed information for each show. The app uses `ChangeNotifier` for state management and `cached_network_image` for handling image loading with placeholders.

## Features

- **Splash Screen**: Displays an introductory screen before navigating to the login screen.
- **Login Screen**: Validates user credentials with a fixed username and password (`admin`/`admin`).
- **Home Screen**: Displays a list of TV shows based on the search query "pokemon", fetched from the [TVMaze API](https://api.tvmaze.com/search/shows?q=pokemon).
- **Detail Screen**: Shows detailed information about a selected TV show.

## Technologies Used

- Flutter
- Dart
- `cached_network_image` for image caching and loading
- `provider` for state management
- `mockito` for unit testing

## Setup

### Prerequisites

- Flutter SDK installed
- Dart SDK installed

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/tv-shows-app.git
   cd tv-shows-app
   ```
2. **Install Dependencies**
   
   ```bash
    flutter pub get
   ```
3. **Run the Application**

   ```bash
   flutter run
   ```

## Application Structure
- lib/main.dart: Entry point of the application.
- lib/screens/: Contains screen widgets (e.g., SplashScreen, LoginScreen, HomeScreen, DetailScreen).
- lib/providers/: Contains state management classes (e.g., TVProvider).
- lib/widgets/: Reusable widgets (e.g., RoundedImage for displaying images).

### Run Test

   ```bash
   flutter test
   ```

## Code Explanation

##  ShowsProvider
The ShowsProvider class is a ChangeNotifier that manages the state of the TV shows data and handles API requests. It fetches data from the TVMaze API and updates the UI.

### Key Methods:

- fetchShows(String query): Fetches a list of TV shows based on the search query.
- fetchShowDetails(int id): Fetches detailed information about a specific TV show.
### RoundedImage
This widget uses the cached_network_image package to display images with rounded corners and handles placeholders and errors gracefully.

### Future Improvements
- Error Handling: Improve error handling and user feedback for network issues.
- User Authentication: Implement real authentication and user management.
- UI Enhancements: Enhance UI/UX for a more polished look and feel.