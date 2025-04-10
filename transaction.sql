-- ========================
--     TRANSAKSI KASIR
-- ========================

START TRANSACTION;

-- 1. Tambahkan transaksi baru oleh kasir (misal id_user = 2)
INSERT INTO transaksi (id_user, tanggal_transaksi)
VALUES (2, CURDATE());

-- 2. Ambil ID transaksi yang baru saja dibuat
SET @id_transaksi := LAST_INSERT_ID();

-- 3. Tambahkan detail transaksi
-- Produk: id_produk 1 (2 pcs x 15000), dan id_produk 2 (1 pcs x 10000)
INSERT INTO detail_transaksi (id_transaksi, id_produk, jumlah, harga_satuan)
VALUES
(@id_transaksi, 1, 2, 15000.00),
(@id_transaksi, 2, 1, 10000.00);

-- 4. Hitung total bayar dari detail transaksi
SET @total := (2 * 15000.00) + (1 * 10000.00);

-- 5. Hitung diskon otomatis pakai function buatanmu
SET @diskon := hitung_diskon(@total);

-- 6. Hitung total yang harus dibayar
SET @total_bayar := @total - @diskon;

-- 7. Simpan ke tabel pembayaran
INSERT INTO pembayaran (
    id_transaksi, metode_pembayaran, jumlah_bayar, diskon, keterangan
) VALUES (
    @id_transaksi, 'Cash', @total_bayar, @diskon, CONCAT('Diskon otomatis ', @diskon)
);

COMMIT;
