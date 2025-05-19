<?php
//
// File: loginHandler.php
//
// Purpose: DentLabWeb PHP login handler.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 19.05.2025
//

// Important for Cross Domain communication!
header('Access-Control-Allow-Origin: *');

require_once "./api_base.php";

try {
  // Fetch data from client
  $data = json_decode(file_get_contents('php://input'), true);

  if ($data['action'] !== ACTION_LOGIN) {
    echo json_encode(array("status" => "error"));
  } else {
    $mysqli = new mysqli(
      $ini['DB_HOST'],
      $ini['DB_USER'],
      $ini['DB_PASSWORD'],
      $ini['DB_NAME']
    );
  
    if (mysqli_connect_errno()) {
      echo json_encode(array("status" => "error"));
    } else {   
      $stmt = $mysqli->prepare("SELECT * FROM tblBenutzer WHERE Benutzername=? AND Passwort=?");
      $stmt->bind_param("ss", $data['username'], $data['password']);
      $stmt->execute();
      $result = $stmt->get_result();
      $user = $result->fetch_assoc();
  
      $responseData = array(
        'status' => 'success',
        'payload' => $user
      );
       
      echo json_encode($responseData);
    }     
  }  
} catch (Exception $ex) {  
  echo json_encode(array("status" => "error"));
}