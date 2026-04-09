# Flutter Sample Projects

Sample Flutter projects covering typical combinations of platform targets, project types, and Flutter version management setups used in real-world CI/CD pipelines.

## Samples

| Directory | Project type | Package Manager | Testing | Version Management |
|-----------|-------------|-----------------|---------|-------------------|
| [flutter-ios-android](flutter-ios-android/) | App · iOS + Android | pub | flutter_test (widget) | none |
| [flutter-package](flutter-package/) | Dart package | pub | flutter_test (unit) | none |
| [flutter-plugin](flutter-plugin/) | Plugin · Android + iOS · with example app | pub | flutter_test (unit, in root + example) | none |
| [flutter-web-fvm](flutter-web-fvm/) | App · Web (canvaskit) | pub | flutter_test (unit + widget) | `.fvmrc` (fvm) |

---

### flutter-ios-android

**Stack:** Flutter · Dart · iOS · Android · flutter_test · pub

**What it demonstrates:**
- Flutter app targeting both iOS and Android platforms
- Widget test with flutter_test
- Scanner detects: `ios/Runner.xcworkspace` + `android/build.gradle.kts` + `test/*_test.dart`

**How to run:**
```bash
cd flutter-ios-android
flutter pub get
flutter test
```

---

### flutter-package

**Stack:** Flutter · Dart package · flutter_test · pub

**What it demonstrates:**
- Dart/Flutter package (no native platform code)
- Unit test with flutter_test
- Scanner detects: `test/*_test.dart`, no iOS/Android dirs → primary-only workflow

**How to run:**
```bash
cd flutter-package
flutter pub get
flutter test
```

---

### flutter-plugin

**Stack:** Flutter · plugin (Android + iOS) · example app · flutter_test · pub

**What it demonstrates:**
- Flutter plugin with a separate `example/` app (two `pubspec.yaml` files → two projects detected)
- Root plugin: `android/build.gradle.kts` present, no `ios/Runner.xcworkspace`, has `test/*_test.dart` → `test+android` config
- Example sub-project: `ios/Runner.xcworkspace` + `android/build.gradle.kts` + `test/*_test.dart` → `test+both` config
- Scanner detects two `pubspec.yaml` files → two separate configs generated

**How to run:**
```bash
# Root plugin tests
cd flutter-plugin
flutter pub get
flutter test

# Example app tests
cd flutter-plugin/example
flutter pub get
flutter test
```

---

### flutter-web-fvm

**Stack:** Flutter Web · Dart · canvaskit renderer · flutter_test · pub

**What it demonstrates:**
- Flutter web application (web target only, no iOS/Android)
- Unit tests for a `Counter` class with flutter_test
- Widget test for the counter UI
- Flutter version pinned via `.fvmrc` (used by fvm)

**How to run:**
```bash
# Install fvm (one-time setup)
dart pub global activate fvm
export PATH="$PATH":"$HOME/.pub-cache/bin"

cd flutter-web-fvm
fvm install        # installs the Flutter version declared in .fvmrc
fvm flutter pub get
fvm flutter test
```
