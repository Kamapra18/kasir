
-- ========================
-- DATA DUMMY / SAMPLE DATA
-- ========================

-- Data kategori
INSERT INTO kategori (nama_kategori) VALUES
('Makanan'),
('Minuman'),
('Alat Tulis'),
('Elektronik'),
('Pakaian'),
('Buku'),
('Mainan'),
('Aksesoris'),
('Peralatan Rumah Tangga'),
('Kecantikan');


-- Data produk
INSERT INTO produk (id_kategori, nama_produk, stok, deskripsi, harga) VALUES
(1, 'Nasi Goreng', 50, 'Nasi goreng dengan ayam dan sayur', 20000.00),
(2, 'Teh Botol', 100, 'Minuman teh manis kemasan', 5000.00),
(3, 'Pulpen Pilot', 200, 'Pulpen tinta hitam', 7000.00),
(4, 'Mouse Logitech', 30, 'Mouse wireless Logitech M220', 150000.00),
(5, 'Kaos Oblong', 80, 'Kaos katun lengan pendek', 45000.00),
(6, 'Buku Novel', 60, 'Novel fiksi remaja', 55000.00),
(7, 'Boneka Teddy Bear', 40, 'Boneka ukuran sedang', 75000.00),
(8, 'Gelang Kulit', 100, 'Gelang fashion dari kulit sintetis', 15000.00),
(9, 'Sapu Lantai', 30, 'Sapu serat plastik', 20000.00),
(10, 'Lipstik Merah', 25, 'Lipstik matte warna merah', 65000.00);


-- Data user
INSERT INTO user (username, password, role) VALUES
('admin1', 'adminpass', 'admin'),
('kasir1', 'kasirpass', 'kasir'),
('owner1', 'ownerpass', 'owner'),
('admin2', 'passadmin2', 'admin'),
('kasir2', 'passkasir2', 'kasir'),
('owner2', 'passowner2', 'owner'),
('admin3', 'passadmin3', 'admin'),
('kasir3', 'passkasir3', 'kasir'),
('owner3', 'passowner3', 'owner');


-- Data transaksi
INSERT INTO transaksi (id_user, tanggal_transaksi) VALUES
(2, '2025-04-09'),
(2, '2025-04-08'),
(3, '2025-04-07'),
(2, '2025-04-06'),
(2, '2025-04-05'),
(3, '2025-04-04'),
(3, '2025-04-03'),
(2, '2025-04-02');


-- Data detail transaksi
INSERT INTO detail_transaksi (id_transaksi, id_produk, jumlah, harga_satuan) VALUES
(1, 1, 2, 20000.00),  -- 2 Nasi Goreng
(1, 2, 1, 5000.00),   -- 1 Teh Botol
(2, 3, 3, 7000.00),   -- 3 Pulpen
(3, 4, 1, 150000.00),
(4, 5, 2, 45000.00),
(5, 6, 1, 55000.00),
(6, 7, 1, 75000.00),
(7, 8, 2, 15000.00),
(8, 9, 1, 20000.00),
(8, 10, 1, 65000.00);


-- Data log aktivitas
INSERT INTO log_aktivitas (id_user, aktivitas) VALUES
(1, 'Menambahkan produk baru: Nasi Goreng'),
(2, 'Melakukan transaksi dengan ID 1'),
(3, 'Menghapus produk: Pulpen Pilot'),
(1, 'Menambahkan user baru: kasir2'),
(2, 'Melakukan transaksi dengan ID 2'),
(3, 'Melakukan transaksi dengan ID 3'),
(1, 'Mengupdate harga produk: Mouse Logitech'),
(3, 'Login ke sistem sebagai owner');


-- Data pembayaran
INSERT INTO pembayaran 
(id_transaksi, metode_pembayaran, jumlah_bayar, diskon, keterangan) 
VALUES
(1, 'Tunai', 45000.00, 0.00, 'Pembayaran lunas'),
(2, 'QRIS', 21000.00, 0.00, 'Bayar via QR Code'),
(3, 'Debit', 150000.00, 0.00, 'Pembayaran lunas'),
(4, 'Tunai', 90000.00, 0.00, 'Dibayar tunai'),
(5, 'QRIS', 55000.00, 2750.00, 'Pembayaran digital'), -- 5%
(6, 'Tunai', 75000.00, 0.00, 'Lunas'),
(7, 'Debit', 30000.00, 0.00, 'Pembayaran sebagian'),
(8, 'QRIS', 20000.00, 0.00, 'Lunas');



