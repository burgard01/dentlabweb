# DentLabWeb

Dental lab management & invoice software

---

## Bring existing Flutter-Project files to existing GitHub

- $> git init
- $> git add --all
- $> git commit -m 'First commit'
- $> git remote add origin https://github.com/burgard01/dentlabweb.git
- $> git push origin master

---

## Create DentLabWeb Flutter-Project

1. Install actual **Flutter** on computer
2. Install **Android Studio** & **XCode**
3. Install a **Android-Simulator Device** in Android Studio
4. Type Command in Terminal: **>$ flutter doctor**
5. Type command in Terminal: **>$ flutter create dentlabweb**
6. Bring existing Flutter-Project files to existing **GitHub**:
   - $> git init
   - $> git add --all
   - $> git commit -m 'First commit'
   - $> git remote add origin https://github.com/burgard01/dentlabweb.git
   - $> git push origin master 

---

## Getting Started with Flutter (some informaion)

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## Important Flutter commands

- $> **flutter doctor** 
     (This command provides the information about installed tooling required for Flutter development. It lets you know about your Flutter SDK, and whether it is set up correctly and compatible with the platform, IDE, and devices)
- $> **flutter pub add [name of package]** (Add Flutter-Package)
- $> **flutter pub remove [name of package]** (Remove Flutter-Package)
- $> **flutter clean**
     (This command deletes the build/ and . dart_tool/ directories in your Flutter project, which forces Flutter to rebuild everything the next time you run the app)
- $> **flutter upgrade** (Update Flutter-SDK)     
- $> **flutter run -d chrome** (Run app in Chrome-Webbrowser)
- $> **flutter --version** (Show installed Flutter version)

---

## Database (MySQL-Server Database)

- Used database: **MySQL**
- Name of database: **webdent**
- Username: **root**  
- Password: **dentlabweb**

---

## DentLabWeb-Client Server-API

- Server-API: **Node.js** REST-API 
- URL of REST-API: **[http://](http://localhost:4003)**
- Start the server: **node webserver.js** or **nodemon webserver.js**