# UTS Basis Data Lanjutan - Kelompok Yappingers

## Nama Anggota:
1. **I Made Wisnu Pradnya Yoga** - 2301020010  
2. **I Kadek Mario Prayoga** - 2301020018  
3. **I Putu Ananta Dwija Prasetya Anjasmara** - 2301020020  

---

## Deskripsi Proyek
Kami, **Kelompok Yappingers**, membuat aplikasi **Kasir "TokoSerba"** sebagai proyek UTS untuk mata kuliah **Basis Data Lanjutan**.  
Aplikasi ini mendukung:
- Pengelolaan produk & stok
- Transaksi penjualan
- Laporan penjualan harian

TokoSerba menjual berbagai macam **barang dan makanan**, dengan fitur berbasis basis data untuk kemudahan manajemen toko.

---

## Struktur Data Utama

### `user`
- Menyimpan data pengguna sistem: **admin**, **kasir**, dan **owner**

### `kategori` & `produk`
- Mengelompokkan dan menyimpan informasi produk
- Termasuk stok, harga, dan deskripsi

### `transaksi`, `detail_transaksi`, `pembayaran`
- Menyimpan data penjualan dan detail produk yang dibeli
- Mengatur informasi pembayaran (tunai/member)

### `log_aktivitas`
- Mencatat aktivitas pengguna: transaksi, penambahan produk, dll.

---

##  Manajemen Produk & Stok

### Stored Procedures
- `tambah_produk_baru` → Menambahkan produk baru  
- `tambah_stok_produk` → Menambahkan stok produk yang sudah ada  

### Trigger
- `kurangi_stok_setelah_transaksi` → Mengurangi stok otomatis saat transaksi terjadi  

### View
- `view_stok_habis` → Menampilkan produk dengan stok kosong  

---

## Penjualan & Transaksi

### Trigger
- `catat_log_aktivitas_transaksi` → Mencatat transaksi otomatis ke log  

### Function
- `hitung_diskon(member, total_belanja)` → Menghitung diskon berdasarkan status member  
- `cek_status_stok(kode_produk)` → Mengecek apakah stok cukup  

---

## Laporan & Monitoring

### View
- `view_laporan_penjualan_harian` → Rekap transaksi harian  
- `view_produk_terlaris` → Produk paling banyak terjual  

---

## 📌 Catatan Tambahan
- Aplikasi ini dijalankan secara lokal menggunakan **Laragon**
- Database: **MySQL**
- Pengujian dilakukan melalui **phpMyAdmin** dan **command line**
