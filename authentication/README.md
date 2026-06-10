# authentication


## Getting Started

Add dependencies:
  `flutter pub add local_auth`
  `flutter pub add flutter_riverpod`

add permissions to AndroidManifest.xml:
  ```xml
    <uses-permission android:name="android.permission.USE_BIOMETRIC" />
    <uses-permission android:name="android.permission.USE_FINGERPRINT" />
  ```
add permissions to Info.plist:
  ```xml
    <key>NSFaceIDUsageDescription</key>
    <string>We need to use Face ID to protect your data.</string>
  ```

add minSdkVersion to android/local.properties
  `flutter.minSdkVersion=21`

## code
star creating a class to handle authentication logic:
  `lib/services/local_auth_service.dart`
