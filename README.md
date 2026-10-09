# News App

A modern, responsive Flutter news application that delivers real-time headlines, category filtering, global search, and article bookmarking. Built using Flutter, BLoC state management, and Dio HTTP client integration with NewsAPI.

---

## Key Features

- **Authentication System**:
  - **Splash Screen**: Initial loading view leading to authentication or main app navigation.
  - **Login & Signup**: User authentication screens with custom styled input fields and buttons.
- **Dynamic News Feed**:
  - **Top Headlines**: Fetches real-time headlines from NewsAPI based on target region and category.
  - **Category Filtering**: Filter news by categories such as Business, Technology, Sports, Entertainment, Health, and Science.
- **Global Search**:
  - Search articles by keywords using NewsAPI's comprehensive search endpoints.
  - Display search results in a clean list format with instant article preview.
- **Article Details Screen**:
  - View full news stories including article title, high-resolution image, author, publication date, description, and source link.
- **Bookmark & Saved Articles**:
  - Bookmark articles for quick access during the session.
  - View saved articles in a dedicated tab managed reactively via BLoC/Cubit.
- **Curved Navigation Bar**:
  - Smooth animated bottom navigation bar allowing seamless switching between Home, Search, and Saved screens.

---

## Project Architecture & Structure

The application follows a clean modular architecture separating presentation, state management, models, and core helper components:

```text
lib/
├── core/                        # Core app constants and reusable helpers
│   ├── app_color/               # Color palette definitions
│   │   └── app_color.dart
│   ├── app_routes/              # Navigation routes definitions
│   │   └── app_routes.dart
│   ├── helper/                  # Reusable UI elements (Buttons, Fields)
│   │   ├── custom_app_button.dart
│   │   └── custom_app_field.dart
│   └── widgets/                 # Shared UI widgets (NewsItem, CircleIcon)
│       ├── circle_icon.dart
│       └── news_item.dart
├── models/                      # Data models
│   └── article_model.dart       # Article JSON deserialization model
├── ui/                          # Presentation layer (Screens & Logic)
│   ├── home_screen/             # Main storefront / news feed
│   │   ├── home_details_screen/ # Full article detail view
│   │   ├── home_navigator/      # Curved bottom navigation wrapper
│   │   ├── home_cubit.dart      # State management Cubit logic
│   │   ├── home_screen.dart     # Home feed screen widget
│   │   └── home_state.dart      # Cubit state definitions
│   ├── login_screen/            # User login screen
│   │   └── login_screen.dart
│   ├── save_screen/             # Bookmarked articles screen
│   │   └── save_screen.dart
│   ├── search_screen/           # Article search screen
│   │   ├── search_result_screen/
│   │   └── search_screen.dart
│   ├── signup_screen/           # User signup screen
│   │   └── signup_screen.dart
│   └── splash_screen/           # Splash screen
│       └── splash_screen.dart
└── main.dart                    # Application entry point & BLoC initialization
```

---

## Tech Stack & Dependencies

- **Framework**: Flutter SDK (Dart ^3.9.2)
- **State Management**: `flutter_bloc` (^9.1.1)
- **Networking**: `dio` (^5.11.1) for handling REST API requests
- **UI & Navigation**: `curved_navigation_bar` (^1.0.6) for smooth bottom navigation
- **API Integration**: NewsAPI (`https://newsapi.org`)

---

## Getting Started

Follow these steps to set up and run the application locally:

### 1. Prerequisites
Ensure that the Flutter SDK is installed on your machine. Check your installation by running:
```bash
flutter doctor
```

### 2. Clone the Repository
```bash
git clone https://github.com/nda-mohamed/news_app_2.git
cd news_app_2
```

### 3. Fetch Dependencies
Install the required Flutter pub packages:
```bash
flutter pub get
```

### 4. Run the Application
Launch the app on your connected device or emulator:
```bash
flutter run
```

---

## License
This project is created for demonstration and educational purposes.
