# Handoff Note — Bloom Community

Log kerja autonomous Claude Code. Setiap task besar selesai → append entry baru di bawah (jangan overwrite).

**Format:**

```
## YYYY-MM-DD HH:MM WIB — [Fase: UX] Judul task
- Yang dikerjakan
- File yang di-sentuh
- Keputusan yang diambil (link ke ADR kalau ada)
- Blocker (kalau ada)
- Next
```

---

## 2026-10-31 — [Fase: U0 Setup] Memory system + audit base gamemode

**Yang dikerjakan:**
- Tugas A: Buat `CLAUDE.md` dengan RULES AKTIF 1–8, buat `docs/` folder, isi `mistakes-log.md` (template kosong), `revisions-log.md` (entry palet v1→v2), `decisions-log.md` (ADR-001 Svelte+Vite, ADR-002 1366×768+rem, ADR-003 Figma+HTML paralel), `current-goal.md` (scope U0 Setup), `handoff-note.md` (file ini).
- Tugas A.1: Audit `D:\Bloom\server\` (gamemode "Reactive Roleplay" oleh Traymon — jauh lebih kompleks dari "basic roleplay" yang disebut di prompt). Dokumen: `base-audit-gm.md`, `base-audit-dialogs.md`, `base-audit-textdraws.md`, `base-audit-plugins.md`, `base-audit-summary.md`.
- Tugas B: Ringkasan 10 bullet disampaikan ke owner di chat.

**Temuan kunci audit:**
- Base **sudah di open.mp** via `samp-compat` plugin — tidak perlu "migrasi open.mp" seperti disebut di master plan §Fase 1.
- Base punya ~450+ dialog ID, ~300+ textdraw, 778 CMD: di 104 file. Setara server RP komersial medium-size.
- 1 akun = 1 karakter — **butuh refactor skema `accounts`/`characters` jadi 3-slot untuk Bloom**.
- Plugin stack kompat open.mp semua; `sampvoice` ⚠️ perlu konfirmasi.
- Mapping ~120 dialog + ~15 textdraw group ke CEF Bloom MVP (fase U2–U4). Sisanya legacy/hibernate.

**Keputusan yang diambil otonom (tanpa tanya owner):**
- Format tabel markdown per audit doc.
- Grouping dialog by comment header di enum GM.pwn (sesuai pola base).
- Prioritas CEF screen mapping: U2 (login/char), U3 (HUD/ATM/report/settings/attach), U4 (property/job/shop/phone/faction/event), U6 (casino).

**Blocker:**
- Tidak ada. Semua tugas sesi A selesai.

**Belum di-audit (butuh sesi dedicated nanti, tidak di scope sesi ini):**
- `database.sql` — audit skema MySQL.
- `megency-standalone/lib/` — inspect versi Chromium CEF untuk confirm ADR-001.
- `TEXTDRAW.pwn` global `CreateTextDraw()` baris 2775+ — untuk fase U2 implementation.
- `DIALOG.pwn` per-dialog response body (deep dive per fase saat implementasi).

**Next (menunggu goal dari owner):**
Owner tinggal set goal eksekusi berikutnya. Rekomendasi: Fase U0 Brand Foundation inti (inspect `megency-standalone/`, generate SVG logo, palette preview HTML, scaffold `bloom-ui/` Svelte).

---

## 2026-10-31 — [Fase: U0 Brand] Checkpoint 1: CEF locked + 9 SVG + 2 preview HTML + brand guidelines

**Yang dikerjakan:**
- Inspect `megency-standalone/lib/arm64-v8a/` — ditemukan `libsampcef_net.so` (Rust TLS/QUIC transport, bukan Chromium). Rendering UI = Android System WebView (verified via `CefWebView.smali` memanggil `android.webkit.WebSettings`, `evaluateJavascript`, `addJavascriptInterface`). minSdk 26 (Android 8+) → Chrome WebView via Play Store, realistis Chromium 110+.
- **ADR-001 LOCKED Accepted**: Svelte 4 + Vite + TypeScript (Chromium ≥79 jauh terlampaui).
- **ADR-004** ditulis mendokumentasikan temuan CEF stack + bridge mechanism (addJavascriptInterface + evaluateJavascript).
- **Revisions log entry**: asumsi "CEF proper" → "Android System WebView wrapper".
- Generate 4 SVG logo static di `bloom-ui/src/assets/brand/`: `logo-primary.svg` (Fredoka), `logo-stacked.svg`, `logo-icon.svg`, `logo-primary-baloo.svg`.
- Generate 5 SVG logo animated di `bloom-ui/src/assets/brand/animated/`:
  - `logo-bloom-intro.svg` (1800ms, bouncy stagger + shimmer sweep + sparkle burst + falling petals).
  - `logo-bloom-loading.svg` (2400ms infinite, pulse petals + rotating center + bokeh drift + traveling sparkle on loop path).
  - `logo-bloom-idle.svg` (4000ms subtle, breathing aura + gentle petal sway).
  - `logo-bloom-celebrate.svg` (1200ms, overshoot scale + 2-wave ring pulse + flash flare + 12 radial particles + falling confetti petals).
  - `logo-bloom-tirai.svg` (1500ms, velvet curtain close/open + spotlight sweep + tassel ornament + reveal sparkles).
- `D:\Bloom\palette-preview.html` — 16 token swatches + 3 gradients + 6 component demos (button, input, badge, toast, chat RP, reward card).
- `D:\Bloom\logo-animated-preview.html` — 5 variant side-by-side dengan replay buttons.
- `docs/brand-guidelines.md` — 1-page summary (10 sections, siap review owner).
- `current-goal.md` di-update ke scope U0 Brand (U0 Setup arsip ke bawah).

**Keputusan otonom:**
- Petal path kawaii pakai cubic bezier spans, 5 petals @72° rotation around center. Petal gradient 3-stop radial (pink-300 → pink-500 → pink-700).
- Center gold `url(#centerGrad)` dengan highlight putih kiri atas untuk feel glossy.
- Shimmer wipe cross wordmark pakai linearGradient animated via translate.
- CREATIVE extras: bokeh drift (loading), ring pulse (celebrate), tassel + spotlight (tirai), falling petals bg (intro+celebrate).
- Baloo 2 comparison dipisah ke file sendiri `logo-primary-baloo.svg`.

**Blocker:** Tidak ada sejauh ini.

**Next:**
- Scaffold `bloom-ui/` package.json + Vite + Svelte 4 + TypeScript config.
- Download fonts (Fredoka, Poppins, Nunito, Caveat) subset Latin woff2.
- "Hello Bloom" di localhost:5173 verified.
- Git init + first commit + tag.

---

## 2026-10-31 — [Fase: U0 Brand] Checkpoint 2 (FINAL): Scaffold + fonts + dev server verified + git init

**Yang dikerjakan:**
- Scaffold `bloom-ui/` lengkap:
  - `package.json` dengan Svelte 4.2.19, @sveltejs/vite-plugin-svelte 3.1.2, vite 5.4.10, typescript 5.6.3, svelte-check 3.8.6, tslib 2.8.0, @tsconfig/svelte 5.0.4.
  - `vite.config.ts` (port 5173, host true, target es2020, sourcemap).
  - `svelte.config.js` dengan vitePreprocess.
  - `tsconfig.json` strict + path aliases ($lib, $assets, $styles).
  - `tsconfig.node.json` untuk vite.config.
  - `index.html` dengan preload stylesheet orderings.
  - `src/main.ts` — bootstrap + compute `--ui-scale` dari window.innerWidth/1366 vs window.innerHeight/768 (ADR-002).
  - `src/App.svelte` — splash sementara: halo pulsing + logo intro SVG + tagline Caveat + glass status chip.
  - `src/vite-env.d.ts` — type ambient untuk SVG imports.
  - `src/styles/tokens.css` — 16 color tokens + 3 gradients + brand-tinted shadows + spacing (base 4px) + radius + motion (fast/medium/slow + bouncy/smooth easing) + z-index scale + `--ui-scale` + reduced-motion fallback.
  - `src/styles/fonts.css` — 9 @font-face declarations ke local .woff2.
  - `src/styles/global.css` — reset + base (font-smoothing, scrollbar pastel, selection pink, link rose).
  - `README.md` + `.gitignore`.
- `npm install` sukses (background, exit 0).
- Font fetch via Google Fonts CSS2 endpoint dengan User-Agent Chrome:
  - fredoka-600.woff2 (29.7KB), fredoka-700.woff2 (29.7KB — variable font same file).
  - poppins-400/500/600/700.woff2 (7.7–8KB each, static).
  - nunito-600.woff2 (27.5KB), nunito-700.woff2 (27.5KB — variable).
  - caveat-400.woff2 (48.8KB).
  - Total 200KB, under 400KB budget.
- `npm run dev` → Vite ready in 906ms di http://localhost:5173/ (verified via log tail, kemudian stopped).
- Plan v1.2 → v1.3 bump: §11 Status UI Track updated. Changelog line added.
- Current-goal DoD semua checkbox ✅.
- Next: git init + commit + tag.

**Keputusan otonom:**
- Dependency versions pinned ke range yang kompatibel + stable. Svelte 4 (bukan 5), @sveltejs/vite-plugin-svelte 3.x (bukan 4.x yang butuh Svelte 5), Vite 5.
- Path aliases via tsconfig `$lib/*`, `$assets/*`, `$styles/*`.
- `--ui-scale` logic di main.ts bukan di CSS JS, so computed sebelum first paint.
- Splash App.svelte: minimal demo pakai logo intro SVG (via import `.svg` → URL) untuk pastikan import pipeline jalan + animasi SMIL ter-render di WebView-class browser.
- Font download pakai regex parser Python yang tolerant URL tanpa `.woff2` extension (Google Fonts dynamic URL `/l/font?kit=...`).

**Hasil akhir Fase U0 Brand Foundation:**
- ✅ Semua 13 DoD item kelar.
- ✅ Vite dev server verified running.
- Siap commit + tag → siap Fase U1.

**Blocker:** Tidak ada. Owner tinggal pilih font (Fredoka vs Baloo 2) di sesi berikutnya saat buka `logo-animated-preview.html` + buka `bloom-ui/src/assets/brand/logo-primary.svg` vs `logo-primary-baloo.svg`.
