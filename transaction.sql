-- =============================
-- PROCEDURE PROSES TRANSAKSI
-- =============================

DELIMITER $$

CREATE PROCEDURE proses_transaksi (
    IN p_id_user INT,
    IN p_metode_pembayaran VARCHAR(50),
    IN p_keterangan TEXT,
    IN p_produk_1 INT,
    IN p_jumlah_1 INT,
    IN p_harga_1 DECIMAL(10,2),
    IN p_produk_2 INT,
    IN p_jumlah_2 INT,
    IN p_harga_2 DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Jika error, rollback semua perubahan
        ROLLBACK;
    END;

    START TRANSACTION;

    -- 1. Insert ke transaksi
    INSERT INTO transaksi (id_user, tanggal_transaksi)
    VALUES (p_id_user, CURDATE());

    -- 2. Ambil ID transaksi terakhir
    SET @id_transaksi := LAST_INSERT_ID();

    -- 3. Tambah ke detail transaksi
    INSERT INTO detail_transaksi (id_transaksi, id_produk, jumlah, harga_satuan)
    VALUES
        (@id_transaksi, p_produk_1, p_jumlah_1, p_harga_1),
        (@id_transaksi, p_produk_2, p_jumlah_2, p_harga_2);

    -- 4. Hitung total bayar
    SET @total := (p_jumlah_1 * p_harga_1) + (p_jumlah_2 * p_harga_2);

    -- 5. Hitung diskon via fungsi
    SET @diskon := hitung_diskon(@total);

    -- 6. Insert ke pembayaran
    INSERT INTO pembayaran (id_transaksi, metode_pembayaran, jumlah_bayar, diskon, keterangan)
    VALUES (@id_transaksi, p_metode_pembayaran, @total, @diskon, p_keterangan);

    COMMIT;
END$$

DELIMITER ;
