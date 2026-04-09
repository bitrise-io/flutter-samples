# Flutter Sample Projects

Sample Flutter web projects covering typical combinations of Flutter version management setups used in real-world CI/CD pipelines.

## Samples

| Directory | Framework | Package Manager | Testing | Version Management |
|-----------|-----------|-----------------|---------|-------------------|
| [flutter-web-fvm](flutter-web-fvm/) | Flutter Web · canvaskit | pub | flutter_test (unit + widget) | `.fvmrc` (fvm) |

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
