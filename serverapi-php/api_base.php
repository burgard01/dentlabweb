<?php
//
// File: api_base.php
//
// Purpose: DentLabWeb PHP server API base.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 19.05.2025
//

require_once "./vendor/autoload.php";

use Monolog\Level;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;

// Monolog logger initialization
$logger = new Logger('dentlabweb');
$fileHandler = new StreamHandler(__DIR__ . '/log/dentlabweb.log', Level::Info);
$logger->pushHandler($fileHandler);

// Load database config data
$ini = parse_ini_file('./config.ini');

//---------------------
// API action constants
//---------------------
define("ACTION_LOGIN", "login");
