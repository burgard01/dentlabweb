//
// File: logger.js
//
// Purpose: DentLabWeb logger console & file based on Winston (npm i winston).
//          DentLabWeb uses "winston-daily-rotate-file" transport to logger 
//          configuration.
//
//  Using Winston logging in the iXride-Ssoftware with highest level "info":
//           logger.info('This is an info message');
//           logger.warn('This is a warning message');
//           logger.error('This is an error message');
//
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 09.05.2025
//

import winston from "winston";
import DailyRotateFile from "winston-daily-rotate-file";

/**
 * Create logger console info & file (based on Winston logging).
 * More infos:
 *   - https://github.com/winstonjs/winston 
 *   - https://www.npmjs.com/package/winston
 *   - https://www.npmjs.com/package/winston-daily-rotate-file
 * 
 * "winston-daily-rotate-file" is used for transport to our logger configuration. 
 * Filename pattern: Include the date, date pattern to ‘YYYY-MM-DD’, 
 * enabled zipped archives, set the maximum file size to 20 MB, 
 * and set the maximum number of files to keep for 7 days.
 * 
 */
const logger = winston.createLogger({
  level: "info",
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.printf(({ timestamp, level, message }) => {
      return `[${timestamp}] ${level.toUpperCase()}: ${message}`;
    })
  ),
  transports: [
    new winston.transports.Console(),
    new DailyRotateFile({
      filename: "logs/dentlabweb-server-%DATE%.log",
      datePattern: "YYYY-MM-DD",
      zippedArchive: true,
      maxSize: "20m",
      maxFiles: "7d",
    }),
  ],
});

export { logger };
