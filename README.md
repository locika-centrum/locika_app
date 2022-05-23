# Aplikace pro Lociku
## Požadavky na implementaci
Aplikace je psaná ve [Flutter](https://docs.flutter.dev/) - takže pro kompilaci (debugging, ...) je nutné mít:
1) Instalovat Flutter SDK - podle [dokumentace](https://docs.flutter.dev/get-started/install). Nebo na Mac OS X přes Homebrew.
2) Mít nějaké IDE (Android Studio, IntelliJ IDEA nebo stačí úplně Visual Studio Code). Ideální je potom si tam doinstalovat minimálně extenze (plug-ins) pro Flutter a Dart
3) Pro kompilaci pro iOS to bude chtít Maca ;) - XCode + volitelně iOS simulator
4) Pro kompilaci pro Android to bude chtít Android Studio + volitelně dokonfigurovat Android simulator(y)

### Test korektní instalace
`flutter doctor`

Ideální je, když se všechny fajfky zelenají:

> Doctor summary (to see all details, run flutter doctor -v):\
[✓] Flutter (Channel stable, 3.0.0, on macOS 12.1 21C52 darwin-x64, locale en-CZ)\
[✓] Android toolchain - develop for Android devices (Android SDK version 32.1.0-rc1)\
[✓] Xcode - develop for iOS and macOS (Xcode 13.3.1)\
[✓] Chrome - develop for the web\
[✓] Android Studio (version 2021.1)\
[✓] IntelliJ IDEA Ultimate Edition (version 2022.1)\
[✓] IntelliJ IDEA Ultimate Edition (version 2022.1)\
[✓] IntelliJ IDEA Ultimate Edition (version 2021.3)\
[✓] VS Code (version 1.67.2)\
[✓] Connected device (4 available)\
[✓] HTTP Host Availability\
\
• No issues found!

### Donačtení knihoven
O to by se mělo postarat IDE (s instalovanými pluginy) - nebo explicitně donačíst přes `flutter pub get` v adresáři projektu.

## Běh/debug v emulátorech
// TODO
## Běh/debug v připojeném telefonu
// TODO
## Deployment do store
// TODO