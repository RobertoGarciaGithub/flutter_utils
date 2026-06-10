# Customize the splash screen and app icons for your Flutter app

This project demonstrates how to customize the splash screen and app icons for a Flutter application.
It includes instructions on how to set up and configure the splash screen and app icons using the `flutter_launcher_icons` package.

## Getting Started
  To get started, follow these steps:
Step 1: add the dependencies
  `flutter_launcher_icons`
  `flutter_native_splash`
  with the command:
  ```bash
    flutter pub add flutter_launcher_icons
    flutter pub add flutter_native_splash
  ```
Step 2: configure the `pubspec.yaml` file to specify the paths for your splasheen and app icons. For example:
```yaml
  flutter_launcher_icons:
    android: true
    ios: true
    image_path: "assets/icon/app_icon.png"
  flutter_native_splash:
    color: "#ffffff"
    image: "assets/splash/splash_screen.png"
    android: true
    ios: true
```
Step 3: run the following command to generate the splash screen and app icons:
```bash
  flutter pub run flutter_launcher_icons:main
  flutter pub run flutter_native_splash:create
```
## Conclusion
By following these steps, you can easily customize the splash screen and app icons for your Flutter application.
This will help you create a more personalized and professional-looking app that stands out to users.
Make sure to replace the paths in the `pubspec.yaml` file with the actual paths to your splasheen and app icon images.
