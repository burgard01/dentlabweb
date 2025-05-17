//
// File: index.js
//
// Purpose: DentLabWeb Node.js entry point.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 09.05.2025
//

import express from "express";
import cors from "cors";
import { logger } from "./helpers/loggerHelper.js";
import { handleLogin } from "./handlers/loginHandler.js";

const webserver = express();

webserver.use(cors());
webserver.use(express.json());

//---------------------
// Start the server now
//---------------------
webserver.listen(4003, () => {
	logger.info("Server is listening to http://localhost:4003");
});

// --- Server-API: Handler functions -------------------------------------------

//--------------------------------------------------
// Handle "/login" to check if login is o.k. or not.
// In case of o.k. returns user data.
//--------------------------------------------------
webserver.post("/login", async (req, res, next) => {
	const data = await handleLogin(req.body.username, req.body.password);	 
	res.send(data);
});
