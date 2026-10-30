# CLAUDE.md — Instruksi Permanen untuk Claude Code

Proyek: **Bloom Community** — server roleplay open.mp dengan UI CEF girlies/kawaii pastel.
Working directory: `D:\Bloom\`.
Timezone: WIB (UTC+8). Model aktif: Opus 4.7.

## WAJIB DILAKUKAN DI AWAL SETIAP SESI:

1. Baca `Bloom Community – Master Plan Server Roleplay open.mp.md` (bagian 1–5 dan 14).
2. Baca `Bloom Community – UI CEF Plan.md` (bagian 0, 1, 5, 11, 12, 13).
3. Baca `docs/mistakes-log.md` SELURUHNYA. Pahami rule yang sudah ada.
4. Baca `docs/revisions-log.md` 10 entry terakhir.
5. Baca `docs/decisions-log.md` SELURUHNYA.
6. Baca `docs/current-goal.md` untuk tahu goal autonomous saat ini.
7. Baca bagian 11 "Status UI Track" untuk tahu fase saat ini.
8. Rangkum pemahaman dalam 5 bullet lalu konfirmasi (atau langsung eksekusi kalau owner tinggal — lihat §13 plan).

## WAJIB DILAKUKAN SAAT ADA KESALAHAN / REVISI:

- Setelah fix bug/typo/misinterpretation yang bikin ulang kerja → **append ke `docs/mistakes-log.md`** sebelum lanjut.
- Setelah owner bilang "ganti arah" atau "ini salah" → **append ke `docs/revisions-log.md`**.
- Setelah pilih antara 2+ opsi teknis → **append ke `docs/decisions-log.md`**.
- Setiap rule baru dari kesalahan → **append ke "RULES AKTIF" di CLAUDE.md ini**.

## WAJIB DILAKUKAN DI AKHIR SETIAP SESI:

1. Update bagian 11 "Status UI Track" di plan UI.
2. Pastikan 3 log file sudah di-append jika ada peristiwa baru.
3. Update `docs/current-goal.md` dengan progress.
4. Commit git dengan message yang menyebut log entry baru (jika ada).
5. Tulis `docs/handoff-note.md` untuk sesi berikutnya.

## RULES AKTIF (tambah terus seiring proyek berjalan):

1. Dilarang pakai warna di luar palet §1.2 plan UI.
2. Dilarang `#000000` dan `#FFFFFF` murni untuk teks; pakai token.
3. Dilarang `px` absolute di komponen UI; pakai `rem` + CSS var `--ui-scale`.
4. Dilarang install dependency npm tanpa justifikasi bundle size + alternatif.
5. Dilarang mengubah file plan tanpa bump versi di header + changelog line.
6. Dilarang mengarang API/function Pawn; kalau ragu, tanya owner atau baca gamemode referensi.
7. Dilarang menulis kode di 2+ modul besar paralel; satu modul selesai & tested dulu.
8. Dilarang skip baca mistakes-log.md di awal sesi.
