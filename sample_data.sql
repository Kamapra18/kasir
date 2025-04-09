
-- ========================
-- DATA DUMMY / SAMPLE DATA
-- ========================

-- Data kategori
INSERT INTO kategori (nama_kategori) VALUES
('Makanan'),
('Minuman'),
('Alat Tulis'),
('Elektronik');

-- Data produk
INSERT INTO produk (id_kategori, nama_produk, stok, deskripsi, harga) VALUES
(1, 'Nasi Goreng', 50, 'Nasi goreng dengan ayam dan sayur', 20000.00),
(2, 'Teh Botol', 100, 'Minuman teh manis kemasan', 5000.00),
(3, 'Pulpen Pilot', 200, 'Pulpen tinta hitam', 7000.00),
(4, 'Mouse Logitech', 30, 'Mouse wireless Logitech M220', 150000.00);

-- Data user
INSERT INTO user (username, password, role) VALUES
('admin1', 'adminpass', 'admin'),
('kasir1', 'kasirpass', 'kasir'),
('owner1', 'ownerpass', 'owner');

-- Data transaksi
INSERT INTO transaksi (id_user, tanggal_transaksi) VALUES
(2, '2025-04-09'),
(2, '2025-04-08');

-- Data detail transaksi
INSERT INTO detail_transaksi (id_transaksi, id_produk, jumlah, harga_satuan) VALUES
(1, 1, 2, 20000.00),  -- 2 Nasi Goreng
(1, 2, 1, 5000.00),   -- 1 Teh Botol
(2, 3, 3, 7000.00);   -- 3 Pulpen

-- Data log aktivitas
INSERT INTO log_aktivitas (id_user, aktivitas) VALUES
(1, 'Menambahkan produk baru: Nasi Goreng'),
(2, 'Melakukan transaksi dengan ID 1');

-- Data member
INSERT INTO member (nama_member, no_hp, email) VALUES
('Budi Santoso', '081234567890', 'budi@example.com'),
('Siti Aminah', '082345678901', 'siti@example.com');

-- Data pembayaran
INSERT INTO pembayaran (id_transaksi, metode_pembayaran, jumlah_bayar, keterangan) VALUES
(1, 'Tunai', 45000.00, 'Pembayaran lunas'),
(2, 'QRIS', 21000.00, 'Bayar via QR Code');

