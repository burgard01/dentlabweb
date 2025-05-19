//
// File: loginHandler.js
//
// Purpose: DentLabWeb Node.js login handler.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 14.05.2025
//

import mysql from "mysql2/promise.js";
import { dbConfig } from "../db/dbConfiguration.js";
import { logger } from "../helpers/loggerHelper.js";

/**
 * Login handler to check login is o.k. or not.
 * If o.k. returns user data.
 */
const handleLogin = async (action, username, password) => {
	if (action !== "login") {
    logger.error("loginHandler-handleLogin: Wrong action error!");
		return JSON.stringify({ status: "error" });
	}		
  	
	try {
		// Create SQL query string
		let query = `SELECT * FROM tblBenutzer WHERE Benutzername='${username}' AND Passwort='${password}'`;
		// Connect to MySQl-Database
		const connection = await mysql.createConnection(dbConfig);
		await connection.connect();
		// Query now
		const [result] = await connection.query(query);
		
		// Return the result
		return JSON.stringify({ status: "success", payload: result });
	} catch (error) {
		logger.error("loginHandler-handleLogin: Database SQL-Query error!");
		return JSON.stringify({ status: "error" });
	}
};

export { handleLogin };
