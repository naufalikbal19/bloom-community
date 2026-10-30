# bloom-ui

CEF UI untuk server Bloom Community (open.mp). Svelte 4 + Vite + TypeScript. Design system "Bloom v2" pastel kawaii.

## Setup

```bash
npm install
npm run dev
```

Buka http://localhost:5173 untuk preview.

## Struktur folder (sesuai UI CEF Plan §3.2)

```
bloom-ui/
├── index.html
├── vite.config.ts
├── svelte.config.js
├── tsconfig.json
├── package.json
├── src/
│   ├── main.ts                 ← bootstrap, hitung --ui-scale
│   ├── App.svelte              ← splash sementara
│   ├── vite-env.d.ts
│   ├── lib/
│   │   ├── bridge/             ← CEF ↔ Pawn (TBD Fase U5)
│   │   └── stores/             ← Svelte stores (TBD Fase U2+)
│   ├── styles/
│   │   ├── tokens.css          ← design tokens v2
│   │   ├── fonts.css           ← @font-face dari local .woff2
│   │   └── global.css          ← reset + base
│   └── assets/
│       ├── brand/              ← logo static + animated
│       │   ├── logo-primary.svg
│       │   ├── logo-stacked.svg
│       │   ├── logo-icon.svg
│       │   ├── logo-primary-baloo.svg
│       │   └── animated/
│       │       ├── logo-bloom-intro.svg
│       │       ├── logo-bloom-loading.svg
│       │       ├── logo-bloom-idle.svg
│       │       ├── logo-bloom-celebrate.svg
│       │       └── logo-bloom-tirai.svg
│       └── fonts/              ← Fredoka, Poppins, Nunito, Caveat (.woff2 subset Latin)
└── public/
```

## Rules

Baca `../CLAUDE.md` dan `../Bloom Community – UI CEF Plan.md` sebelum nulis komponen. Rules penting:
- Dilarang `px` absolute → pakai `rem` + `--ui-scale`.
- Dilarang warna di luar palet §1.2 → pakai CSS vars dari tokens.css.
- Dilarang `#000`/`#FFF` murni untuk teks → pakai `--bloom-ink-*`.
- Dilarang install dependency di luar whitelist tanpa justifikasi.

## Fase saat ini

**U0 Brand Foundation** — scaffold ini. Komponen dan screen dibangun di Fase U1+.
