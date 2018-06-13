# CreateTable
CREATE TABLE IF NOT EXISTS deposit (
  id INTEGER NOT NULL AUTO_INCREMENT,
  tx_hash VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  amount DECIMAL(64,20) NOT NULL,
  asset CHAR(32) NOT NULL,
  height INTEGER(11) NOT NULL,
  tx_index INTEGER,
  status INTEGER(11) DEFAULT 1,
  create_time DATETIME DEFAULT NOW(),
  update_time DATETIME ON UPDATE NOW(),
  PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

# AddScannedDeposit
INSERT INTO deposit (tx_hash, address, amount, asset, height, tx_index) VALUES (?, ?, ?, ?, ?, ?)

# AddDepositWithTime
INSERT INTO deposit (tx_hash, address, amount, asset, height, tx_index, create_time) VALUES (?, ?, ?, ?, ?, ?, ?)

# AddStableDeposit
INSERT INTO deposit (tx_hash, address, amount, asset, height, tx_index, create_time, update_time, status) VALUES (?, ?, ?, ?, ?, ?, ?, 2)

# GetUnstableDeposit
SELECT id, tx_hash, address, amount, asset, height, tx_index, status, create_time, update_time FROM deposit WHERE asset=? AND status<2