<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.10-blue?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-3.10-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Provider-State_Management-9945FF?style=for-the-badge" alt="Provider" />
</p>

<h1 align="center">Keranjang Belanja</h1>
<p align="center">
  <i>Aplikasi keranjang belanja mini (shopping cart) dengan Flutter + Provider untuk mempraktikkan state management.</i>
</p>

---

## Daftar Isi

- [Daftar Isi](#daftar-isi)
- [Deskripsi](#deskripsi)
- [Isi Tugas](#isi-tugas)
- [Stack](#stack)
- [Struktur Proyek](#struktur-proyek)
- [Cara Menjalankan](#cara-menjalankan)

---

## Deskripsi

**Keranjang Belanja** adalah aplikasi mobile untuk tugas mata kuliah Pemrograman Aplikasi Bergerak (PAB) Pertemuan 4. Projek ini mempraktikkan berbagai konsep state management dengan Flutter: demo counter dengan setState, contoh prop drilling (Beranda → Profil → Pengaturan), penggunaan Provider, serta keranjang belanja lengkap—daftar produk, tambah ke keranjang, ubah jumlah, dan checkout.

Dengan tema custom Slate Blue × Terracotta, tampilan dibuat konsisten dan nyaman dipakai.

---

## Isi Tugas

<p>
  <img src="https://img.shields.io/badge/Part_1-Counter_setState-22c55e?style=flat-square" alt="Part 1" />
  <img src="https://img.shields.io/badge/Part_2-Prop_Drilling-3b82f6?style=flat-square" alt="Part 2" />
  <img src="https://img.shields.io/badge/Part_4-Counter_Provider-8b5cf6?style=flat-square" alt="Part 4" />
  <img src="https://img.shields.io/badge/Part_5-Shopping_Cart-ef4444?style=flat-square" alt="Part 5" />
</p>

| Bagian | Keterangan |
|--------|------------|
| Part 1 | Counter dengan setState & tampilan di halaman lain |
| Part 2 | Demo prop drilling: Beranda → Profil → Pengaturan |
| Part 4 | Counter dengan Provider |
| Part 5 | Keranjang belanja — daftar produk, tambah ke keranjang, ubah jumlah, checkout |

<details>
<summary><b>Detail per bagian</b></summary>

- **Part 1:** Counter lokal dengan `setState`, nilai ditampilkan di halaman terpisah
- **Part 2:** Data/state dilewatkan manual antar halaman (Beranda → Profil → Pengaturan)
- **Part 4:** Counter yang di-manage dengan Provider, state global
- **Part 5:** Shopping cart lengkap dengan daftar produk, keranjang, edit jumlah, dan checkout

</details>

---

## Stack

<p>
  <img src="https://img.shields.io/badge/Flutter-SDK-64748b?style=flat-square" alt="Flutter" />
  <img src="https://img.shields.io/badge/Provider-State_Management-64748b?style=flat-square" alt="Provider" />
  <img src="https://img.shields.io/badge/Google_Fonts-Typography-64748b?style=flat-square" alt="Google Fonts" />
</p>

| Teknologi | Kegunaan |
|-----------|----------|
| **Flutter** | Framework UI cross-platform |
| **Provider** | State management |
| **Google Fonts** | Custom typography |
| **Tema custom** | Slate Blue × Terracotta |

---

## Struktur Proyek

<details>
<summary><b>Lihat struktur folder</b></summary>

```
lib/
├── main.dart              # Entry point, Provider setup
├── theme/
│   └── app_theme.dart     # Tema Slate Blue × Terracotta
├── models/
│   ├── product.dart       # Model produk
│   ├── cart_item.dart     # Model item keranjang
│   ├── cart_model.dart    # Provider keranjang
│   └── counter_model.dart # Provider counter
└── pages/
    ├── home_page.dart           # Beranda (Part 2)
    ├── profile_page.dart        # Profil (Part 2)
    ├── settings_page.dart       # Pengaturan (Part 2)
    ├── counter_page.dart        # Counter setState (Part 1)
    ├── counter_display_page.dart# Tampilan counter (Part 1)
    ├── counter_provider_page.dart # Counter Provider (Part 4)
    ├── product_list_page.dart   # Daftar produk (Part 5)
    └── cart_page.dart           # Keranjang belanja (Part 5)
```

</details>

---

## Cara Menjalankan

<details>
<summary><b>Prasyarat</b></summary>

- Flutter SDK 3.10 atau lebih baru
- Editor (VS Code / Android Studio) atau terminal

</details>

1. **Clone repository**
   ```bash
   git clone <url-repository>
   cd PAB-Tugas1
   ```

2. **Pasang dependensi**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi**
   ```bash
   flutter run
   ```

   Jalankan di perangkat atau emulator yang sudah terhubung.

---

<p align="center">
  <sub>PAB-Tugas1 · Tugas PAB (Pemrograman Aplikasi Bergerak) — Pertemuan 4</sub>
</p>
