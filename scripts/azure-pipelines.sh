#!/bin/sh

set -e
export PATH=$BUILD_SOURCESDIRECTORY/flutter/bin:$BUILD_SOURCESDIRECTORY/flutter/bin/cache/dart-sdk/bin:$PATH

# All scripts will be placed here

install_flutter() {
    echo "Installing Flutter SDK"
    git clone -b stable https://github.com/flutter/flutter.git

    echo "Running flutter precache"
    flutter precache
    echo "Accepting android licenses"
    yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses
    echo "Verifying Flutter installation"
    flutter doctor

    echo "Downloading Packages"
    flutter packages get
}

run_unit_tests() {
    echo "Running Unit Tests"
    flutter test --machine >tests.output
}

setup_emulators() {
    echo "Installing Android Emulator SDK"
    $ANDROID_HOME/tools/bin/sdkmanager --install 'system-images;android-29;default;x86'
    
    echo "Creating Android SmartPhone Emulator"
    $ANDROID_HOME/tools/bin/avdmanager create avd -n "pixel" --device "pixel" -k "system-images;android-29;default;x86"

    echo "Creating Android Tablet Emulator"
    # $ANDROID_HOME/tools/bin/avdmanager create avd -n "pixel" --device "pixel" -k "system-images;android-29;default;x86"
}

run_integration_tests_android_smartphone() {
    echo "Starting Android SmartPhone Emulator"
    $ANDROID_HOME/emulator/emulator -avd "pixel" -no-snapshot &
    $ANDROID_HOME/platform-tools/adb wait-for-device shell 'while [[ -z $(getprop sys.boot_completed | tr -d '\r') ]]; do sleep 1; done; input keyevent 82'

    echo "Running Integration Tests"
    flutter drive --target=test_driver/app.dart
}

run_integration_tests_android_tablet() {    
    echo "Starting Android Tablet Emulator"
    # $ANDROID_HOME/emulator/emulator -avd "pixel" -no-snapshot &
    # $ANDROID_HOME/platform-tools/adb wait-for-device shell 'while [[ -z $(getprop sys.boot_completed | tr -d '\r') ]]; do sleep 1; done; input keyevent 82'

    echo "Running Integration Tests"
    # flutter drive --target=test_driver/app.dart
}

run_integration_tests_iphone() {
    echo "Starting IPhone emulator"
    /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator -CurrentDeviceUDID 0152977E-4531-4AEA-A9B1-58C14204EC07
    
    echo "Running Integration Tests"
    flutter drive --target=test_driver/app.dart
}

run_integration_tests_ipad() {
    echo "Starting IPad emulator"
    /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator -CurrentDeviceUDID BF958FDD-DE51-405C-8035-FBED017E4E10
    
    echo "Running Integration Tests"
    flutter drive --target=test_driver/app.dart
}

"$@"
