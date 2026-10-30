# Bloom Community – Master Plan Server Roleplay (open.mp + CEF)

*Dokumen ini dibuat agar bisa ditempel (paste) ke LLM AI mana pun sebagai konteks proyek. Mulai setiap sesi baru dengan menempelkan Bagian 1–4, lalu sebutkan fase yang sedang dikerjakan.*

## 1. Ringkasan Proyek

**Nama server:** Bloom Community **Genre:** Roleplay kompleks (gaya FiveM/NoPixel) di atas open.mp (kompatibel SA-MP) **Konsep:** *Theater Roleplay* – setiap pemain adalah "aktor/aktris" di panggung kota. Kota adalah teater besar, karakter adalah peran, misi/pekerjaan adalah "pertunjukan", dan server memakai istilah-istilah teater. **Tema visual:** Girlies, ceria, fun, imut, cerah, palet pastel, font Poppins. **Platform:** Wajib berjalan baik di PC dan Android, memakai client buatan sendiri yang sudah mendukung CEF. **Basis kode:** Gamemode SA-MP basic roleplay lama (dialog dan textdraw) hanya dipakai sebagai fondasi awal; sistemnya dimigrasi ke open.mp dan seluruh UI ditulis ulang dengan CEF.

## 2. Aturan Kerja untuk AI (WAJIB DIPATUHI)

1. Jangan menulis ulang semuanya sekaligus. Kerjakan per fase dan per modul kecil.
2. Sebelum mengubah file, minta atau baca dulu file yang relevan. Jangan menebak struktur kode.
3. Setiap modul harus memiliki: tujuan, file yang dibuat/diubah, tabel database yang terlibat, event/callback, dan cara menguji.
4. Semua kode Pawn harus kompatibel dengan open.mp. Jangan memakai fungsi yang sudah deprecated tanpa catatan.
5. Semua UI memakai HTML/CSS/JS (CEF) dengan design system di Bagian 5. Dilarang memakai warna di luar palet.
6. Server adalah *authoritative*: client CEF hanya mengirim permintaan, validasi dan perhitungan harus di server.
7. Setelah selesai satu modul, buat ringkasan singkat "Status Proyek" (Bagian 12) agar bisa disalin ke sesi AI berikutnya.
8. Tanyakan hal yang ambigu sebelum menulis kode panjang. Beri opsi dan rekomendasi.

## 3. Arsitektur Teknis

### 3.1 Komponen

- **Game server:** open.mp server + gamemode Pawn (modular, banyak file include).
- **Database:** MySQL/MariaDB (plugin MySQL untuk Pawn, query asinkron).
- **CEF layer:** Plugin/solusi CEF untuk SA-MP/open.mp. Perlu riset kompatibilitas Android (lihat Fase 0).
- **UI:** HTML/CSS/JS (disarankan Vue/Svelte ringan atau vanilla JS) berkomunikasi dengan Pawn lewat bridge event.
- **Backend web/UCP:** Node.js (Express) + API REST untuk UCP, dashboard admin, dan upload aset.
- **Penyimpanan aset:** Server file/CDN untuk gambar, ikon, dan model/texture custom.

### 3.2 Alur komunikasi CEF

`Pawn (server) <-> plugin/bridge <-> CEF (client) <-> UI HTML/JS`

- Server mengirim data JSON ke UI (misalnya daftar karakter, inventory).
- UI mengirim aksi ke server (misalnya pilih karakter, pakai item).
- Semua payload JSON dengan skema yang terdokumentasi dan diberi nomor versi.

### 3.3 Struktur folder yang disarankan

```
bloom-community/
  gamemodes/
    main.pwn
    modules/
      core/ (config, utils, logger)
      database/ (mysql, migrations)
      account/ (ucp, login, session)
      character/ (selection, creation, appearance)
      inventory/ (items, clothing, mods)
      vehicle/ (spawn, ownership, paintjob, tuning)
      job/ (pekerjaan & "pertunjukan")
      economy/ (bank, cash, shop)
      faction/ (polisi, medis, dll)
      property/ (rumah, bisnis)
      admin/ (command, log, ban)
      ui/ (cef bridge)
  ui/
    shared/ (design-tokens.css, components)
    pages/ (login, char-select, char-create, inventory, hud, phone, ...)
    assets/ (fonts, icons, images, sounds)
  web/
    api/ (Node.js)
    dashboard/ (admin item & kendaraan)
  docs/
    plan.md, changelog.md, db-schema.md
```

## 4. Fitur Inti

1. **UCP & akun:** 1 akun, maksimal 3 karakter (slot karakter).
2. **Character selection** bergaya FiveM: kartu karakter, preview 3D/pose, tombol Mainkan/Buat/Hapus.
3. **Character creator penuh:** nama, umur, gender, asal, rambut, kepala/wajah, warna kulit, baju, celana, sepatu, aksesori.
4. **Inventory & clothing system** berbasis item (bisa dipakai, dilepas, disimpan).
5. **Dashboard admin untuk item mod:** tambah baju/celana/sayap/aksesori custom tanpa edit kode.
6. **Sistem kendaraan:** kepemilikan, garasi, paintjob custom, tuning, dashboard admin untuk menambah paintjob.
7. **Ekonomi:** uang tunai, bank, toko, gaji, pajak sederhana.
8. **Pekerjaan & faction:** dikemas dengan tema teater.
9. **HUD, telepon, notifikasi, chat roleplay (/me, /do, /ooc), minimap kustom.**
10. **Sistem admin & moderasi:** log, ban, report, spectate.

## 5. Design System "Bloom" (CEF)

### 5.1 Karakter visual

Cerah, lembut, imut, bahagia. Sudut membulat besar, bayangan lembut, ikon bergaya sticker, animasi memantul (bouncy) yang halus. Hindari warna gelap pekat dan sudut tajam.

### 5.2 Palet pastel (usulan, boleh disesuaikan)

| Token | Warna | Kegunaan |
| --- | --- | --- |
| `--bloom-pink` | #FFC8DD | Warna utama, tombol utama |
| `--bloom-rose` | #FFAFCC | Aksen, hover |
| `--bloom-sky` | #BDE0FE | Info, link |
| `--bloom-lavender` | #CDB4DB | Header, badge |
| `--bloom-mint` | #B5EAD7 | Sukses |
| `--bloom-butter` | #FFF1B6 | Peringatan, highlight |
| `--bloom-peach` | #FFDAC1 | Kartu sekunder |
| `--bloom-cream` | #FFF9F5 | Latar utama |
| `--bloom-ink` | #5B4B6B | Teks utama (ungu lembut agar tetap terbaca) |

### 5.3 Tipografi

- Font utama: **Poppins** (400, 500, 600, 700). Simpan file font secara lokal di `ui/assets/fonts` agar tidak bergantung internet.
- Judul boleh memakai font dekoratif imut sebagai aksen (opsional, misalnya Fredoka atau Baloo 2).

### 5.4 Komponen UI standar

Tombol bulat (radius 999px), kartu dengan radius 24px, input dengan border pastel, badge, toast notifikasi, modal, tab, progress bar, slider (untuk character creator), ikon emoji/sticker, loading dengan animasi bunga mekar.

### 5.5 Motion

Animasi masuk lembut (scale + fade 200–300 ms), hover yang memantul pelan, konfeti/kelopak kecil saat aksi berhasil. Sediakan opsi "kurangi animasi" untuk Android low-end.

### 5.6 Performa & kompatibilitas Android

Hindari efek berat (blur besar, bayangan bertumpuk). Pakai ukuran sentuh minimal 44px, layout responsif, dan uji pada resolusi rendah.

## 6. Konsep Theater Roleplay

| Elemen teater | Padanan di server |
| --- | --- |
| Panggung | Kota/map utama |
| Aktor/Aktris | Karakter pemain |
| Naskah | Latar belakang karakter (backstory) |
| Audisi | Pembuatan karakter & whitelist |
| Pertunjukan | Pekerjaan, event, misi |
| Sutradara | Admin/GM |
| Penonton | Reputasi/popularitas karakter |
| Kostum | Sistem pakaian & kustomisasi |
| Belakang panggung (Backstage) | Lobi/ruang tunggu, UCP |
| Tirai naik/turun | Animasi login dan transisi spawn |

Ide tambahan: sistem "Rating Penampilan" untuk RP berkualitas, tampilan tirai panggung pada layar loading, dan event rutin bertema musim pertunjukan.

## 7. Roadmap per Fase

### Fase 0 – Riset & fondasi (WAJIB PERTAMA)

- Audit file SA-MP yang ada: daftar include, plugin, tabel database, command, ukuran kode.
- Tentukan solusi CEF yang mendukung **PC dan Android**. Cek repo/plugin yang ada, lisensi, dan status maintain. Jika tidak ada solusi multiplatform yang layak, putuskan alternatif (client launcher kustom, atau CEF PC lebih dulu lalu fallback dialog/textdraw untuk Android).
- Buat environment dev: open.mp server lokal, database, repo Git, struktur folder.
- Output: dokumen `docs/audit.md` dan keputusan teknis CEF.

### Fase 1 – Migrasi ke open.mp

- Pindahkan gamemode ke open.mp, perbaiki kompatibilitas include dan plugin.
- Rapikan menjadi modul, buat skema database versi baru dengan migrasi.
- Output: server menyala stabil dengan fitur dasar lama.

### Fase 2 – CEF bridge & design system

- Implementasi bridge Pawn <-> CEF, format payload JSON.
- Bangun design system Bloom (token CSS, komponen).
- Halaman pertama: login/UCP dengan animasi tirai panggung.

### Fase 3 – Akun & karakter

- Character selection (3 slot), character creator, penyimpanan penampilan.
- Preview karakter dan sistem skin/pakaian dasar.

### Fase 4 – Inventory, pakaian & item mod

- Sistem item, inventory UI, equip pakaian.
- Dashboard admin untuk menambah item custom (baju, celana, sayap, aksesori) lengkap dengan upload aset dan registrasi ke server.

### Fase 5 – Kendaraan

- Kepemilikan, garasi, spawn, tuning.
- Paintjob custom + dashboard admin untuk menambah paintjob.

### Fase 6 – Ekonomi, pekerjaan, faction, properti

- Bank, toko, gaji, pekerjaan bertema teater, faction dasar, rumah/bisnis.

### Fase 7 – HUD, telepon, chat & polish UI

- HUD, notifikasi, telepon, minimap, sound effect imut, optimasi Android.

### Fase 8 – Admin, keamanan, uji beta

- Sistem admin, log, anti-cheat dasar, validasi server, rate limit.
- Closed beta, kumpulkan bug, perbaiki.

### Fase 9 – Peluncuran & operasional

- Deploy VPS, backup otomatis, monitoring, dokumentasi aturan dan wiki pemain.

## 8. Skema Database (garis besar)

- `accounts` (id, ucp\_name, password\_hash, email, created\_at, last\_login, admin\_level)
- `characters` (id, account\_id, slot 1–3, name, age, gender, origin, cash, bank, position, health, appearance\_json, created\_at)
- `items` (id, key, name, type, icon, stackable, metadata\_json)
- `character_items` (id, character\_id, item\_id, quantity, equipped, metadata\_json)
- `custom_assets` (id, type, name, file\_path, model\_or\_texture\_id, status, created\_by)
- `vehicles` (id, owner\_character\_id, model, plate, color\_json, paintjob\_id, mods\_json, garage\_id)
- `paintjobs` (id, name, texture\_ref, approved)
- `jobs`, `factions`, `properties`, `logs`, `bans`

AI wajib menyertakan migrasi SQL tiap perubahan skema dan mencatatnya di `docs/db-schema.md`.

## 9. Keamanan & Kualitas

- Hash password (bcrypt/argon2), jangan simpan teks polos.
- Gunakan prepared query/escape untuk semua input pemain.
- Validasi semua pesan dari CEF di sisi server.
- Rate limit untuk aksi sensitif (uang, item).
- Log transaksi uang dan item.
- Backup database terjadwal.

## 10. Standar Kode

- Penamaan konsisten (prefix modul, misalnya `Char_`, `Inv_`, `Veh_`).
- Komentar singkat untuk fungsi penting.
- Satu modul satu tanggung jawab, hindari variabel global berlebihan.
- Setiap modul diberi cara uji manual (checklist).

## 11. Template Prompt untuk Dipakai ke LLM

**Pembuka sesi:**

> Kamu adalah developer senior Pawn/open.mp dan frontend CEF. Berikut konteks proyek Bloom Community \[tempel Bagian 1–5\]. Kita sekarang mengerjakan **Fase X – \[nama modul\]**. Baca aturan kerja di Bagian 2. Sebelum menulis kode, rangkum pemahamanmu dan minta file yang kamu butuhkan.

**Meminta modul:**

> Buat modul \[nama\]. Berikan: daftar file, skema database/migrasi, kode Pawn, kode UI (HTML/CSS/JS sesuai design system Bloom), event bridge, dan checklist uji.

**Menutup sesi:**

> Buat ringkasan "Status Proyek" terbaru: yang selesai, yang sedang dikerjakan, keputusan teknis baru, masalah terbuka, dan langkah berikutnya.

## 12. Status Proyek (diperbarui tiap sesi)

- **Fase saat ini:** Fase 0
- **Selesai:** –
- **Sedang dikerjakan:** Audit gamemode lama dan gamemode CEF referensi, rencana aset dan hosting
- **Keputusan teknis:** (isi setelah riset)
- **Masalah terbuka:** Cara integrasi CEF client sendiri ke open.mp perlu didokumentasikan dari gamemode CEF lama
- **Langkah berikutnya:** Berikan file SA-MP ke AI untuk diaudit

## 13. Catatan Penting

- Model/texture custom (sayap, baju baru) di SA-MP/open.mp membutuhkan pengunduhan aset oleh client. Pastikan strategi distribusi aset (launcher atau cache download) diputuskan di Fase 0, karena sangat mempengaruhi Android.
- Pastikan semua aset (font, ikon, model, musik) memiliki lisensi yang boleh dipakai untuk server publik.
- Konversi "gaya FiveM" ke SA-MP memiliki batas teknis; fitur yang terlalu berat sebaiknya disederhanakan atau ditunda.

## 14. Pembaruan Berdasarkan Survei (mengalahkan bagian lain jika bertentangan)

MVP Bloom adalah UI unik, kustomisasi baju dan item mod, serta event harian bertanggal; fitur roleplay lain menyusul. Bagian ini mengganti asumsi awal di Bagian 1–13.

### 14.1 Fakta terkonfirmasi

| Hal | Keputusan |
| --- | --- |
| Gamemode lama | Basic roleplay, dialog dan textdraw; dipakai hanya sebagai fondasi |
| Client | Buatan sendiri, sudah mendukung CEF di PC dan Android |
| Referensi CEF | Ada gamemode lama yang CEF-nya sudah berjalan baik; LLM wajib mempelajarinya dan memakai pola yang sama |
| Target pemain | 100–200 pemain |
| Hosting | Belum ada VPS |
| Tim | Solo dengan bantuan AI; pemilik paham Pawn dan web |
| Map | San Andreas bawaan; mapping menyusul |
| Aset | Belum ada; dibuatkan sampel; pemilik menyiapkan bahan mentah saja |
| Konsep teater | Hanya tema dan istilah, bukan gameplay |
| Komunitas | Publik, bahasa Indonesia |

### 14.2 Perubahan pada plan

- **Riset CEF dihapus dari Fase 0.** Gantinya: dokumentasikan bridge CEF dari gamemode referensi (event apa yang ada, format payload, cara membuka dan menutup UI, batasan) lalu pakai sebagai standar semua modul.
- **Fitur teater bergameplay dibatalkan** (misalnya Rating Penampilan). Teater hanya tampil lewat istilah, tirai login, dan dekorasi UI.
- **Fase 4 dipecah:** 4A item dan pakaian, 4B pipeline aset dan dashboard upload, 4C sistem event.
- **Fase 6 (job, faction, properti, kriminal) ditunda setelah MVP** dan dibuka bertahap.
- Karena pemilik paham Pawn, AI cukup memberi kode dan penjelasan singkat; jelaskan hanya keputusan desain, bukan sintaks dasar.

### 14.3 Definisi MVP (dibuka ke pemain pertama)

1. Akun UCP dan 3 slot karakter dengan character selection CEF
2. UI Bloom lengkap: login bertema tirai panggung, HUD, inventory, notifikasi
3. Character creator dan kustomisasi baju (rambut, wajah, kulit, baju, celana, sepatu, aksesori)
4. Item mod lewat dashboard web (baju, toys, aksesoris), termasuk item khusus event
5. Sistem event bertanggal (14.5)
6. Ekonomi dasar dan chat roleplay (/me, /do, /ooc), admin dasar

### 14.4 Pipeline aset dan dashboard web

Alur target: pemilik mengunggah bahan mentah, dashboard memprosesnya, server dan client menerimanya otomatis tanpa edit kode.

1. Admin login ke dashboard, memilih tipe aset (baju, celana, aksesori, toys, sayap, paintjob).
2. Unggah file (model/texture), ikon, nama, harga, rarity, dan kategori.
3. Backend memvalidasi format, ukuran, dan hash, lalu mencatat ke tabel `custom_assets` dengan status draft.
4. Admin menyetujui, status menjadi approved, manifest versi aset naik.
5. Server membaca manifest, client mengunduh aset baru dari CDN/file server saat login.
6. Item muncul di inventory, toko, atau hadiah event sesuai pengaturan.

Pertanyaan teknis yang HARUS dijawab di Fase 0: apakah client buatan sendiri bisa memuat model dan texture baru saat runtime (tanpa update penuh), apa batas ukuran, dan bagaimana cache di Android.

Untuk sampel awal, LLM membuat 8–10 data item contoh (JSON), ikon placeholder bergaya Bloom, dan satu alur upload end-to-end memakai aset dummy.

### 14.5 Sistem event bertanggal (contoh Valentine)

- Tabel `events` (id, key, nama, tanggal mulai, tanggal selesai, zona waktu WIB, status) dan `event_rewards` (event\_id, syarat, item\_id, jumlah).
- Syarat hadiah: login pada tanggal tertentu, atau login N hari berturut-turut dalam rentang event.
- Tabel `event_claims` (character atau account, event\_id, reward\_id, claimed\_at) dengan batasan unik agar tidak bisa diklaim dua kali.
- Item event punya penanda `event_key` dan opsi terbatas waktu atau tidak bisa didapat lagi setelah event.
- Dashboard: admin menjadwalkan event, memilih item hadiah, melihat statistik klaim.
- UI CEF: popup hadiah login bertema pastel dengan animasi kelopak dan kalender event.
- Satu hadiah per akun (bukan per karakter), supaya 3 slot karakter tidak membuat klaim ganda.

### 14.6 Hosting (perkiraan awal, validasi saat uji beban)

- Untuk 100–200 pemain plus MySQL, dashboard Node.js, dan file aset: VPS Linux dengan sekitar 4 vCPU, 8 GB RAM, SSD, dengan lokasi server terdekat pemain (Indonesia atau Singapura).
- Pisahkan jalur unduh aset di belakang CDN atau cache agar tidak membebani game server.
- Aktifkan backup database harian dan proteksi DDoS dari penyedia.
- Angka di atas adalah perkiraan; ukur penggunaan nyata saat closed beta.

### 14.7 Prompt Fase 0 (revisi, tempel ke LLM)

```
Kamu adalah developer senior Pawn/open.mp, backend Node.js/MySQL, dan frontend CEF/HTML. Proyek: Bloom Community, server roleplay kompleks gaya FiveM di atas open.mp, tema girlies pastel, istilah teater (hanya tema), wajib jalan di PC dan Android.

[TEMPEL BAGIAN 1-5 dan BAGIAN 14 MASTER PLAN DI SINI]

Kita di FASE 0: audit dan fondasi. JANGAN menulis kode fitur. Pemilik paham Pawn dan web, jadi jelaskan keputusan desain saja.

TUGAS 1 - Audit gamemode lama (basic roleplay, dialog dan textdraw, hanya fondasi)
Minta daftar file yang kamu butuhkan, lalu laporkan: struktur dan include, plugin dan statusnya di open.mp, skema database dan masalahnya, sistem yang ada (akun, karakter, inventory, kendaraan, job, faction, properti, admin), masalah keamanan (SQL injection, password plaintext), fungsi tidak kompatibel/deprecated, dan rekomendasi per sistem: pakai ulang, refactor, atau tulis ulang, dengan tingkat usaha.

TUGAS 2 - Dokumentasi bridge CEF dari gamemode referensi
Aku akan memberikan gamemode lama yang CEF-nya sudah bekerja. Dokumentasikan: fungsi/callback Pawn untuk membuka dan menutup UI, format payload (Pawn ke JS dan JS ke Pawn), cara menangani fokus kursor dan input, struktur folder UI, dan batasannya di Android. Hasilkan spesifikasi bridge baru (versi bernomor) yang akan jadi standar semua modul Bloom. Jangan mengarang; jika kode tidak jelas, tanyakan.

TUGAS 3 - Strategi aset custom
Berdasarkan kemampuan client buatanku (tanyakan: apakah bisa memuat model dan texture baru saat runtime, batas ukuran, cache Android), rancang pipeline aset di Bagian 14.4: format file, manifest versi, jalur unduh, dan validasi. Beri opsi dan rekomendasi.

TUGAS 4 - Fondasi repo dan hosting
Usulkan struktur repo, branch strategy, tooling compile Pawn, environment lokal dan staging, serta rekomendasi VPS untuk 100-200 pemain.

TUGAS 5 - Risiko dan keputusan
Daftar risiko berurutan dari yang paling berbahaya, plus keputusan yang harus kuambil beserta opsi dan rekomendasimu.

OUTPUT: docs/audit.md, docs/cef-bridge-spec.md, docs/asset-pipeline.md, docs/decisions.md, docs/risks.md, lalu "Status Proyek" terbaru yang bisa kusalin ke sesi AI lain.

ATURAN: tanyakan hal ambigu dulu (maksimal 5 pertanyaan, beri opsi dan rekomendasi); kerjakan satu tugas lalu konfirmasi sebelum lanjut; jangan mulai Fase 1 sebelum aku menyetujui keputusan Fase 0.
```
