# Revisions Log — Bloom Community

Catatan semua perubahan arah/keputusan yang dibatalkan atau diganti.

**Format setiap entry:**

```
## [YYYY-MM-DD] [Fase: UX] Keputusan sebelumnya → keputusan baru

**Sebelumnya:** Apa yang diputuskan di plan/dokumen/sesi sebelumnya.
**Sekarang:** Apa yang diputuskan sekarang.
**Alasan:** Kenapa berubah.
**Impact:** File/fase/modul mana yang terkena & perlu diupdate.
**Status update dokumen:** Checklist dokumen yang sudah disesuaikan.
```

---

## [2026-10-31] [Fase: U0] Asumsi "CEF megency-standalone pakai Chromium Embedded Framework" → **Android System WebView**

**Sebelumnya:** UI Plan §3.1 dan ADR-001 (tentatif) berasumsi client Megency pakai **Chromium Embedded Framework (CEF)** proper dengan `libcef.so/dll` dan Chromium versi tertentu yang bisa di-check langsung dari file binary.

**Sekarang:** Investigasi `megency-standalone/` menunjukkan:
- `libsampcef_net.so` (2.8MB Rust) hanya custom TLS network transport, **bukan Chromium binary**.
- Rendering UI pakai **Android System WebView** (dari `CefWebView.smali` memanggil `android.webkit.WebSettings`, `evaluateJavascript`, `addJavascriptInterface`).
- "CEF" di naming konvensi client ini adalah brand name internal, bukan singkatan Chromium Embedded Framework.
- Chromium version = Chrome WebView di Android 8+ (minSdk 26), di-update via Play Store independen dari OS, realistis Chromium 110+ (2023+).

**Alasan:** Owner mengarahkan ke `megency-standalone/lib/` di sesi U0. Investigasi menemukan file real.

**Impact:**
- ADR-001 locked **Accepted** (Svelte 4 pasti kompatibel, bukan tentatif lagi).
- ADR-004 baru dibuat mendokumentasikan temuan.
- UI Plan §3.1 masih valid rekomendasi Svelte 4 — tapi reasoning harus di-update ("menang karena WebView modern" bukan "CEF versi X").
- UI Plan §3.3 bridge spec: skema event tetap valid, tapi mekanisme di client Megency adalah `addJavascriptInterface` + `evaluateJavascript` (bukan CEF process messaging seperti di CEF proper).
- Fase U5 CEF Integration perlu reverse-engineer smali `com/nathan/djavalauncher/game/cef/bridge/` untuk mapping event name real.
- **Penamaan ambigu:** Istilah "CEF" di dokumen Bloom akan tetap dipakai (karena konsisten dengan nama framework di client), tapi di catatan teknis selalu ditulis "WebView-based CEF" atau "Megency WebView bridge" supaya nggak salah paham.

**Status update dokumen:**
- [x] `docs/decisions-log.md` ADR-004 ditulis.
- [x] `docs/decisions-log.md` ADR-001 di-update status "Accepted (locked)".
- [ ] UI Plan v1.2 §3.1 — note tambahan "bukan CEF proper, tapi WebView wrapper" akan ditambah di patch v1.3 saat ada perubahan plan lain (hindari bump cuma untuk catatan kecil).

---

## [2026-10-31] [Fase: U0] Palet master plan v1 → Bloom palette v2 (16 token)

**Sebelumnya:** Master Plan §5.2 mendefinisikan 9 token warna pastel single-shade (`--bloom-pink`, `--bloom-rose`, `--bloom-sky`, `--bloom-lavender`, `--bloom-mint`, `--bloom-butter`, `--bloom-peach`, `--bloom-cream`, `--bloom-ink`) tanpa variasi tingkat (300/500/700) dan tanpa token aksesori (coral, gold, glass).

**Sekarang:** UI CEF Plan §1.2 mendefinisikan 16 token lengkap dengan 3 tingkat untuk pink (300/500/700), aksen rose, lavender, sky, mint, butter, peach, coral (danger), 2 tingkat cream (50/100), 3 tingkat ink (500/700/900), gold, dan glass. HEX kode diubah untuk memenuhi kontras AA minimum pada Android.

**Alasan:**
- Perlu tingkat warna (300/500/700) agar tersedia state hover/pressed/soft tanpa compute.
- Perlu token khusus danger (coral) dan premium (gold) yang tidak ada di v1.
- Palet v1 belum lulus kontras AA untuk Android (`#5B4B6B` ink pada `#FFF9F5` masih di bawah 4.5:1 untuk teks kecil).
- Perlu `--bloom-glass` untuk glassmorphism yang jadi signature desain Zepeto×Love Nikki.

**Impact:**
- Semua komponen CEF nanti wajib pakai token §1.2, bukan master plan §5.2.
- Master plan §5.2 jadi deprecated untuk referensi warna — hanya untuk konsep karakter visual.
- `tokens/bloom.json` nanti di-generate dari §1.2.

**Status update dokumen:**
- [x] UI CEF Plan v1.2 sudah berisi palet baru (sumber kebenaran).
- [ ] Master Plan §5.2 ditandai deprecated (menunggu bump versi master plan).
- [x] CLAUDE.md RULES AKTIF #1 mengacu ke §1.2.
