# Flutter Sample Projects

Sample Flutter projects covering typical combinations of platform targets, project types, and Flutter version management setups used in real-world CI/CD pipelines.

## Samples

| Directory | Project type | Package Manager | Testing | Version Management |
|-----------|-------------|-----------------|---------|-------------------|
| [flutter-ios-android](flutter-ios-android/) | App · iOS + Android | pub | flutter_test (widget) | `.tool-versions` (asdf/mise) |
| [flutter-package](flutter-package/) | Dart package | pub | flutter_test (unit) | `.fvmrc` (fvm) |
| [flutter-plugin](flutter-plugin/) | Plugin · Android + iOS · with example app | pub | flutter_test (unit, in root + example) | `.fvmrc` (fvm) |
| [flutter-web](flutter-web/) | App · Web (canvaskit) | pub | flutter_test (unit + widget) | `pubspec.lock` sdks.flutter |
| [flutter-ios-android-web](flutter-ios-android-web/) | App · iOS + Android + Web | pub | flutter_test (widget) | `.tool-versions` (asdf/mise) |

---

### flutter-ios-android

**Stack:** Flutter · Dart · iOS · Android · flutter_test · pub

**What it demonstrates:**
- Flutter app targeting both iOS and Android platforms
- Widget test with flutter_test
- Flutter version pinned via `.tool-versions` (used by asdf and mise)
- Scanner detects: `ios/Runner.xcworkspace` + `android/build.gradle.kts` + `test/*_test.dart`

**How to run:**
```bash
# Optional: install asdf or mise and run `asdf install` / `mise install`
# to get the exact Flutter version declared in .tool-versions

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
- Flutter version pinned via `.fvmrc` (used by fvm)
- Scanner detects: `test/*_test.dart`, no iOS/Android dirs → primary-only workflow

**How to run:**
```bash
# Optional: install fvm and run `fvm install` to get the exact Flutter version declared in .fvmrc

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
- Flutter version pinned via `.fvmrc` in the root plugin and `.fvm/fvm_config.json` in the `example/` sub-project (fvm v3 vs v2 config formats); `pubspec.lock` is gitignored as is standard for plugins

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

### flutter-web

**Stack:** Flutter Web · Dart · canvaskit renderer · flutter_test · pub

**What it demonstrates:**
- Flutter web application (web target only, no iOS/Android)
- Unit tests for a `Counter` class with flutter_test
- Widget test for the counter UI
- Flutter version pinned via `pubspec.lock` `sdks.flutter` constraint (`>=3.29.0 <3.30.0`)

**How to run:**
```bash
cd flutter-web
flutter pub get
flutter test
```

---

### flutter-ios-android-web

**Stack:** Flutter · Dart · iOS · Android · Web · flutter_test · pub

**What it demonstrates:**
- Flutter app targeting iOS, Android, and Web simultaneously
- `ios/`, `android/`, and `web/` directories all present
- Flutter version pinned via `.tool-versions` (used by asdf and mise)
- Scanner detects: `ios/Runner.xcworkspace` + `android/build.gradle.kts` + `web/index.html` + `test/*_test.dart`

**How to run:**
```bash
# Optional: install asdf or mise and run `asdf install` / `mise install`
# to get the exact Flutter version declared in .tool-versions

cd flutter-ios-android-web
flutter pub get
flutter test
```
