UTS Basis Data Lanjutan Kelompok Yappingers

Nama Anggota:
1. I Made Wisnu Pradnya Yoga - 2301020010
2. I Kadek Mario Prayoga - 2301020018
3. I Putu Ananta Dwija Prasetya Anjasmara - 2301020020

Kami Kelompok Yappingers membuat aplikasi Kasir untuk memenuhi Project UTS Basis Data Lanjutan.
Sebuah aplikasi Kasir TokoSerba yang dimana menjual berbagai macam barang dan makanan.
Aplikasi ini mendukung pengelolaan produk dan stok, transaksi penjualan, serta laporan penjualan harian.

Struktur Data Utama:
    Tabel user
    - Menyimpan data pengguna sistem: admin, kasir, dan owner.

    Tabel kategori dan produk
    - Mengelompokkan dan menyimpan informasi produk yang dijual, termasuk stok dan harga.

    Tabel transaksi, detail_transaksi, dan pembayaran
    - Menyimpan data penjualan, rincian produk yang dibeli, dan informasi pembayaran.

    Tabel log_aktivitas
    - Mencatat aktivitas penting pengguna, seperti transaksi penjualan atau penambahan produk

Manajemen Produk dan Stok
    Stored Procedure:
    - tambah_produk_baru – Menambahkan data produk baru.
    - tambah_stok_produk – Menambahkan stok ke produk yang sudah ada.

    Trigger:
    - kurangi_stok_setelah_transaksi – Mengurangi stok secara otomatis setelah transaksi terjadi.

    View:
    - view_stok_habis – Menampilkan daftar produk yang stok-nya kosong.

Penjualan & Transaksi
    Trigger:
    - catat_log_aktivitas_transaksi – Mencatat aktivitas transaksi otomatis ke tabel log_aktivitas.

    Function
    - hitung_diskon – Menghitung diskon sesuai dengan member dan total belanja.
    - cek_status_stok – Mengecek status stok produk (cukup atau tidak).

Laporan & Monitoring
    View:
    - view_laporan_penjualan_harian – Menampilkan rekap transaksi per hari.
    - view_produk_terlaris – Menampilkan daftar produk paling banyak terjual.