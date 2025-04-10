-- ========================
--         FUNCTION
-- ======================== 

-- cek_status_stok
DELIMITER $$

CREATE FUNCTION cek_status_stok(p_id_produk INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE v_stok INT;
    
    SELECT stok INTO v_stok FROM produk WHERE id_produk = p_id_produk;

    RETURN CASE
        WHEN v_stok = 0 THEN 'Stok Habis'
        WHEN v_stok <= 10 THEN 'Stok Menipis'
        ELSE 'Stok Aman'
    END;
END$$

DELIMITER ;

-- hitung diskon
DELIMITER $$

CREATE FUNCTION hitung_diskon(jumlah_bayar DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE diskon DECIMAL(10,2);

    IF jumlah_bayar >= 1000000 THEN
        SET diskon = jumlah_bayar * 0.10;
    ELSEIF jumlah_bayar >= 500000 THEN
        SET diskon = jumlah_bayar * 0.05;
    ELSE
        SET diskon = 0.00;
    END IF;

    RETURN diskon;
END$$

DELIMITER ;
