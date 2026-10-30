# Decisions Log — Bloom Community (ADR-lite)

Catatan semua Architecture Decision Record ringan. Satu ADR = satu keputusan teknis.

**Format setiap entry:**

```
## ADR-NNN [YYYY-MM-DD] Judul keputusan

**Context:** Apa masalah/kebutuhan yang mendorong keputusan.
**Options considered:** Opsi yang dipertimbangkan + pro/con singkat.
**Decision:** Pilihan final.
**Consequences:** Konsekuensi positif & negatif.
**Status:** Accepted / Tentative / Superseded by ADR-XXX.
```

---

## ADR-001 [2026-10-31] Pakai Svelte 4 + Vite untuk CEF UI (tentatif, pending CEF check)

**Context:** Butuh framework ringan untuk CEF Android low-end (target 100–200 pemain, resolusi 1366×768 & 2400×1080 landscape). Bundle size & FPS 60 kritis karena HP murah jadi target. Belum ada info versi Chromium di `megency-standalone/`.

**Options considered:**
- **Vanilla JS + Lit-html + custom-elements:** zero dep, kompatibel Chromium 60+. Pro: paling ringan, pasti jalan di CEF lama. Con: boilerplate banyak, dev experience kurang, lambat iterasi.
- **Vue 3:** ekosistem besar, dokumentasi bagus. Pro: komunitas luas. Con: runtime ~34KB gzipped, estimasi total bundle ~250KB untuk 10 screen.
- **Svelte 4 + Vite:** compile ke vanilla JS tanpa runtime besar. Pro: bundle terkecil (<150KB total estimasi), reaktivitas native, scoped CSS, HMR Vite cepat, syntax dekat HTML/CSS. Con: butuh Chromium ≥79 (2019).

**Decision:** Svelte 4 + Vite + TypeScript.

**Consequences:**
- Butuh verifikasi versi Chromium CEF di `megency-standalone/lib/` sebelum di-lock.
- Dev experience bagus (HMR <300ms), bundle estimasi <150KB untuk 10 screen.
- Fallback plan: Svelte 3 (Chromium 60+) atau vanilla+Lit kalau Chromium terlalu lama.
- Konsekuensi tim: owner paham Pawn + web, syntax Svelte dekat HTML sehingga mudah dibaca.

**Status:** **✅ Accepted (locked 2026-10-31).** Lihat ADR-004 untuk CEF compatibility findings.

---

## ADR-002 [2026-10-31] Resolusi base design 1366×768 + rem scaling via --ui-scale

**Context:** Target dua resolusi landscape dengan rasio berbeda — PC 1366×768 (16:9) dan Android 2400×1080 (~2.22:1). Perlu strategi scaling yang tidak bikin UI pecah di salah satu target.

**Options considered:**
- **Design di 2400×1080, downscale ke 1366×768:** Pro: HP native. Con: elemen jadi terlalu kecil di PC budget, berisiko overflow.
- **Design di 1366×768, upscale ke 2400×1080 pakai `transform: scale()`:** Pro: sederhana. Con: hit-area touch bisa aneh karena transform tidak mempengaruhi coordinate pointer di beberapa versi Chromium lama.
- **Design di 1366×768, pakai `rem` + CSS variable `--ui-scale` yang di-compute runtime dari viewport ratio:** Pro: hit-area tetap akurat, `rem` otomatis scale semua ukuran, flex ke rasio aneh. Con: harus disiplin pakai `rem` di semua komponen (tidak boleh `px` absolute).

**Decision:** Design base 1366×768. CEF compute `--ui-scale = min(innerWidth/1366, innerHeight/768)` di runtime, `html { font-size: calc(16px * var(--ui-scale)) }`. Semua spacing/size pakai `rem`.

**Consequences:**
- RULE AKTIF #3 (CLAUDE.md): dilarang `px` absolute di komponen UI.
- Testing wajib di dua resolusi dari Fase U1 (tidak ditunda ke Fase U6).
- Perlu helper SCSS/CSS function untuk convert mock pixel ke rem (contoh `calc(24 / 16 * 1rem)` atau helper `rem(24)`).
- Breakpoint `@media (max-aspect-ratio: 16/9)` sebagai fallback hint "putar HP ke landscape" kalau user salah orientasi.

**Status:** Accepted.

---

## ADR-004 [2026-10-31] CEF stack megency-standalone = Android System WebView (bukan Chromium Embedded Framework)

**Context:** ADR-001 butuh verifikasi versi Chromium di client CEF. Owner mengarahkan ke `megency-standalone/lib/` (APK extracted via apktool, package `com.megency.roleplay`, versionName `2.5-megency-voice1`, versionCode 145).

**Investigasi:**
1. `lib/arm64-v8a/` berisi `libsampcef_net.so` (2.8MB, Rust). Terlalu kecil untuk CEF binary (CEF normalnya ~100MB+). Strings extraction: nama simbol JNI `Java_com_nathan_djavalauncher_game_cef_net_CefNetNative_*` + protokol TLS/QUIC + nama internal "SampCefNet" / "samp.cef" / "sampcef_net0.0.0.0". **Confirms: file ini hanya custom TLS network transport ke game server, bukan Chromium.**
2. Grep smali `smali_classes4/com/nathan/djavalauncher/game/cef/view/CefWebView.smali` menemukan panggilan `android.webkit.WebSettings` API: `setJavaScriptEnabled`, `setDomStorageEnabled`, `setUserAgentString`, `setAllowFileAccess`, `setAllowFileAccessFromFileURLs`, `addJavascriptInterface`, `evaluateJavascript`. **Confirms: rendering UI pakai `android.webkit.WebView`, bukan embedded Chromium.**
3. `AndroidManifest.xml`: `minSdkVersion: 26` (Android 8.0 Oreo, 2017-08), `targetSdkVersion: 36` (Android 16, 2025), `compileSdkVersion: 36`.
4. "CEF" di naming konvensi client ini adalah **brand name internal** untuk framework UI mereka, bukan singkatan "Chromium Embedded Framework". Full namespace: `com.nathan.djavalauncher.game.cef` — "djavalauncher" nama launcher-nya.

**Implikasi versi Chromium:**
Android WebView di Android 8+ (SDK 26+) adalah **Chrome WebView yang di-update via Google Play Store independen dari OS**. Floor estimasi:
- **Worst case (device sangat lama tidak update):** Chromium 70+ (early 2019 WebView release).
- **Realistis (device aktif Play Store):** Chromium 110+ (2023).
- **Current (2026):** Chromium 130+ (asumsi Chrome stable channel).

**Konsekuensi untuk ADR-001:**
- ✅ Svelte 4 (butuh Chromium ≥79) **safely compatible**. ADR-001 **LOCKED**.
- ✅ ES2020/ES2022 features (optional chaining, nullish coalescing, private class fields, top-level await) **safe**.
- ⚠️ Perlu safe degradation untuk fitur Chromium 100+ (container queries, has() selector) — hindari di MVP.
- ⚠️ Backdrop-filter sudah supported Chromium 76+ — aman tapi tetap wajib fallback (RULE performance Android low-end).

**Bridge mechanism (dari CefWebView.smali):**
- **JS → Pawn:** `window.CefBridge.send(name, data)` via `addJavascriptInterface` injected object.
- **Pawn → JS:** `webview.evaluateJavascript("window.CefBridge.emit('name', data)", callback)` dipanggil dari Java native yang di-trigger dari server Pawn via protokol `sampcef_net`.
- **Protokol:** TLS/QUIC over custom port (`libsampcef_net.so` menangani ini) membawa payload bridge dari game server Pawn ke client Java → relay ke WebView via evaluateJavascript.
- **Payload wrapping:** sesuai UI Plan §3.3 `{v: 1, data: {...}}`.

**Decision:**
- Lock Svelte 4 + Vite + TypeScript (ADR-001 locked).
- **PENTING UNTUK FASE U5:** CEF client "megency-standalone" ini **bukan platform CEF resmi** melainkan Megency Roleplay client dengan Android WebView wrapper. Dokumentasi bridge spec harus di-reverse engineer dari smali `com/nathan/djavalauncher/game/cef/bridge/` + `view/` + `protocol/` (sudah dilihat strukturnya ada 4 package: bridge, net, protocol, util, view).
- PC version: belum di-inspect di sesi ini — kemungkinan ada binary PC terpisah atau pakai CEF beneran (libcef.so/dll). Fase U5 perlu konfirmasi.

**Status:** Accepted.

---

## ADR-003 [2026-10-31] Figma + HTML prototype paralel sebagai workflow desain

**Context:** Perlu memilih antara Figma-first (desain full dulu, baru code), Code-first (prototype langsung, Figma menyusul), atau paralel. Owner solo + butuh iterasi cepat tapi tetap punya sumber kebenaran visual yang bisa di-review.

**Options considered:**
- **Figma-first:** Pro: visual approved sebelum code, dokumentasi design system rapi. Con: owner solo = Figma final butuh waktu lama, risiko gap desain↔implementasi besar.
- **Code-first:** Pro: iterasi real di browser, prototype langsung jadi starter codebase. Con: tanpa Figma, design system susah di-handoff ke kolaborator (walau solo sekarang), aset mentah susah di-generate ulang.
- **Paralel (Figma + HTML Svelte dari Fase U1):** Pro: Figma = source of truth visual + export aset; HTML = validasi interaksi real + mock bridge testable. Con: butuh disiplin sinkron token Figma→code (via Tokens Studio plugin + Style Dictionary pipeline, satu arah manual).

**Decision:** Paralel. Figma lead untuk logo, tokens (source of truth via Tokens Studio), komponen spec, screen mockup, flow diagram. HTML/Svelte lead untuk primitives implementation, screen prototype interaktif, animasi micro beneran, mock bridge.

**Consequences:**
- Satu Figma file: "Bloom Community – Design System" dengan 8 pages (Cover, Tokens, Components, Screens Mobile, Screens PC, Flows, Playground, Assets).
- Pipeline sync: Tokens Studio → `tokens/bloom.json` → Style Dictionary → `src/styles/tokens.css` (satu arah).
- Export aset wajib dari Figma per screen: frame PNG @2x, SVG ikon unik, SVG/WebP ilustrasi.
- Risiko sinkron: tetap manual export via plugin + cek di code review tiap batch.
- Hosting Figma Free (3 file limit) cukup — semua muat di 1 file.

**Status:** Accepted.
