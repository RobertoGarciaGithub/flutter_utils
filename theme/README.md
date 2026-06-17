# Theme Configuration

This project supports both Light and Dark themes using Flutter's `ThemeData`.

The theme structure is organized to keep colors and theme definitions centralized, making it easy to maintain and extend as the application grows.

## Getting Started

To configure the application theme, follow these steps:

### Step 1: Create the theme directory structure

Create the following directories and files:

```text
lib/
└── core/
    └── theme/
        ├── app_colors.dart
        ├── app_theme.dart
        ├── light_theme.dart
        └── dark_theme.dart
```

### Step 2: Define the application color palette

Create the `app_colors.dart` file and define all base colors used by the application.

Example:

```dart
class AppColors {
  AppColors._();

  static const brand50 = Color(0xFFF8FAFC);
  static const brand100 = Color(0xFFF1F5F9);
  static const brand200 = Color(0xFFE2E8F0);
  static const brand300 = Color(0xFFCBD5E1);
  static const brand400 = Color(0xFF94A3B8);
  static const brand500 = Color(0xFF64748B);
  static const brand600 = Color(0xFF475569);
  static const brand700 = Color(0xFF334155);
  static const brand800 = Color(0xFF1E293B);
  static const brand900 = Color(0xFF0F172A);
  static const brand950 = Color(0xFF020617);

  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);

  static const white = Color(0xFFFFFFFF);
}
```

### Step 3: Create the Light Theme

Create `light_theme.dart` and configure the application's light appearance.

Example:

```dart
class LightTheme {
  LightTheme._();

  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.brand50,
  );
}
```

### Step 4: Create the Dark Theme

Create `dark_theme.dart` and configure the application's dark appearance.

Example:

```dart
class DarkTheme {
  DarkTheme._();

  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.brand950,
  );
}
```

### Step 5: Create the Theme Entry Point

Create `app_theme.dart` to expose both themes.

```dart
class AppTheme {
  AppTheme._();

  static ThemeData get light => LightTheme.theme;

  static ThemeData get dark => DarkTheme.theme;
}
```

### Step 6: Register the themes in the application

Configure `MaterialApp` to use the themes.

```dart
MaterialApp(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: ThemeMode.system,
)
```

### Step 7: Customize text, icons and components

Use the theme files to define default styles for:

* Text styles
* Icons
* AppBar
* FloatingActionButton
* Cards
* Input fields
* Buttons

Example:

```dart
floatingActionButtonTheme: const FloatingActionButtonThemeData(
  backgroundColor: AppColors.brand800,
  foregroundColor: AppColors.white,
)
```

## Theme Modes

The application supports the following theme modes:

```dart
ThemeMode.light
ThemeMode.dark
ThemeMode.system
```

### Light Mode

Uses a light interface optimized for daylight environments.

### Dark Mode

Uses a dark interface optimized for low-light environments.

### System Mode

Automatically follows the operating system theme preference.

## Recommended Usage

Avoid using colors directly throughout the application.

Prefer:

```dart
Theme.of(context).textTheme.bodyLarge
```

instead of:

```dart
TextStyle(
  color: AppColors.brand900,
)
```

This ensures consistency and allows the theme to evolve without modifying individual screens.

## Conclusion

By following this structure, the application theme remains centralized, scalable and easy to maintain.

All visual customization should be performed through the theme files rather than directly inside widgets, ensuring a consistent user experience across the entire application.
