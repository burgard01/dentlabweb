//
// File: loginHandler.js
//
// Purpose: DentLabWeb login handler.
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
const handleLogin = async (username, password) => {
	let query = `SELECT * FROM tblBenutzer WHERE 
    Benutzername='${username}' AND Passwort='${password}'`;

	try {
		const connection = await mysql.createConnection(dbConfig);
		await connection.connect();
		const [result] = await connection.query(query);
		return JSON.stringify({ status: "success", payload: result });
	} catch (error) {
		logger.error("loginHandler-handleLogin: Database SQL-Query error!");
		return JSON.stringify({ status: "error" });
	}
};

export { handleLogin };
