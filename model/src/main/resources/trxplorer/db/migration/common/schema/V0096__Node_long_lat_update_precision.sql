ALTER TABLE `node` 
CHANGE COLUMN `longitude` `longitude` DECIMAL(11,8) NULL DEFAULT NULL ,
CHANGE COLUMN `latitude` `latitude` DECIMAL(10,8) NULL DEFAULT NULL ;