DROP TABLE IF EXISTS `phm_prescription_dispensation`;
CREATE TABLE `phm_prescription_dispensation` (
  `prescription_dispensation_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `dispensation_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prescription_dispensation_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `phm_prescription_dispensation_presdisp_unique` (`prescription_id`,`dispensation_id`),
  KEY `phm_prescription_dispensation_dispensation_fk` (`dispensation_id`),
  KEY `phm_prescription_dispensation_creator_fk` (`creator`),
  KEY `phm_prescription_dispensation_changed_by_fk` (`changed_by`),
  KEY `phm_prescription_dispensation_retired_by_fk` (`retired_by`),
  KEY `phm_prescription_dispensation_patient_fk` (`patient_id`),
  CONSTRAINT `phm_prescription_dispensation_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `phm_prescription_dispensation_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `phm_prescription_dispensation_dispensation_fk` FOREIGN KEY (`dispensation_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `phm_prescription_dispensation_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `phm_prescription_dispensation_prescription_fk` FOREIGN KEY (`prescription_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `phm_prescription_dispensation_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;