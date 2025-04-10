-- ========================
--         PROCEDURE
-- ======================== 


-- Procedure untuk menambah stock produk
DELIMITER $$

CREATE PROCEDURE tambah_stok (
    IN p_id_produk INT,
    IN p_stok_baru INT
)
BEGIN
    UPDATE produk
    SET stok = stok + p_stok_baru
    WHERE id_produk = p_id_produk;
END$$

DELIMITER ;


-- Procedure untuk menambah produk baru
DELIMITER $$

CREATE PROCEDURE tambah_produk_baru (
    IN p_id_kategori INT,
    IN p_nama_produk VARCHAR(100),
    IN p_stok INT,
    IN p_deskripsi TEXT,
    IN p_harga DECIMAL(10,2)
)
BEGIN
    INSERT INTO produk (id_kategori, nama_produk, stok, deskripsi, harga)
    VALUES (p_id_kategori, p_nama_produk, p_stok, p_deskripsi, p_harga);
END$$

DELIMITER ;

