CREATE TABLE `pg_leaves` (
  `leave_id` varchar(20) NOT NULL,
  `department` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nature` varchar(50) DEFAULT NULL,
  `purpose` varchar(200) DEFAULT NULL,
  `is_station` varchar(10) DEFAULT NULL,
  `request_date` timestamp NULL DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `level` varchar(30) DEFAULT NULL,
  `withdraw_reason` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `signature` longblob,
  `address` varchar(255) DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,  
  `duty_start_date` timestamp NULL DEFAULT NULL,
  `duty_end_date` timestamp NULL DEFAULT NULL,
  `prefix_suffix` varchar(255) DEFAULT NULL,
  `station_start_date` timestamp NULL DEFAULT NULL,
  `station_end_date` timestamp NULL DEFAULT NULL,
  `advisor` longblob,
  `ta_instructor` longblob,
  PRIMARY KEY (`leave_id`),
  KEY `leaves_ibfk_3` (`user_id`),
  CONSTRAINT `leaves_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
)