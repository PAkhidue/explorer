DELIMITER $$

DROP TRIGGER IF EXISTS contract_sell_storage_AFTER_INSERT$$

CREATE DEFINER = CURRENT_USER TRIGGER `contract_sell_storage_AFTER_INSERT` AFTER INSERT ON `contract_sell_storage` FOR EACH ROW
BEGIN
insert ignore into sync_account(address,date_created,origin,tx_timestamp) values(new.owner_address,now(),'contract_sell_storage',(select block.timestamp from transaction,block where block.id=transaction.block_id and transaction.id=new.transaction_id));
update `transaction` SET `from`=new.owner_address, `type`=23 where `id`=new.transaction_id;
END$$

DELIMITER ;