# taladlaocenter
Kolao Developer 

A new Flutter project.



## Getting Started
  1  `flutter pub get`
  2  `flutter pub run build_runner build`

## Build Runner
`flutter pub run build_runner build`

## CreateModules
1  `chmod +x create_modules.sh`
2  `./create_modules.sh <modulesName>`


## Convert Json to model class 
`https://dart-quicktype.netlify.app/`

1  Check : Generate toJson method
2  Check : Use JSONSerializable
3  Click : Convert

# Launcher icon app

flutter pub get
flutter pub run flutter_launcher_icons -f flutter_launcher_icons.yaml

flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*

# Run and build your app

- flutter run --flavor dev -t lib/main_dev.dart
- flutter build apk --obfuscate --split-debug-info=./build_map --release  -t lib/main.dart
- flutter build appbundle --obfuscate --split-debug-info=./build_map --release -t lib/main.dart
- Test build