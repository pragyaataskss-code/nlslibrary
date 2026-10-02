#!/usr/bin/env bash
# Builds a debug APK. Needs: Node 20+, JDK 21, Android SDK (ANDROID_HOME set).
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p www && cp index.html www/index.html
npm install
cp node_modules/jsqr/dist/jsQR.js www/jsQR.js          # bundle QR decoder so scanning works offline
[ -d android ] || npx cap add android
MF=android/app/src/main/AndroidManifest.xml
grep -q 'android.permission.CAMERA' $MF || sed -i 's#<uses-permission android:name="android.permission.INTERNET" />#&\n    <uses-permission android:name="android.permission.CAMERA" />\n    <uses-feature android:name="android.hardware.camera" android:required="false" />#' $MF
grep -q 'android.permission.CAMERA' $MF || { echo "Manifest patch failed"; exit 1; }
npx cap sync android
(cd android && ./gradlew assembleDebug)
mkdir -p dist && cp android/app/build/outputs/apk/debug/app-debug.apk dist/NLS-Library.apk
echo "APK: dist/NLS-Library.apk"
