# Flutter Sample Projects

Sample Flutter web projects covering typical combinations of Flutter version management setups used in real-world CI/CD pipelines.

## Samples

| Directory | Framework | Package Manager | Testing | Version Management |
|-----------|-----------|-----------------|---------|-------------------|
| [flutter-ios-android](flutter-ios-android/) | Flutter · iOS + Android | pub | flutter_test (widget) | none |
| [flutter-package](flutter-package/) | Flutter · Dart package | pub | flutter_test (unit) | none |
| [flutter-plugin](flutter-plugin/) | Flutter · plugin + example | pub | flutter_test (widget, in example/) | none |
| [flutter-web-fvm](flutter-web-fvm/) | Flutter Web · canvaskit | pub | flutter_test (unit + widget) | `.fvmrc` (fvm) |

---

### flutter-ios-android

**Stack:** Flutter · Dart · iOS · Android · flutter_test · pub

**What it demonstrates:**
- Flutter app targeting both iOS and Android platforms
- Widget tests with flutter_test
- Scanner detects: `ios/Runner.xcworkspace` + `android/build.gradle` + `test/*_test.dart`

---

### flutter-package

**Stack:** Flutter · Dart package · flutter_test · pub

**What it demonstrates:**
- Dart/Flutter package (no native platform code)
- Unit tests with flutter_test
- Scanner detects: `test/*_test.dart`, no iOS/Android dirs → primary-only workflow

---

### flutter-plugin

**Stack:** Flutter · plugin (Android + iOS) · example app · flutter_test · pub

**What it demonstrates:**
- Flutter plugin with a separate `example/` app
- Root plugin: Android + iOS, no tests → `notest+android` config (iOS detected but no tests)
- Example sub-project: Android + iOS + tests → `test+both` config
- Scanner detects two `pubspec.yaml` files → two separate configs generated

---

### flutter-web-fvm

**Stack:** Flutter Web · Dart · canvaskit renderer · flutter_test · pub

**What it demonstrates:**
- Flutter web application (web target only)
- Unit tests for a `Counter` class with `flutter_test`
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
