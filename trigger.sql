--  triger kurangin_stock_setelah_transaksi
DELIMITER $$

CREATE TRIGGER kurangi_stok_setelah_transaksi
AFTER INSERT ON detail_transaksi
FOR EACH ROW
BEGIN
    UPDATE produk
    SET stok = stok - NEW.jumlah
    WHERE id_produk = NEW.id_produk;
END$$

DELIMITER ;

-- triger catat aktivitas otomatis setalah transaksi yang di simpan di table log_aktivitas
DELIMITER $$

CREATE TRIGGER catat_log_setelah_transaksi
AFTER INSERT ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_aktivitas (id_user, aktivitas)
    VALUES (
        NEW.id_user,
        CONCAT('Menambahkan transaksi dengan ID: ', NEW.id_transaksi, ' pada tanggal ', NEW.tanggal_transaksi)
    );
END$$

DELIMITER ;


