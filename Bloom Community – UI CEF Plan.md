# Bloom Community — UI CEF Master Plan

*Dokumen ini melengkapi "Bloom Community – Master Plan Server Roleplay open.mp.md". Fokus khusus: brand identity, design system, dan pipeline pembuatan UI CEF. Semua kode gameplay (Pawn, MySQL, bridge Pawn) tetap mengacu ke master plan utama.*

**Versi:** 1.3 · **Tanggal:** 2026-10-31 · **Status:** ✅ Approved by owner. U0 Brand Foundation DoD lengkap.

**Changelog v1.3:** Update §11 Status UI Track — U0 Brand Foundation DoD lengkap. ADR-001 locked Accepted, ADR-004 ditambah (CEF = Android WebView wrapper, bukan Chromium Embedded Framework).

**Changelog v1.2:** Tambah Bagian 12 (Memory Log System) — mekanisme wajib bagi Claude Code untuk mencatat & membaca ulang kesalahan/revisi supaya tidak terulang.

**Keputusan tambahan yang di-approve bersamaan dengan dokumen ini:**
- ✅ Font display: **Fredoka** (locked oleh owner 2026-10-31 setelah review preview di Fase U0 — ADR-005).
- ✅ Fase U0 pertama kali kerjakan: inspect `megency-standalone/lib/` (versi Chromium CEF), lalu generate 3 draft SVG logo + palette preview HTML.
- ✅ Struktur 8 fase U0–U7 locked.
- ✅ Framework Svelte 4 + Vite (tentatif, akan dikonfirmasi oleh hasil inspect CEF di Fase U0 hari 1).

---

## 0. Keputusan dari Survey (locked)

| Topik | Keputusan |
|---|---|
| Visual direction | **Anime / Kawaii Lifestyle** |
| Mood reference | **Zepeto / LINE Play** (bulat, friendly, sticker-heavy) + **Love Nikki / Shining Nikki** (feminine glossy, kostum detail, UI pink mewah) |
| Logo | **Wordmark "Bloom" + simbol bunga** (bukan maskot karakter) |
| Resolusi prioritas | **Android landscape 2400×1080** dan **PC 1366×768** |
| UI framework | **Svelte 4 + Vite** (rekomendasi, lihat §4.1) |
| Design workflow | **Paralel: HTML prototype + Figma library** |
| Server name | Bloom Community |
| Bahasa UI | Indonesia (dengan toggle EN opsional di fase akhir) |

### Implikasi visual gabungan Zepeto × Love Nikki

- Bentuk dasar bulat & chubby (dari Zepeto) → semua kartu radius ≥ 24px, tombol pill, ikon rounded.
- Detail premium mewah (dari Love Nikki) → gradient halus, highlight glossy, border tipis gold/rose, sparkle sparing.
- Hindari: terlalu flat (jadi mirip Material Design biasa), terlalu dewasa gelap (keluar dari girlies).
- Target feel: *"HP cewek yang punya diary magical, bukan dashboard admin."*

---

## 1. Brand Identity

### 1.1 Logo "Bloom"

**Konsep:** Wordmark "bloom" lowercase, huruf "o" pertama atau terakhir diganti/di-overlay dengan ikon bunga mekar (cherry blossom 5-kelopak). Font kandidat: **Fredoka** (rounded chubby), **Baloo 2**, atau **Quicksand SemiBold**.

**Varian wajib:**
1. **Primary (horizontal)** — wordmark + ikon di akhir, untuk header UI dan splash.
2. **Stacked** — ikon di atas, wordmark di bawah, untuk loading screen & favicon besar.
3. **Icon only** — bunga 5-kelopak dalam frame bulat, untuk app icon, favicon, chat avatar.
4. **Monochrome** — versi 1-warna untuk watermark, embed, print.
5. **Dark mode** — adjustment warna agar tetap kontras di background gelap.

**File yang perlu dihasilkan di Fase U0:**
- `logo-primary.svg`, `logo-stacked.svg`, `logo-icon.svg`
- `logo-primary-mono.svg`, `logo-icon-mono.svg`
- PNG @1x @2x @3x untuk setiap varian (1024, 2048, 3072)
- `.ico` 256px untuk favicon dashboard web
- Android launcher icon (adaptive: foreground + background, 108×108dp)

**Tagline opsional:** "Where every story blooms." (EN) · "Tempat setiap cerita bermekaran." (ID)

### 1.1.1 Logo Animated — Spec untuk In-Game 🌸✨

Logo di in-game (splash, loading, idle corner watermark, char selection intro, event popup) **wajib animated**, bukan sekadar PNG/SVG statis. Spec:

**Varian animasi:**

| Nama | Durasi | Loop | Dipakai di |
|---|---|---|---|
| `logo-bloom-intro` | 1800ms | once | Splash screen, startup |
| `logo-bloom-loading` | 2400ms | infinite | Loading screen between scenes |
| `logo-bloom-idle` | 4000ms | infinite | Watermark pojok UI (subtle) |
| `logo-bloom-celebrate` | 1200ms | once | Event claim, achievement, success besar |
| `logo-bloom-tirai` | 1500ms | once | Transisi tirai panggung masuk/keluar |

**Mekanisme animasi `logo-bloom-intro` (hero animation):**
1. **0–200ms** — Center gold circle muncul (scale 0 → 1.1 → 1, bouncy easing).
2. **200–800ms** — 5 kelopak muncul berurutan dari center ke outward, delay 80ms antar kelopak (petal 1 top → petal 2 right → petal 3 bottom-right → petal 4 bottom-left → petal 5 left). Setiap kelopak scale 0 → 1 + rotate dari center.
3. **600–1200ms** — Wordmark "bloom" fade+slide dari kiri, letter-by-letter stagger 60ms.
4. **1200–1800ms** — Sparkle burst (3–5 particle putih/butter) mengelilingi logo, lalu fade out.

**Mekanisme `logo-bloom-loading` (infinite):**
- Kelopak-kelopak **bergantian pulse** (opacity 0.7 → 1 → 0.7) dengan phase shift 500ms per kelopak.
- Center gold circle **slow rotate** (full 360° / 4s).
- Setiap 1200ms, 1 **particle sparkle** melintas dari pojok ke pojok (random position).
- Keseluruhan logo **breathing** scale 1.00 → 1.03 → 1.00 (durasi 2400ms, ease-in-out).

**Mekanisme `logo-bloom-idle` (subtle watermark):**
- Center gold **gentle pulse** opacity 0.8 → 1 (durasi 4000ms).
- 1 kelopak random **gentle sway** rotate ±5° (durasi 3000ms, ease-in-out).
- Keseluruhan opacity 0.6–0.8 (nggak boleh ganggu gameplay).

**Mekanisme `logo-bloom-celebrate` (reward burst):**
- Logo scale 0 → 1.3 → 1 (overshoot, 600ms).
- 12 particle (butter, pink, coral) burst radial dari center ke 360° (800ms).
- Kelopak-kelopak "bloom" (scale individual 0 → 1 dengan rotate ±15°).
- Center gold **flash flare** (brightness 1 → 2 → 1 di 300ms).
- Sound: `sfx-success.ogg` + optional `sfx-sparkle.ogg`.

**Mekanisme `logo-bloom-tirai` (curtain transition):**
- 2 tirai velvet pink dari kiri+kanan close/open.
- Di center tirai, logo stacked muncul saat tirai open (reveal pattern).
- Pakai `clip-path` horizontal untuk reveal effect.

**Implementasi teknis (pilih yang mana):**

Opsi 1: **Pure SVG + CSS/SMIL animation** (REKOMENDASI MVP)
- Zero runtime cost, inline SVG di komponen Svelte.
- CSS keyframes untuk pulse/breathing/rotate.
- SMIL (`<animate>`, `<animateTransform>`) untuk path morph.
- Pro: ringan (<10KB), scalable, nggak butuh dependency.
- Con: SMIL support di Chromium bagus, di browser lain kurang (nggak masalah untuk CEF).

Opsi 2: **Lottie JSON** (After Effects → bodymovin)
- Butuh file .json + lottie-web runtime (~65KB gzipped).
- Pro: smooth, bisa animasi kompleks, mudah di-tweak di After Effects.
- Con: butuh asset creator pakai AE, bundle lebih besar.

Opsi 3: **GSAP + inline SVG** (hybrid)
- Butuh gsap library (~70KB).
- Pro: timeline control granular, bisa trigger program-based.
- Con: dependency tambahan.

**Decision default: Opsi 1 (SVG + CSS/SMIL) untuk MVP.** Opsi 2 dibuka kalau ada animasi yang terlalu kompleks untuk SMIL (nanti di Fase U6 polish).

**File yang dihasilkan di Fase U0:**
- `logo-bloom-intro.svg` (dengan SMIL animations inline)
- `logo-bloom-loading.svg`
- `logo-bloom-idle.svg`
- `logo-bloom-celebrate.svg`
- `logo-bloom-tirai.svg` (atau komponen Svelte terpisah karena pakai 2 element)
- Component Svelte wrapper: `<BloomLogo variant="intro|loading|idle|celebrate|tirai" />`

**Performance budget:**
- Total animated logo files: <80KB gzipped.
- Max 60fps di 1366×768, 60fps di 2400×1080 landscape.
- Reduced-motion mode: `logo-bloom-loading` jadi `logo-bloom-idle` (lebih pelan).
- Semua animasi pakai `transform` + `opacity` only (nggak layout trigger).

### 1.2 Palet warna final (Bloom v2)

Refinement dari palet di master plan + kebutuhan kontras AA minimum pada Android.

| Token CSS | HEX | HSL | Peran utama |
|---|---|---|---|
| `--bloom-pink-500` | `#FFB7D5` | 335 100% 86% | Primary brand, CTA utama |
| `--bloom-pink-700` | `#FF8FBC` | 335 100% 78% | Hover, pressed state |
| `--bloom-pink-300` | `#FFD9E8` | 335 100% 92% | Background CTA soft, chip |
| `--bloom-rose-500` | `#F48FB1` | 340 80% 76% | Aksen hangat, highlight hadiah |
| `--bloom-lavender-500` | `#C8A8E9` | 272 59% 79% | Secondary brand, badge, premium |
| `--bloom-sky-500` | `#A8D8F0` | 203 70% 80% | Info, link, chat system |
| `--bloom-mint-500` | `#A8E6CF` | 150 54% 78% | Success, income, buff |
| `--bloom-butter-500` | `#FFE8A8` | 44 100% 83% | Warning, star rating, event |
| `--bloom-peach-500` | `#FFCBA4` | 25 100% 82% | Secondary card, friendly accent |
| `--bloom-coral-500` | `#FFA2A2` | 0 100% 82% | Danger, HP low, delete |
| `--bloom-cream-50` | `#FFF9F5` | 25 100% 98% | Background utama |
| `--bloom-cream-100` | `#FFF0E8` | 20 100% 95% | Panel sekunder |
| `--bloom-ink-900` | `#4A3B5C` | 268 22% 30% | Teks utama (bukan hitam!) |
| `--bloom-ink-700` | `#6B5B7E` | 268 16% 42% | Teks sekunder |
| `--bloom-ink-500` | `#9B8DB0` | 268 16% 62% | Teks disabled, placeholder |
| `--bloom-gold-500` | `#F0C27B` | 34 76% 72% | Premium border, VIP, achievement |
| `--bloom-glass` | `rgba(255,255,255,0.65)` | — | Overlay panel (backdrop-filter) |

**Gradient utama:**
- `--grad-bloom`: linear-gradient(135deg, #FFB7D5 0%, #C8A8E9 100%) — background hero, splash
- `--grad-dream`: linear-gradient(180deg, #FFD9E8 0%, #FFF9F5 60%) — card hadiah, popup
- `--grad-glass`: linear-gradient(135deg, rgba(255,255,255,0.5), rgba(255,255,255,0.2)) — glassmorphism

**Aturan tabu:**
- Dilarang pakai `#000000` murni. Teks paling gelap `#4A3B5C`.
- Dilarang `#FFFFFF` murni untuk teks kecil (<14px) di atas gradient; pakai cream.
- Shadow selalu dari warna brand (pink/lavender) dengan opacity rendah, bukan hitam.
  Contoh: `box-shadow: 0 8px 24px rgba(255, 143, 188, 0.25);`

### 1.3 Tipografi

| Role | Font | Weight | Ukuran dasar |
|---|---|---|---|
| Display (hero, splash, title screen besar) | **Fredoka** | 600, 700 | 32–64px |
| Heading (judul panel, modal) | **Poppins** | 600 | 20–28px |
| Body (teks umum, dialog) | **Poppins** | 400, 500 | 14–16px |
| UI label (button, badge, tab) | **Poppins** | 500, 600 | 12–14px |
| Numeric (uang, HP, speedometer) | **Nunito** / **Poppins tabular-nums** | 600, 700 | 14–40px |
| Decorative accent (quote, event banner) | **Caveat** atau **Dancing Script** | 400 | 20–32px |

Semua font dihost lokal di `ui/assets/fonts/`. Subset karakter: Latin Extended + simbol basic (hemat ukuran, Indonesia nggak perlu Latin Extended full).

**Target ukuran font files total: <400KB.** Pakai `.woff2` only.

### 1.4 Ikonografi

- **Primary icon set:** custom bergaya **sticker rounded 2-tone** (outline + fill soft). Stroke 2px, radius sudut 2px, size base 24×24.
- **Fallback / bulk:** Material Design Icons webfont (sudah ada di client Megency `materialdesignicons-webfont.ttf`) — pakai hanya untuk ikon yang belum ada versi custom.
- **Emoji sticker set:** 20–30 sticker ekspresi (happy, sad, excited, love, confused) untuk chat & notifikasi. Dibuat sebagai SVG, size 48×48, dengan versi animasi (Lottie) opsional.

**Naming convention ikon:**
```
icon-{category}-{name}-{style}.svg
contoh:
  icon-ui-close-sticker.svg
  icon-ui-close-line.svg
  icon-item-dress-sticker.svg
  icon-emoji-happy-animated.json  (Lottie)
```

### 1.5 Motion & micro-interaction

- Durasi standar: **200ms** (fast), **320ms** (medium), **500ms** (slow).
- Easing utama: `cubic-bezier(0.34, 1.56, 0.64, 1)` (bouncy-out) untuk masuk; `cubic-bezier(0.4, 0, 0.2, 1)` (smooth) untuk keluar.
- Sinyal success: ✨ sparkle burst 400ms + scale 0.95→1.05→1.
- Sinyal error: shake horizontal 300ms + warna coral flash.
- Hover (hanya PC): scale 1.02 + shadow intensify.
- Press (PC & Android): scale 0.96, 100ms.
- **Reduced motion toggle wajib ada di settings** untuk Android low-end.

### 1.6 Sound design (ringan)

Semua sound ≤30KB `.ogg`, mono, 22kHz:
- `sfx-click.ogg` — soft "pop" ketika tap
- `sfx-success.ogg` — bell chime short
- `sfx-error.ogg` — soft "nope" descending tone
- `sfx-notification.ogg` — twinkle 2 nada
- `sfx-coin.ogg` — untuk transaksi uang
- `bgm-login.ogg` — loop 30 detik, lo-fi pastel (opsional, bisa di-mute default)

---

## 2. Design System Bloom v2

### 2.1 Design tokens (Tokens Studio format)

Tokens akan diekspor dari Figma via plugin **Tokens Studio for Figma** ke JSON, lalu di-convert ke CSS variables via **Style Dictionary**. Satu sumber kebenaran.

Struktur token file (`tokens/bloom.json`):
```
tokens/
  core/
    color.json       (palet mentah: pink-100 s/d pink-900, dst)
    space.json       (0, 4, 8, 12, 16, 24, 32, 48, 64, 96)
    radius.json      (sm:8, md:16, lg:24, xl:32, full:9999)
    shadow.json      (sm, md, lg, glow-pink, glow-lavender)
    typography.json  (display, h1-h6, body-lg/md/sm, label, numeric)
    motion.json      (duration + easing)
  semantic/
    light.json       (menugaskan core token ke peran: bg, surface, primary, dll)
    dark.json        (dark mode mapping — fase akhir)
  component/
    button.json
    card.json
    input.json
    ...
```

### 2.2 Komponen UI (library target)

Dibangun bertahap di Fase U1. Setiap komponen punya 3 state minimal (default, hover/active, disabled).

**Primitives:**
- Button (primary, secondary, ghost, danger, icon-only; size sm/md/lg)
- Input (text, number, password, search, textarea)
- Select / Dropdown
- Checkbox, Radio, Toggle switch
- Slider (dengan tooltip nilai, untuk character creator)
- Badge, Chip, Tag
- Avatar (round, square-rounded; dengan status dot)
- Progress bar (linear, radial, segmented)
- Divider

**Containers:**
- Card (basic, hover-lift, premium bordered)
- Panel (dengan header + body + footer)
- Modal / Dialog (dengan tirai panggung opening)
- Drawer (slide dari kanan/kiri)
- Toast / Notification
- Tooltip, Popover

**Patterns:**
- Tab bar (horizontal, vertical)
- Pagination
- List item (dengan ikon kiri + action kanan)
- Form group (label + input + helper + error)
- Empty state (ilustrasi + text + CTA)
- Loading state (skeleton, spinner bunga, bar)
- Confirm dialog

**Game-specific:**
- HUD stat bar (HP, armor, hunger, thirst)
- Money display (cash, bank, dirty — dengan ikon)
- Minimap frame
- Compass
- Hotbar (10 slot keyboard shortcut)
- Chat message bubble (/me, /do, /ooc dengan warna beda)
- Dialog NPC (dengan portrait)
- Nametag (nama di atas kepala karakter, 3D projected)

### 2.3 Spacing & grid

- Base unit: **4px**. Semua spacing kelipatan 4.
- Grid in-game HUD: 12 kolom di PC, 8 kolom di Android landscape.
- Safe area padding: 24px dari edge layar (lebih besar di Android karena notch).
- Z-index scale: 0 (base), 10 (sticky), 20 (dropdown), 30 (sticky header), 40 (drawer), 50 (modal), 60 (toast), 70 (tooltip), 100 (debug overlay).

### 2.4 Responsive strategy untuk 2400×1080 + 1366×768

Kedua target landscape dengan rasio berbeda:
- 2400×1080 = 2.22:1 (ultra-wide-ish)
- 1366×768 = 1.78:1 (16:9 standar)

**Pendekatan: fixed design width + CSS zoom scaling.**

Design base: **1366×768** (lebih ketat, biar nggak overflow di laptop).

Pada runtime, CEF akan apply:
```js
const scaleX = window.innerWidth / 1366;
const scaleY = window.innerHeight / 768;
const scale = Math.min(scaleX, scaleY);
document.documentElement.style.setProperty('--ui-scale', scale);
```

Lalu seluruh UI pakai `rem` dengan `html { font-size: calc(16px * var(--ui-scale)); }`. Komponen pakai `rem` otomatis scale.

**Untuk Android 2400×1080:** scale = ~1.76. UI jadi besar proporsional. Elemen tetap kelihatan proporsional di layar HP yang jauh lebih padat pixel.

**Alternatif:** pakai `transform: scale()` di root container. Lebih sederhana, tapi hit-area touch bisa aneh. Pilih approach `rem` scaling.

Breakpoint untuk layout bersyarat (jarang dipakai, karena UI landscape fixed):
- `@media (max-aspect-ratio: 16/9)` — fallback kalau user mainnya portrait tanpa sengaja → tampilkan hint "putar HP ke landscape".

---

## 3. Rekomendasi Framework & Arsitektur CEF

### 3.1 Pilihan framework: **Svelte 4 + Vite** (final)

**Alasan:**
- Bundle size terkecil di antara framework modern: komponen compile ke vanilla JS tanpa runtime besar. Untuk 10 screen, estimasi bundle total <150KB gzipped. Vue3 setara ~250KB, React ~300KB.
- Reaktivitas native tanpa virtual DOM overhead → render cepat di Android low-end.
- Syntax dekat ke HTML/CSS vanilla → mudah belajar untuk owner.
- Vite dev server HMR cepat → iterasi UI < 300ms per save.
- Mendukung scoped CSS otomatis → nggak ada kebocoran style antar komponen.

**Pertimbangan risk:**
- CEF di client Megency perlu dicek versi Chromium-nya. Svelte 4 butuh Chromium ≥79 (2019). Kalau CEF-nya pakai CEF 76 atau lebih lama, downgrade ke **Svelte 3** (support Chromium 60+) atau fallback **vanilla JS + Alpine.js**.
- **Action item Fase U0:** owner cek library CEF di `megency-standalone/lib/` untuk versi Chromium.

**Alternatif cadangan (kalau Svelte nggak kompatibel):**
- Vanilla ES6 + Lit-html + custom-elements → zero runtime, Chromium 60+ friendly.

### 3.2 Struktur folder UI

```
bloom-ui/
├── package.json
├── vite.config.ts
├── svelte.config.js
├── tsconfig.json
├── index.html                    (entry — hanya satu, SPA)
├── src/
│   ├── main.ts                   (bootstrap, bridge init)
│   ├── App.svelte                (router outlet)
│   ├── lib/
│   │   ├── bridge/               (CEF ↔ Pawn communication)
│   │   │   ├── events.ts         (type-safe event emitter)
│   │   │   ├── schema.ts         (zod/valibot schemas untuk payload)
│   │   │   └── mock.ts           (mock bridge untuk dev tanpa server)
│   │   ├── stores/               (Svelte stores: auth, character, hud, chat)
│   │   ├── utils/                (format money, time, i18n)
│   │   └── i18n/                 (id.json, en.json)
│   ├── components/               (library UI dari §2.2)
│   │   ├── primitives/
│   │   ├── containers/
│   │   ├── patterns/
│   │   └── game/
│   ├── screens/                  (page-level, 1 folder per screen)
│   │   ├── splash/
│   │   ├── login/
│   │   ├── char-select/
│   │   ├── char-create/
│   │   ├── hud/
│   │   ├── inventory/
│   │   ├── phone/
│   │   ├── chat/
│   │   ├── event-login/
│   │   └── settings/
│   ├── styles/
│   │   ├── tokens.css            (generated dari Tokens Studio)
│   │   ├── global.css
│   │   ├── fonts.css
│   │   └── animations.css
│   └── assets/
│       ├── fonts/                (.woff2)
│       ├── icons/                (.svg, dioptimasi via SVGO)
│       ├── images/               (illustrations, backgrounds)
│       ├── sounds/               (.ogg)
│       └── lottie/               (.json animasi)
├── public/
│   └── favicon.ico
└── dist/                         (output build, nanti dicopy ke client Megency)
```

### 3.3 Bridge CEF ↔ Pawn (spec minimal)

Mengacu ke master plan §3.2, bridge-nya perlu didokumentasi dari gamemode referensi di Fase 0. Sambil menunggu, saya definisikan **kontrak protokol** untuk UI:

**Dari server (Pawn) ke UI (JS):**
```js
window.BloomBridge.on('event:name', (data) => { ... });
```
Event standar MVP:
- `ui:show` `{screen: 'login' | 'char-select' | ..., payload: {...}}` — buka screen
- `ui:hide` `{screen: '...'}` — tutup screen
- `auth:result` `{success: bool, token?: string, error?: string}`
- `character:list` `{characters: [{slot, name, level, lastPlayed, appearance}]}`
- `hud:update` `{hp, armor, hunger, thirst, cash, bank, speed}`
- `chat:message` `{channel: 'me'|'do'|'ooc'|'ic', sender, text, timestamp}`
- `notification:show` `{type, title, body, icon?, duration?}`
- `event:daily-reward` `{eventKey, day, items: [...]}`

**Dari UI (JS) ke server (Pawn):**
```js
window.BloomBridge.emit('action:name', data);
```
Action standar MVP:
- `auth:login` `{username, password}`
- `auth:register` `{username, password, email}`
- `character:select` `{slot}`
- `character:create` `{slot, name, age, gender, origin, appearance}`
- `character:delete` `{slot, confirmText}`
- `inventory:use` `{itemId}`
- `inventory:equip` `{itemId, slot}`
- `chat:send` `{channel, text}`
- `event:claim-reward` `{eventKey, day}`

Semua payload JSON diversi: `{v: 1, data: {...}}` agar bisa upgrade tanpa break.

**Mock bridge untuk dev:** `src/lib/bridge/mock.ts` emulasi semua event di browser biasa — kita bisa develop & test UI tanpa SA-MP client sama sekali.

---

## 4. Workflow Design (Figma + HTML Paralel)

### 4.1 Figma library structure

Satu Figma file: **"Bloom Community – Design System"**.

Pages:
1. **🌸 Cover** — logo variant, color palette, type scale (hand-off ready).
2. **🎨 Tokens** — Tokens Studio sources (color, space, radius, shadow, motion).
3. **📦 Components** — library semua primitives, containers, patterns, game-specific.
4. **📱 Screens – Mobile Landscape (2400×1080)** — mockup setiap screen.
5. **🖥 Screens – PC (1366×768)** — mockup setiap screen.
6. **🎞 Flows** — alur navigasi antar screen (login → char-select → in-game).
7. **🧪 Playground** — eksperimen, versi alternatif.
8. **📎 Assets** — raw SVG, ilustrasi, mascot sketches, mood board referensi.

**Workflow sinkron Figma ↔ Code:**
- Design di Figma → export tokens via Tokens Studio plugin → push ke GitHub `tokens/bloom.json`.
- Pre-build hook: Style Dictionary convert JSON → `src/styles/tokens.css`.
- Vite rebuild → UI update dengan warna/spacing baru.
- **Satu arah dulu (Figma → Code)**. Sync bi-directional ditunda.

**Export aset wajib dari Figma per screen:**
- Full screen frame PNG @2x (preview)
- Semua ikon unik di screen → SVG individual
- Semua ilustrasi → SVG atau WebP

### 4.2 HTML prototype paralel

Dibangun langsung di Svelte+Vite dari Fase U1. Tujuan prototype:
- Validasi feel real di browser (klik, hover, animasi) sebelum masuk CEF.
- Jadi starter codebase MVP, bukan throwaway.
- Jalankan `npm run dev` → `http://localhost:5173` → preview di PC & HP (via network IP).

**Keuntungan paralel vs Figma-only:**
- Developer bisa lanjut bikin logic game tanpa nunggu Figma final.
- Interaksi real (scroll inertia, drag item inventory) kelihatan beneran.
- Mock bridge bikin bisa testing end-to-end tanpa SA-MP.

### 4.3 Pembagian tugas Figma vs HTML

| Deliverable | Figma lead | HTML lead |
|---|---|---|
| Logo & brand marks | ✅ | — |
| Color & type tokens | ✅ (source of truth) | ✅ (consumer) |
| Komponen primitives | ✅ (spec) | ✅ (implementasi) |
| Screen mockup | ✅ (final design) | ✅ (prototype interaktif) |
| Flow diagram | ✅ | — |
| Animasi micro | ⚠️ (sketch only) | ✅ (implementasi beneran) |
| Mascot stickers (jika ditambah nanti) | ✅ | — |

---

## 5. Roadmap per Fase — UI/CEF Track

Setiap fase menyertakan: **tujuan**, **deliverable**, **estimasi effort** (bukan deadline kaku), dan **gate check** (syarat lanjut ke fase berikut).

### Fase U0 – Brand Foundation 🌱

**Tujuan:** Punya identitas visual Bloom yang locked sebelum mulai komponen.

**Deliverable:**
- Logo final (5 varian + source Figma + export PNG/SVG)
- Palet warna final + token JSON di repo
- Tipografi final (font files + spesifikasi scale)
- Mood board di Figma (20–30 referensi dari Zepeto + Love Nikki)
- Dokumen `docs/brand-guidelines.md` (1 halaman, ringkas)
- Decision: versi CEF di client Megency → pilih Svelte 4 vs Svelte 3 vs vanilla

**Effort:** 1 minggu kerja solo (3–5 jam/hari).

**Gate check:** Owner approve logo + palette. Framework decision locked.

### Fase U1 – Design System Core 📦

**Tujuan:** Component library yang bisa dirakit jadi screen apapun.

**Deliverable:**
- Figma library komponen (primitives + containers + patterns) — minimal 25 komponen.
- Svelte component library di `src/components/` yang 1:1 dengan Figma.
- Storybook atau halaman playground di `/__playground` yang nunjukin semua komponen.
- Style Dictionary pipeline Figma Tokens → CSS variables jalan.
- Dokumen `docs/component-catalog.md` (per komponen: props, variant, contoh pakai).

**Effort:** 2–3 minggu.

**Gate check:** Semua primitives (Button, Input, Card, Modal, Toast) accessible, animasi masuk/keluar jalan, berjalan di Chromium versi target.

### Fase U2 – Core Entry Flow (MVP tier 1) 🎭

**Tujuan:** Pemain bisa dari splash sampai masuk game dengan karakter.

**Deliverable screen:**
1. **Splash Screen** — logo Bloom, loading bar bunga mekar, tirai panggung animasi.
2. **Login / Register** — tabs, form validation, animasi tirai naik saat sukses.
3. **Character Selection** — 3 slot card dengan preview 3D placeholder, tombol Play/Create/Delete, animasi hover tilt.
4. **Character Creator** — multi-step wizard (Identity → Face → Hair → Body → Outfit), slider & color picker custom, preview rotatable.
5. **Loading In-Game** — tirai turun, tips roleplay, progress bar.

**Deliverable teknis:**
- Mock bridge handle semua event di atas.
- Semua screen di Figma final + Svelte implementation.
- Transisi antar screen smooth (fade + scale, 320ms).
- Form validation realtime dengan pesan error pastel.
- Settings minimal: volume, reduced motion toggle, bahasa (ID default).

**Effort:** 3–4 minggu.

**Gate check:** Playthrough end-to-end dari splash ke "masuk dunia" di browser mock, tanpa error. Tested di 1366×768 dan di HP landscape (via Chrome mobile emulator).

### Fase U3 – In-Game Essentials (MVP tier 2) 🎮

**Tujuan:** Pemain bisa main dengan HUD, inventory, chat, phone standar.

**Deliverable screen:**
1. **HUD Overlay** — HP/armor/hunger/thirst bar, uang (cash/bank), speedometer+fuel, minimap frame, kompas, hotbar 10 slot, notifikasi floating.
2. **Chat UI** — box kiri bawah, 4 channel (/me, /do, /ooc, IC), timestamp, scroll history, mention highlight.
3. **Inventory + Clothing** — grid 5×8, drag-drop, kategori tab, preview karakter real-time, equip/unequip, context menu per item.
4. **Phone UI** — frame HP cute di tengah layar, 9 app grid: Contacts, Messages, Map, Bank, Shop, Camera, Gallery, Settings, Store. (Minimal 3 app jalan: Messages, Bank, Settings.)
5. **Notification system** — toast kanan atas, badge counter, sound.

**Effort:** 4–5 minggu.

**Gate check:** Semua state HUD update dari mock bridge dengan latency <50ms. Drag-drop inventory smooth 60fps di laptop budget.

### Fase U4 – Event, Economy & Social 🎁

**Tujuan:** Fitur retention jalan.

**Deliverable screen:**
1. **Daily Login Popup** — kalender 7-hari, hadiah per hari, animasi klaim (sparkle burst + sound).
2. **Event Calendar** — kalender bulanan dengan highlight event, detail event per klik, claim UI.
3. **Shop UI** — grid item dengan filter kategori + harga + rarity, cart, konfirmasi beli, animasi uang keluar.
4. **Bank UI** — balance besar, deposit/withdraw/transfer, history transaksi.
5. **Friends list + Request** — minimal viable social list.

**Effort:** 2–3 minggu.

**Gate check:** Alur event Valentine (contoh di master plan §14.5) end-to-end: trigger di tanggal, popup muncul, claim sukses, item masuk inventory.

### Fase U5 – CEF Integration & Bridge Real 🔌

**Tujuan:** UI yang di-browser pindah ke CEF client real, nyambung ke Pawn.

**Deliverable:**
- Dokumen `docs/cef-bridge-spec.md` final berdasarkan audit gamemode referensi.
- Build pipeline: `npm run build` → `dist/` → auto copy ke `megency-standalone/assets/ui/`.
- Pawn-side wrapper include `includes/bloom_ui.inc` untuk emit/listen event.
- End-to-end test: login dari CEF beneran, data masuk MySQL, character muncul.
- Fallback handling: kalau bridge disconnect, UI tampilkan state "menyambungkan..." dengan retry.

**Effort:** 2–4 minggu (sangat tergantung kompleksitas bridge Megency).

**Gate check:** 5 orang beta tester bisa login & jalan 15 menit tanpa crash di Android.

### Fase U6 – Polish, Audio, Accessibility 💅

**Tujuan:** UI terasa "mahal" dan nyaman dipakai lama.

**Deliverable:**
- Semua sound effect di-apply (click, success, error, notification, coin, bgm login).
- Lottie animasi untuk ikon besar (bunga mekar, konfeti, bintang berkelap).
- Haptic feedback hook (vibration API) di Android untuk aksi penting.
- Mode "Reduced motion" & "Low performance" (matikan backdrop-filter, kurangi partikel).
- Mode "Dark" opsional (jadi branch design terpisah, nggak wajib MVP).
- Accessibility: focus ring jelas, keyboard navigation lengkap, aria-label.
- Dokumen QA checklist `docs/ui-qa.md`.

**Effort:** 2–3 minggu.

**Gate check:** 10 orang beta rate UX ≥4/5 di survey post-session.

### Fase U7 – Admin Dashboard UI (web) 🛠

**Tujuan:** Dashboard web (bukan CEF) untuk admin kelola item custom, event, paintjob.

Mengikuti master plan §14.4. UI dashboard pakai design system Bloom juga, tapi lebih "productive" (lebih rapat, grid 12 col 1440px). Framework: Svelte Kit atau Next.js — tbd.

**Effort:** 3–4 minggu.

---

## 6. Timeline Estimasi Total (UI/CEF only)

| Fase | Effort | Kumulatif |
|---|---|---|
| U0 Brand Foundation | 1 minggu | 1 minggu |
| U1 Design System Core | 2–3 minggu | 3–4 minggu |
| U2 Core Entry Flow | 3–4 minggu | 6–8 minggu |
| U3 In-Game Essentials | 4–5 minggu | 10–13 minggu |
| U4 Event & Economy | 2–3 minggu | 12–16 minggu |
| U5 CEF Integration | 2–4 minggu | 14–20 minggu |
| U6 Polish | 2–3 minggu | 16–23 minggu |
| U7 Admin Dashboard | 3–4 minggu | 19–27 minggu |

**Total realistis MVP (U0–U5): ~3.5–5 bulan** kerja solo paruh waktu. Launch beta setelah U5+U6 polish minimum.

---

## 7. Deliverable Lintas Fase

### Repo structure final (di Fase U0 end)
```
bloom-community/
├── bloom-ui/              (Svelte + Vite — fokus plan ini)
├── bloom-gamemode/        (Pawn open.mp — mengikuti master plan)
├── bloom-dashboard/       (Node.js admin web — Fase U7)
├── bloom-launcher/        (opsional, kalau butuh custom launcher)
├── docs/
│   ├── brand-guidelines.md
│   ├── component-catalog.md
│   ├── cef-bridge-spec.md
│   ├── asset-pipeline.md
│   ├── ui-qa.md
│   └── decisions.md
└── assets-raw/            (sumber Figma export, SVG mentah)
```

### Git strategy
- Branch: `main` (stable), `develop` (integration), `feature/*` (per screen/komponen).
- Tag release: `ui-v0.1.0-alpha` dst.
- Commit convention: Conventional Commits (`feat(ui): add character creator`).

---

## 8. Risiko Spesifik UI

| Risiko | Kemungkinan | Dampak | Mitigasi |
|---|---|---|---|
| CEF Megency pakai Chromium lama, Svelte 4 nggak jalan | Sedang | Tinggi | Cek versi di Fase U0 hari pertama. Siapkan fallback Svelte 3 / vanilla. |
| Font & icon total bikin bundle jadi besar | Rendah | Sedang | Subset Latin, pakai .woff2, lazy-load font dekoratif, SVGO untuk ikon. |
| Backdrop-filter blur bikin FPS drop di Android low-end | Tinggi | Sedang | Reduced-motion mode wajib. Fallback solid cream background. |
| Figma Tokens Studio tidak sinkron ke code | Rendah | Rendah | Satu arah manual export via plugin, cek di code review tiap batch. |
| Scaling 1366×768 → 2400×1080 bikin UI pecah | Sedang | Sedang | Testing dua resolusi dari Fase U1. Use `rem` scaling, jangan px absolute. |
| Owner solo + fatigue → progres macet | Tinggi | Tinggi | Buat task list mingguan kecil. Celebrate milestone kecil. Hindari over-polish di awal. |
| Figma file bengkak jadi lambat | Sedang | Rendah | Pisah per page, archive versi lama ke branch Figma, pakai Variants dengan benar. |

---

## 9. Keputusan Terbuka (butuh input owner)

1. **Versi CEF client Megency** — perlu diperiksa `megency-standalone/lib/` dan `smali/` untuk string "Chromium" atau "CEF". Owner cek atau izinkan AI inspect.
2. **Hosting Figma** — pakai Figma Free (3 file limit) atau Figma Professional? Design system Bloom muat di 1 file, aman di Free.
3. **Repo hosting** — GitHub private? GitLab self-host? Owner tentukan.
4. **Mascot karakter** — walau logo sudah diputuskan wordmark+bunga, apakah tetap mau mascot sticker untuk emoji chat & empty state? (Rekomendasi: ya, nama "Bloomie" — kelinci atau hamster chibi, dibikin di Fase U6.)
5. **Nama font final** — Fredoka vs Baloo 2 untuk display. Butuh preview di logo.
6. **Lisensi SA-MP/open.mp** — pastikan client Megency boleh dipakai untuk server publik. (Di luar scope UI, tapi penting sebelum rilis.)
7. **Rating konten** — "girlies pastel" tetap PG rated / family friendly? Konfirmasi batasan RP (nggak ada konten eksplisit).

---

## 10. Next Steps Konkret (minggu ini)

1. ✅ Approve dokumen ini (atau catat perubahan).
2. 🔍 **AI inspect `megency-standalone/`** untuk cek versi Chromium CEF — bisa dilakukan sekarang.
3. 🎨 **Buat SVG logo draft 3 varian** (saya generate di chat untuk kamu pilih).
4. 🎨 **Buat color palette preview** (HTML single file untuk dilihat di browser & HP).
5. 📁 **Setup repo** `bloom-community` di GitHub private + struktur folder dasar.
6. 🖼 **Setup Figma file** "Bloom Community – Design System" + install Tokens Studio plugin.
7. 📝 **Update master plan utama** section Status Proyek: Fase saat ini pindah ke "Fase 0 + U0 paralel".

---

## 11. Status UI Track (diperbarui tiap sesi)

- **Fase saat ini:** **U0 Brand Foundation — DoD lengkap (2026-10-31).**
- **Selesai:**
  - U0 Setup Phase — memory log system + 5 audit docs base gamemode.
  - U0 Brand Foundation inti:
    - CEF stack ter-inspect: Android System WebView (bukan Chromium Embedded Framework). ADR-004 recorded.
    - ADR-001 LOCKED Accepted: Svelte 4 + Vite + TypeScript (Chromium Chrome WebView, floor >>79).
    - 4 SVG logo static di `bloom-ui/src/assets/brand/`: primary, stacked, icon, baloo (comparison).
    - 5 SVG logo animated di `bloom-ui/src/assets/brand/animated/`: intro, loading, idle, celebrate, tirai (SMIL, CREATIVE extras: falling petals, bokeh drift, breathing aura, ring pulse, spotlight sweep + tassels).
    - `palette-preview.html` (16 token + 3 gradient + 6 komponen) + `logo-animated-preview.html` (5 varian side-by-side).
    - `docs/brand-guidelines.md` draft 1-page.
    - `bloom-ui/` scaffold: Vite 5 + Svelte 4 + TypeScript, `npm run dev` jalan di 906ms di localhost:5173, splash "Hello Bloom" dengan logo intro + glass status chip.
    - Font Fredoka/Poppins/Nunito/Caveat subset Latin ter-download (`.woff2` total 200KB, under 400KB budget).
    - Git init + first commit + tag `ui-v0.0.0-foundation`.
- **Sedang dikerjakan:** —
- **Keputusan teknis locked:** Svelte 4 + Vite + TypeScript (ADR-001). Base design 1366×768 + rem scaling via `--ui-scale` (ADR-002). Figma + HTML paralel (ADR-003). CEF = Android WebView wrapper (ADR-004). Palet 16 token (plan §1.2). SMIL animasi SVG untuk logo.
- **Masalah terbuka:** 
  - ✅ Font display LOCKED **Fredoka** (ADR-005, approved 2026-10-31).
  - Database schema audit (`database.sql`) belum dilakukan — perlu untuk Fase 1 refactor accounts/characters jadi 3-slot.
  - CEF bridge event mapping (reverse engineer dari `megency-standalone/smali/.../cef/bridge/`) belum didokumentasikan — perlu Fase U5.
  - PC version client belum di-inspect — ditunda.
  - Mascot sticker tunda ke U6.
- **Langkah berikutnya di Claude Code:**
  1. Owner approve logo (Fredoka vs Baloo 2) + palette.
  2. Mulai Fase U1 Design System Core: Tokens Studio Figma + Style Dictionary pipeline + 10 primitives Svelte component (Button, Input, Checkbox, Toggle, Badge, Avatar, Progress, Card, Divider, Icon) + halaman playground.

---

## 12. Memory Log System — Anti-Loop untuk Claude Code 🧠

**Masalah yang dicegah:** Claude Code (atau AI manapun) di sesi berikutnya sering **mengulang kesalahan yang sudah pernah diperbaiki** karena tidak ada "ingatan" eksplisit antar sesi. Contoh real:
- Pakai warna di luar palet, padahal sudah dibilang jangan.
- Pakai `px` absolute di komponen, padahal sudah diputuskan pakai `rem` scaling.
- Install dependency yang di-reject sebelumnya karena bundle size.
- Ulang-ulang tanya "versi Chromium berapa?" padahal sudah dicatat.
- Pakai `#000` murni untuk teks, padahal palet tabu melarangnya.

Sistem di bawah ini **wajib dijalankan Claude Code** sejak sesi pertama.

### 12.1 Tiga file log wajib di `docs/`

**1. `docs/mistakes-log.md`** — kesalahan yang pernah terjadi + pencegahan.

Format setiap entry:
```markdown
## [YYYY-MM-DD] [Fase: UX] [Severity: low/med/high] Judul singkat kesalahan

**Konteks:** Apa yang sedang dikerjakan saat kesalahan muncul.
**Kesalahan:** Deskripsi persis apa yang salah (code snippet, screenshot, error).
**Root cause:** Kenapa itu terjadi.
**Fix:** Perubahan yang dilakukan untuk memperbaiki.
**Rule baru:** Satu kalimat perintah untuk mencegah terulang.
Contoh: "Dilarang pakai `#000000` murni untuk teks; selalu pakai `--bloom-ink-900`."
**Tags:** #css #palette #accessibility
```

**2. `docs/revisions-log.md`** — perubahan arah atau keputusan yang dibatalkan.

Format setiap entry:
```markdown
## [YYYY-MM-DD] [Fase: UX] Keputusan sebelumnya → keputusan baru

**Sebelumnya:** Apa yang diputuskan di plan/dokumen/sesi sebelumnya.
**Sekarang:** Apa yang diputuskan sekarang.
**Alasan:** Kenapa berubah (data baru, kendala teknis, feedback owner).
**Impact:** File/fase/modul mana yang terkena & perlu diupdate.
**Status update dokumen:** Checklist dokumen yang sudah disesuaikan.
```

**3. `docs/decisions-log.md`** — ADR-lite (Architecture Decision Record ringan).

Format setiap entry:
```markdown
## ADR-001 [YYYY-MM-DD] Pakai Svelte 4 + Vite untuk CEF

**Context:** Butuh framework ringan untuk CEF Android low-end.
**Options considered:**
  - Vanilla + Lit-html: zero dep, kompatibel Chromium lama.
  - Vue 3: ekosistem besar, tapi runtime ~34KB.
  - Svelte 4: bundle terkecil, compile-time reactive.
**Decision:** Svelte 4 + Vite.
**Consequences:** Butuh Chromium ≥79; dev experience bagus; build pipeline Vite.
**Status:** Accepted (tentatif, akan dikonfirmasi hasil cek CEF Megency).
```

### 12.2 File `CLAUDE.md` di root — WAJIB dibuat Claude Code di sesi pertama

File ini otomatis dibaca Claude Code tiap sesi baru. Isi minimal:

```markdown
# CLAUDE.md — Instruksi Permanen untuk Claude Code

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
9. [tambah terus]
```

### 12.3 Template perintah owner (shortcut)

- **"catat mistake: [deskripsi]"** → append ke `mistakes-log.md` + extract rule ke CLAUDE.md.
- **"catat revisi: [X berubah ke Y karena Z]"** → append ke `revisions-log.md` + update dokumen terdampak.
- **"catat keputusan: [pilih A karena B]"** → append ke `decisions-log.md` sebagai ADR baru.
- **"review log minggu ini"** → Claude Code baca semua log + buat `weekly-review.md`.

### 12.4 Entry awal yang harus dibuat Claude Code (Fase U0 session 1)

- `docs/mistakes-log.md` dengan template kosong.
- `docs/revisions-log.md` entry pertama: palet master plan v1 → Bloom v2 (16 token).
- `docs/decisions-log.md` dengan 3 ADR awal:
  - ADR-001: Svelte 4 + Vite.
  - ADR-002: Resolusi base 1366×768 + rem scaling.
  - ADR-003: Figma + HTML paralel workflow.
- `CLAUDE.md` dengan RULES AKTIF 1–8 di atas.

---

## 13. Autonomous Goal System 🎯 — Supaya Claude Code bisa Kerja Saat Owner Tinggal

**Masalah yang dicegah:** Claude Code butuh approval tiap langkah → owner nggak bisa tinggal lama. Dengan goal system, owner set goal + batasan, Claude Code kerja autonomous sampai goal tercapai atau hit batasan.

### 13.1 File `docs/current-goal.md` — Goal aktif

Format tunggal (satu goal aktif setiap saat):

```markdown
# Current Goal

**Set at:** 2026-10-31 01:20 WIB
**Owner status:** Away (expected back: 2026-10-31 09:00 WIB)
**Scope fase:** U0 → U1 → U2 (Core Entry Flow)

## Goal utama
Selesaikan Fase U0 Brand Foundation sepenuhnya + mulai Fase U1 Design System Core sampai 50%.

## Definition of Done (DoD) per fase

### U0 Brand Foundation — DoD
- [ ] File `megency-standalone/lib/` sudah di-inspect, versi Chromium CEF tercatat di `decisions-log.md`.
- [ ] Framework decision locked (Svelte 4 atau fallback) dengan ADR.
- [ ] 3 SVG logo primary + stacked + icon-only generated dengan Fredoka.
- [ ] 1 SVG logo pembanding dengan Baloo 2.
- [ ] `palette-preview.html` jalan di browser, semua 16 token + 3 gradient + 4 contoh komponen.
- [ ] `docs/brand-guidelines.md` ditulis (1 halaman).
- [ ] Folder `bloom-ui/` init dengan Vite + Svelte + TypeScript, `npm run dev` jalan dengan "Hello Bloom".
- [ ] Semua font files tersedia di `bloom-ui/src/assets/fonts/` (`.woff2`).
- [ ] Status UI Track §11 di-update.
- [ ] `handoff-note.md` ditulis.

### U1 Design System Core — DoD (50% target di sesi ini)
- [ ] Design tokens Tokens Studio format tersedia di `tokens/bloom.json`.
- [ ] Style Dictionary pipeline jalan: `tokens/bloom.json` → `src/styles/tokens.css`.
- [ ] 10 primitives Svelte component selesai (Button, Input, Checkbox, Toggle, Badge, Avatar, Progress, Card, Divider, Icon).
- [ ] Halaman playground di `/__playground` nunjukin 10 komponen di atas.
- [ ] Dark mode toggle preview jalan (walau dark design belum final).
- [ ] Dokumen `docs/component-catalog.md` cover 10 komponen di atas.

## Batasan (STOP conditions)
Claude Code harus STOP dan tunggu owner kalau:
1. Butuh install dependency di luar: svelte, vite, typescript, @sveltejs/vite-plugin-svelte, svelte-routing, zod/valibot, style-dictionary.
2. CEF Megency ternyata pakai Chromium <79 → butuh keputusan owner Svelte 3 vs vanilla.
3. Ada konflik dengan plan >1 bagian (bukan clarification kecil).
4. Butuh ganti warna palet §1.2.
5. Error destruktif: git reset hard, rm -rf repo, overwrite file plan.
6. Owner approval diperlukan untuk logo pilihan final (Fredoka vs Baloo 2).

## Decisions yang boleh diambil otonom (tanpa tanya owner)
- Pilih nama file, struktur folder dalam limit plan §3.2.
- Format commit message dalam convention yang ada.
- Pilih default value komponen yang masuk akal.
- Pilih easing/duration micro-animation dalam range §1.5.
- Pilih nama variable, helper function, utility.
- Pilih ikon fallback dari MDI kalau belum ada versi custom.
- Pilih urutan task dalam DoD.

## Checkpoint pattern
Setiap 2–3 DoD item selesai → commit git + append progress ke `handoff-note.md`.
Setiap habis 1 fase → tag git `ui-v0.<fase>.0`.
```

### 13.2 File `docs/handoff-note.md` — Log kerja autonomous

Claude Code wajib **append** (bukan overwrite) ke file ini setiap selesai 1 task besar:

```markdown
# Handoff Note

## 2026-10-31 01:35 WIB — U0 Task 1: Inspect CEF
- Inspected `megency-standalone/lib/`
- Found: libcef.so (Chromium 112.0.5615.138)
- Decision: Svelte 4 + Vite CONFIRMED kompatibel.
- ADR-001 ditulis di decisions-log.md.
- Next: generate logo SVG.

## 2026-10-31 01:52 WIB — U0 Task 2: Logo SVG Fredoka
- Generated 3 varian: primary.svg, stacked.svg, icon-only.svg
- Saved to: bloom-ui/src/assets/brand/
- Preview di: logo-preview.html
- Owner approval needed: TBD saat owner balik.
- Next: logo Baloo 2 pembanding.

[dst]
```

### 13.3 Template perintah owner untuk set goal

Owner tinggal paste salah satu dari ini ke Claude Code:

**Set goal pendek (satu sesi):**
```
Goal: selesaikan [spesifik, misal "Fase U0 Brand Foundation sampai DoD §13.1 point 1-6"]
Batasan: ikut §13.1 STOP conditions.
Autonomous: silakan ambil decisions yang tercantum di §13.1 "Decisions yang boleh diambil otonom".
Owner akan review dalam [waktu, misal "8 jam ke depan"].
Update current-goal.md dulu, lalu mulai.
```

**Set goal panjang (multi-fase):**
```
Multi-phase goal: 
- Phase 1: Selesaikan Fase U0 100% (DoD lengkap).
- Phase 2: Fase U1 Design System Core sampai 50% (10 primitives + playground + token pipeline).
- Phase 3: STOP, tunggu owner review.

Rules: 
- Patuhi §13.1 STOP conditions.
- Setiap akhir phase, append progress ke handoff-note.md.
- Setiap phase selesai, tag git + commit.
- Kalau hit STOP condition di tengah phase, stop di sana, tulis blocker di handoff-note.md.

Autonomous level: HIGH. Owner akan balik dalam ~24 jam.
Mulai dengan setup current-goal.md, lalu eksekusi phase 1.
```

### 13.4 Panduan untuk owner — "Tinggal kerja" workflow

**Sebelum tinggal:**
1. Pastikan laptop/PC nyala, Claude Code terbuka, workspace `bloom-community` loaded.
2. Set goal pakai template §13.3 di atas.
3. Konfirmasi Claude Code sudah baca `CLAUDE.md` + plan + log.
4. Awasi 1–2 task pertama untuk pastikan arah benar.
5. Baru tinggal.

**Saat owner balik:**
1. Baca `docs/handoff-note.md` dari atas (progress log).
2. Baca `docs/current-goal.md` untuk status DoD.
3. Review commit git terakhir.
4. Buka UI preview, cek visual.
5. Kalau ada STOP condition yang di-hit → selesaikan blocker, lanjutkan goal.
6. Kalau goal tercapai → set goal baru untuk sesi berikutnya.

### 13.5 Safeguard Claude Code autonomous

Supaya Claude Code tidak "lepas kontrol" saat autonomous:

- **Hard limits:**
  - Max 20 file edit per task sebelum commit.
  - Max 100 line kode per file sebelum review.
  - Jangan install dependency di luar whitelist §13.1.
  - Jangan jalankan `git push` ke remote tanpa owner.
  - Jangan jalankan command destruktif (`rm -rf`, `git reset --hard`, dll).

- **Soft limits (warn before continuing):**
  - Lebih dari 3 jam autonomous tanpa commit → self-review.
  - Lebih dari 2 refactor berturut-turut di file sama → stop, tanya.
  - Lebih dari 5 skip test → stop, run suite.

### 13.6 Mode escalation

Jika Claude Code hit STOP condition saat owner tinggal:
1. **Jangan loop retry.** Catat blocker di `handoff-note.md`.
2. **Pivot ke task lain yang tidak terblok** dari DoD (kalau ada).
3. **Kalau semua task terblok**, write detailed blocker report di `blockers.md` + stop.
4. **Jangan buat keputusan arsitektural besar sendiri**, meskipun kelihatan jelas.

---

*End of document.*
