-- ========================
--         VIEW
-- ======================== 

-- view_laporan_penjualan_harian 

CREATE VIEW view_laporan_penjualan_harian AS
SELECT 
    t.tanggal_transaksi,
    COUNT(DISTINCT t.id_transaksi) AS jumlah_transaksi,
    SUM(dt.jumlah) AS total_item_terjual,
    SUM(dt.jumlah * dt.harga_satuan) AS total_penjualan_kotor,
    SUM(pb.diskon) AS total_diskon,
    SUM(pb.jumlah_bayar) AS total_pendapatan_bersih
FROM transaksi t
JOIN detail_transaksi dt ON t.id_transaksi = dt.id_transaksi
JOIN pembayaran pb ON t.id_transaksi = pb.id_transaksi
GROUP BY t.tanggal_transaksi
ORDER BY t.tanggal_transaksi DESC;

-- view_stock product yang habis
CREATE VIEW view_produk_habis AS
SELECT 
    p.id_produk,
    p.nama_produk,
    k.nama_kategori,
    p.stok,
    p.harga,
    p.deskripsi
FROM produk p
JOIN kategori k ON p.id_kategori = k.id_kategori
WHERE p.stok = 0;


-- view product terlaris
CREATE VIEW view_produk_terlaris AS
SELECT 
    p.id_produk,
    p.nama_produk,
    k.nama_kategori,
    SUM(dt.jumlah) AS total_terjual,
    COUNT(DISTINCT dt.id_transaksi) AS total_transaksi,
    p.harga,
    p.stok
FROM detail_transaksi dt
JOIN produk p ON dt.id_produk = p.id_produk
JOIN kategori k ON p.id_kategori = k.id_kategori
GROUP BY p.id_produk, p.nama_produk, k.nama_kategori, p.harga, p.stok
ORDER BY total_terjual DESC, total_transaksi DESC
LIMIT 5;



