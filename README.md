# mini_whatsapp

```
lib/
│
├── main.dart                  # Entry point of the app
├── mini_whatsapp.dart         # Main widget for the Mini WhatsApp app
│
├── src/
│   ├── core/                  # Core functionalities and utilities
│   │   ├── utils/             # Core utility functions
│   │   │   ├── helpers.dart       # Helper functions for the app
│   │   │   └── validators.dart     # Validation functions (e.g., for forms)
│   │   ├── constants/         # Core constant values
│   │   │   ├── app_constants.dart  # General app constants
│   │   │   └── color_constants.dart # Color constants
│   │   ├── theme/             # Core theme and styling
│   │   │   ├── app_theme.dart      # App-wide themes and styles
│   │   │   ├── text_theme.dart      # Text styles
│   │   │   └── color_palette.dart    # Color definitions
│   │   └── routes/             # Core navigation routes
│   │       └── app_routes.dart    # Route definitions for navigation
│   │
│   ├── features/              # Feature-specific functionalities
│   │   ├── auth/              # Authentication feature
│   │   │   ├── models/        # Authentication-specific models
│   │   │   │   ├── login_model.dart  # Model for login data
│   │   │   │   └── register_model.dart # Model for registration data
│   │   │   ├── viewmodels/     # ViewModels for auth
│   │   │   │   ├── auth_view_model.dart  # Auth ViewModel
│   │   │   │   └── login_view_model.dart # Login ViewModel
│   │   │   └── ui/            # UI components for auth
│   │   │       ├── login_screen.dart  # Login screen
│   │   │       ├── signup_screen.dart  # Signup screen
│   │   │       └── widgets/       # Reusable UI components for auth
│   │   │           ├── auth_input.dart      # Input field widget
│   │   │           └── custom_button.dart    # Custom button widget
│   │   │
│   │   └── home/              # Home feature
│   │       ├── viewmodels/     # ViewModels for home
│   │       │   └── home_view_model.dart  # Home ViewModel
│   │       └── ui/            # UI components for home
│   │           ├── home_screen.dart    # Home screen
│   │           └── widgets/       # Reusable UI components for home
│   │               ├── chat_list.dart       # Chat list widget
│   │               └── status_list.dart     # Status list widget
│   │
│


```
