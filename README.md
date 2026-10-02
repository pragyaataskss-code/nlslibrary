# NLS Library APK
## Easiest: GitHub (no installs)
1. Create a new GitHub repo, upload everything in this folder (keep the `.github` folder).
2. Open the Actions tab -> "Build APK" -> wait ~5 min.
3. Download `NLS-Library-apk` from the run's Artifacts, unzip, send the .apk to your phone and install (allow "install unknown apps").

## Local
Install Node 22, JDK 21, Android SDK, set ANDROID_HOME, then `bash build.sh` -> `dist/NLS-Library.apk`.
