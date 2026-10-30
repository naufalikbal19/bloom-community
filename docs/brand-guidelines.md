# Bloom Community — Brand Guidelines (v0.1)

**Fase:** U0 Brand Foundation · **Tanggal:** 2026-10-31 · **Status:** Draft siap review owner.

Dokumen ringkas 1-halaman untuk konsistensi visual di seluruh asset Bloom (CEF UI, dashboard web, launcher, aset komunitas). Rinci teknis ada di `Bloom Community – UI CEF Plan.md` §1.

---

## 1. Esensi

**Mood:** Anime / Kawaii Lifestyle. Panduan rasa: **"HP cewek yang punya diary magical, bukan dashboard admin."**
Referensi gabungan: **Zepeto × LINE Play** (bulat, friendly, sticker-heavy) + **Love Nikki / Shining Nikki** (feminine glossy, kostum detail, UI pink mewah).

**Tagline:** *"Where every story blooms."* (EN) / *"Tempat setiap cerita bermekaran."* (ID).

**Tabu:** flat Material biasa, dark cyberpunk/goth, warna gelap pekat, sudut tajam, teks `#000`/`#FFF` murni.

## 2. Logo

Wordmark **"bloom"** lowercase + ikon bunga cherry blossom 5-kelopak menggantikan huruf **o** pertama. 5 varian wajib: Primary (horizontal), Stacked (vertical), Icon only (bulat frame), Monochrome, Dark mode.

Varian animasi in-game (SVG + SMIL): `logo-bloom-intro` (splash 1800ms), `logo-bloom-loading` (loop 2400ms), `logo-bloom-idle` (watermark 4000ms), `logo-bloom-celebrate` (reward 1200ms), `logo-bloom-tirai` (curtain 1500ms).

**Font display:** **Fredoka 600/700** (locked oleh owner 2026-10-31, ADR-005). Logo monochrome pakai `--bloom-ink-900`.

## 3. Palette (16 token)

Lengkap di UI Plan §1.2. Ringkas:
- **Primary pink:** 300 `#FFD9E8`, 500 `#FFB7D5`, 700 `#FF8FBC`.
- **Aksen:** rose `#F48FB1`, lavender `#C8A8E9`, sky `#A8D8F0`, mint `#A8E6CF`, butter `#FFE8A8`, peach `#FFCBA4`, coral `#FFA2A2`.
- **Netral:** cream 50 `#FFF9F5`, cream 100 `#FFF0E8`.
- **Ink teks:** 500 `#9B8DB0` (disabled), 700 `#6B5B7E` (sekunder), 900 `#4A3B5C` (utama — bukan hitam!).
- **Premium:** gold `#F0C27B`, glass `rgba(255,255,255,0.65)`.

**Gradient:**
- `--grad-bloom` 135° pink-500 → lavender-500 (hero, splash).
- `--grad-dream` 180° pink-300 → cream-50 60% (card hadiah, popup).
- `--grad-glass` 135° white 50% → white 20% (glassmorphism).

**Shadow selalu dari warna brand** (pink/lavender) opacity rendah, bukan hitam. Contoh: `box-shadow: 0 8px 24px rgba(255,143,188,0.25)`.

## 4. Tipografi

| Role | Font | Weight | Ukuran dasar |
|---|---|---|---|
| Display (hero, splash) — **LOCKED** | Fredoka | 600, 700 | 32–64px |
| Heading (judul panel) | Poppins | 600 | 20–28px |
| Body (teks umum, dialog) | Poppins | 400, 500 | 14–16px |
| UI label (button, badge) | Poppins | 500, 600 | 12–14px |
| Numeric (uang, HP, speedo) | Nunito tabular-nums | 600, 700 | 14–40px |
| Decorative (quote, banner) | Caveat | 400 | 20–32px |

Semua font self-hosted di `bloom-ui/src/assets/fonts/`, subset Latin, `.woff2`, total target <400KB.

## 5. Ikonografi

- **Primary set:** custom sticker rounded 2-tone (outline + fill soft), stroke 2px, radius sudut 2px, base 24×24.
- **Fallback:** Material Design Icons webfont.
- **Emoji sticker:** 20–30 ekspresi (happy, sad, excited, love, confused), SVG 48×48, versi Lottie opsional.

**Naming:** `icon-{category}-{name}-{style}.svg` — contoh `icon-ui-close-sticker.svg`, `icon-emoji-happy-animated.json`.

## 6. Motion

- Durasi: fast 200ms, medium 320ms, slow 500ms.
- Easing: `cubic-bezier(0.34, 1.56, 0.64, 1)` (bouncy-out, masuk), `cubic-bezier(0.4, 0, 0.2, 1)` (smooth, keluar).
- Success: sparkle burst 400ms + scale 0.95→1.05→1.
- Error: shake horizontal 300ms + warna coral flash.
- Hover (PC only): scale 1.02 + shadow intensify.
- Press: scale 0.96, 100ms.
- **Reduced-motion toggle wajib ada di settings** (Android low-end + accessibility).

## 7. Spacing & Grid

- Base unit 4px. Spacing kelipatan 4.
- Grid HUD: 12 kolom PC, 8 kolom Android landscape.
- Safe area padding 24px dari edge (lebih besar di Android karena notch).
- Z-index: 0 base, 10 sticky, 20 dropdown, 30 sticky header, 40 drawer, 50 modal, 60 toast, 70 tooltip, 100 debug.

## 8. Resolusi target

Design base **1366×768**, scale otomatis ke 2400×1080 via `rem` + CSS var `--ui-scale = min(innerWidth/1366, innerHeight/768)`. **Dilarang `px` absolute** (ADR-002, RULE AKTIF #3).

## 9. Sound (ringan)

Semua ≤30KB `.ogg`, mono 22kHz: `sfx-click`, `sfx-success`, `sfx-error`, `sfx-notification`, `sfx-coin`, `bgm-login` (30s loop lo-fi pastel, mute default).

## 10. Prinsip ringkas

1. **Pastel + glossy, bukan flat.** Semua card radius ≥24px, button pill 999px, ikon rounded.
2. **Teks selalu dari token ink.** `#000` murni haram, teks paling gelap `--bloom-ink-900`.
3. **Shadow pakai warna brand.** Hitam shadow jadi "mati".
4. **Satu sparkle, bukan lima.** Hiasan sparing. Over-decorate = kehilangan readability.
5. **Reduced-motion toggle siap pakai.** Animasi mewah default aktif, user yang sensitif bisa matikan.
6. **Konsistensi di dua resolusi.** Testing di 1366×768 dan 2400×1080 dari Fase U1, bukan ditunda.

---

*File ini akan di-update tiap ada perubahan brand decision via `docs/revisions-log.md`.*
