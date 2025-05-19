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

## DentLabWeb-Client Node.js based Server-API

- Server-API: **Node.js** REST-API 
- URL of REST-API: **[http://](http://localhost:4003)**
- Start the server: **node webserver.js** or **nodemon webserver.js**

---

## DentLabWeb-Client PHPs based Server-API

### PHP: Manage dependencies with "Composer"
Composer itself is written in PHP and is provided as a single PHP archive (phar). 
Copy file **composer.phar** in project folder. You can then test whether Composer 
is working in a terminal window:

- $> **php composer.phar --version**

Then you can install e.g. **Monolog** PHP-Package with following command:

- $> **php composer.phar require monolog/monolog**

Update dependencies:

- $> **php composer.phar update monolog/monolog**

## PHP Debug mit XDebug

1. Xdebug auf Mac mit ARM64 installieren - siehe Website: https://xdebug.org/docs/install
2. Mit dem Befehl: **arch -arm64 sudo pecl install xdebug**
3. Wo liegt PHP - Befehl: **which php** (/opt/homebrew/php)
4. Welche PHP-version - Befehl: **php -v**
5. Am Ende der **php.ini** folgende Zeilen anfügen:
   zend_extension="/opt/homebrew/Cellar/php/8.3.8/pecl/20240831/xdebug.so"
   xdebug.mode=debug
   xdebug.client_host=localhost
   xdebug.clientr_port=9003
   xdebug.discover_client_host=true
   xdebug.start_with_request=yes
   xdebug.log_level=0
6. Nach der Xdebug-Installation prüfen, ob Xdebug korrekt 
   installiert & in der php.ini Datei konfiguriert ist - Befehl: **php -v** Folgender Output als Beispiel:
   PHP 8.3.8 (cli) (built: Jun  4 2024 14:53:17) (NTS) Copyright (c) The PHP Group
   Zend Engine v4.3.8, Copyright (c) Zend Technologies
   with Xdebug v3.4.1, Copyright (c) 2002-2025, by Derick Rethans
   with Zend OPcache v8.3.8, Copyright (c), by Zend Technologies

Die Date **php.ini** liegt in: /opt/homebrew/etc/php/8.3

## PHP Datei in VS Code debuggen

1. **MAMP** starten
2. Im Root-Verzeichnis von dentlabweb im Terminal folgenden Befehl eingeben:
   **php -S localhost:80** (siehe Port in den MAMP Server-Einstellungen)
3. Z.B. die Datei **inxdex.php** in VS Code öffnen und **Run debug**
   aufrufen. Vorher einen Haltepunkt setzen.       

---   

## Wichtige Webseiten

**PHP**
- https://www.php.net/manual/de/index.php
- https://www.php.net/
- https://www.w3schools.com/php/
- https://wiki.selfhtml.org/wiki/PHP
-https://www.php-einfach.de/

**CSV <--> JSON Konverter**
- https://csvjson.com/

**MySQL**
- https://www.mysql.com/de/
- https://www.w3schools.com/MySQL/default.asp
- https://www.php-einfach.de/mysql-tutorial/

## Some important terminal commends

- **which php** (wo liegt PHP)
- **php -v** (show PHP version)
- **brew update** (update brew)  

