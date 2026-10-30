# Starter Prompt + Panduan Lengkap untuk Claude Code — Bloom Community

*Dokumen ini punya 3 bagian:*
1. **Panduan Setup Claude Code** (sekali di awal)
2. **Starter Prompt Sesi Pertama** (paste ke sesi pertama Claude Code)
3. **Template Goal Setting** (paste tiap kali mau tinggal Claude Code kerja autonomous)

---

## BAGIAN 1 — Panduan Setup Claude Code (sekali di awal)

### 1.1 Buat workspace baru

Di Claude Code desktop:
1. Klik tombol **"+ New"** di sidebar kiri atas.
2. Pilih **"This computer"** sebagai environment.
3. Pointing ke folder: `D:\Bloom`.
4. Beri nama workspace: **`bloom-community`** (bukan ikut yang "megency-ai-power" supaya nggak campur).
5. Model: **Opus 4.7** · Thinking: **High** · Mode: **Auto**.

### 1.2 Verifikasi file plan sudah ada di workspace

Pastikan 3 file ini sudah ada di `D:\Bloom\`:
- `Bloom Community – Master Plan Server Roleplay open.mp.md`
- `Bloom Community – UI CEF Plan.md` (v1.2)
- `Bloom Community – Claude Code Starter Prompt.md` (file ini)

### 1.3 Siapkan asset sumber (opsional, kalau sudah ada)

Kalau mau efisien, extract `vvv.zip` ke subfolder `gamemode-raw/` sebelum mulai (Claude Code akan butuh di Fase 1 nanti, bukan sekarang).

### 1.4 Install tool bantu

- **Node.js LTS** (minimal v18) — untuk Vite + Svelte.
- **Git** — untuk versioning.
- **VS Code** (opsional) — untuk inspect manual.
- **apktool** (sudah ada hasilnya di `megency-standalone/`).

---

## BAGIAN 2 — Starter Prompt Sesi Pertama Claude Code

*Copy semua isi di dalam code block di bawah, paste sebagai pesan pertama di sesi pertama Claude Code.*

```
Halo Claude, saya mau lanjut mengerjakan server SA-MP/open.mp roleplay bernama "Bloom Community". Semua context dan plan sudah tertulis lengkap di folder ini (D:\Bloom\).

=== KONTEKS KUNCI: Base gamemode SUDAH ADA di D:\Bloom\server\ ===

Folder server/ adalah mentahan gamemode SAMP klasik Indonesia-style yang lengkap. File penting:
- gamemodes/GM.pwn (308KB) — main entry
- gamemodes/DIALOG.pwn (1MB!) — semua dialog login/register/char-select/ATM/report/dll
- gamemodes/TEXTDRAW.pwn (234KB) — semua HUD + textdraw UI
- gamemodes/BISNIS.pwn (89KB), HOUSE.pwn (62KB), PRIVATE_VEHICLE.pwn (126KB)
- gamemodes/JOB/ (folder) — pekerjaan
- gamemodes/CASINO/ (folder) — casino games
- gamemodes/CMD/ (folder) — command handlers
- gamemodes/ATM.pwn, GAS_STATION.pwn, ANIMS.pwn, TOYS.pwn, HELMET.pwn, WEAPON_ATTH.pwn, REPORT.pwn, SAPD_SPIKE.pwn, GATE.pwn, VOUCHER.pwn, EVENT.pwn, SALARY.pwn, BANNED.pwn, DOOR.pwn, DYNAMIC_LOCKER.pwn, etc.

MISI UTAMA UI CEF (mulai Fase U2): Convert semua DIALOG + TEXTDRAW di base gamemode itu jadi UI CEF Bloom. Fitur gameplay IKUT yang sudah ada di base — jangan buat fitur baru dulu — HANYA tampilan yang di-ganti ke CEF dengan style Bloom pastel.

Mapping prioritas convert dialog/textdraw → CEF screen:
- DIALOG login/register di DIALOG.pwn → CEF Login/Register screen (Fase U2)
- DIALOG character selection → CEF Character Selection (Fase U2)
- DIALOG character creation → CEF Character Creator (Fase U2)
- TEXTDRAW HUD (HP/money/dll) → CEF HUD overlay (Fase U3)
- DIALOG ATM → CEF ATM panel (Fase U3)
- DIALOG BISNIS/HOUSE → CEF Property management (Fase U4+)
- DIALOG JOB → CEF Job panel (Fase U4+)
- TEXTDRAW anim picker (ANIMS.pwn) → CEF Anim panel
- DIALOG TOYS/HELMET/WEAPON_ATTH → CEF Attachment customizer
- DIALOG REPORT → CEF Report panel
- DIALOG CASINO → CEF Casino games UI (Fase U6+)
- DIALOG VOUCHER / SALARY / BANNED → UI panel terkait

=== FILE WAJIB BACA DI AWAL (urut) ===

1. "Bloom Community – Master Plan Server Roleplay open.mp.md" — master plan utama (gameplay, backend, Pawn, database, roadmap umum Fase 0–9). Bagian 14 override bagian 1–13 jika konflik.

2. "Bloom Community – UI CEF Plan.md" versi 1.3 — plan khusus UI/CEF yang sudah approved. Fokus khusus:
   - Bagian 0: Keputusan dari Survey (LOCKED, tidak boleh di-override).
   - Bagian 1: Brand Identity (logo, palette, tipografi, ikonografi, motion, sound).
   - Bagian 1.1.1: Animated Logo Spec (5 varian: intro, loading, idle, celebrate, tirai) — WAJIB implement di Fase U0.
   - Bagian 2: Design System v2.
   - Bagian 3: Arsitektur CEF (Svelte 4 + Vite rekomendasi).
   - Bagian 5: Roadmap 8 fase U0–U7.
   - Bagian 11: Status UI Track.
   - Bagian 12: Memory Log System (WAJIB).
   - Bagian 13: Autonomous Goal System (WAJIB).

=== TUGAS SESI PERTAMA INI (Fase U0 Setup Phase) ===

Jangan loncat ke task lain sebelum semua ini kelar:

TUGAS A — Setup Memory Log System (dari plan §12.4):
1. Buat file `D:\Bloom\CLAUDE.md` dengan konten dari plan §12.2 (RULES AKTIF 1–8 locked).
2. Buat folder `D:\Bloom\docs\`.
3. Buat `docs/mistakes-log.md` dengan 1 entry template kosong.
4. Buat `docs/revisions-log.md` dengan entry pertama: "Palet master plan v1 → Bloom palette v2 (16 token)" dari UI Plan §1.2.
5. Buat `docs/decisions-log.md` dengan 3 ADR awal:
   - ADR-001: Framework Svelte 4 + Vite (status: tentatif, pending CEF check)
   - ADR-002: Resolusi base 1366×768 + rem scaling
   - ADR-003: Workflow Figma + HTML paralel
6. Buat `docs/current-goal.md` dengan template dari plan §13.1 (isi "Set at" dengan timestamp sekarang, scope: U0 Setup).
7. Buat `docs/handoff-note.md` kosong, akan di-append terus.

TUGAS A.1 — Audit base gamemode D:\Bloom\server\ (INVENTORY ONLY, bukan migrasi):
1. Baca `gamemodes/GM.pwn` — identifikasi include, callback utama, struktur global. Catat di `docs/base-audit-gm.md`.
2. Baca `gamemodes/DIALOG.pwn` — list SEMUA dialog ID + fungsi + alur singkat. Tabel di `docs/base-audit-dialogs.md`.
3. Baca `gamemodes/TEXTDRAW.pwn` — list SEMUA textdraw + fungsi. Tabel di `docs/base-audit-textdraws.md`.
4. Scan `include/` dan `plugins/` — list plugin + status kompatibilitas open.mp. `docs/base-audit-plugins.md`.
5. Ringkasan `docs/base-audit-summary.md`: fitur dasar + mapping rekomendasi ke CEF screen (sesuai mapping di konteks awal).

A.1 BUKAN migrasi — cuma inventory supaya Fase U2 nanti tahu persis apa yang di-convert ke CEF.

TUGAS B — Konfirmasi pemahaman:
Setelah tugas A dan A.1 selesai, rangkum dalam 10 bullet:
- 2 bullet soal brand identity (palette, logo direction)
- 2 bullet soal design system (resolusi target, framework)
- 2 bullet soal roadmap (fase yang sedang & berikutnya)
- 2 bullet soal memory log system (apa yang dicatat & kapan)
- 2 bullet soal goal system (STOP conditions, decisions otonom)

Lalu tunggu konfirmasi saya.

=== ATURAN KERJA PERMANEN (dari CLAUDE.md yang baru dibuat) ===

- Jangan menulis ulang semuanya sekaligus. Satu task selesai, update log, lanjut.
- Sebelum mengubah file, baca dulu. Jangan menebak.
- Semua warna wajib dari palet UI Plan §1.2 — dilarang di luar token.
- Dilarang #000 dan #FFF murni untuk teks.
- Dilarang px absolute, pakai rem + --ui-scale.
- Dilarang install dependency tanpa justifikasi + alternatif.
- Server authoritative — client CEF hanya kirim request.
- Payload JSON berversi: {v: 1, data: {...}}.
- Font & aset wajib lokal.
- Setelah tiap task, update "Status UI Track" di plan file + mistakes/revisions log kalau ada.
- Setelah tiap sesi, tulis handoff-note.md.
- Pemilik paham Pawn dan web — jelaskan keputusan desain saja, bukan sintaks dasar.

=== KONTEKS TAMBAHAN ===

- Target pemain 100–200, bahasa Indonesia, publik, PG-rated.
- Platform prioritas: Android landscape 2400×1080 + PC 1366×768.
- Visual: Anime/Kawaii Lifestyle (Zepeto × Love Nikki).
- Ink text: #4A3B5C (bukan hitam).
- Timezone saya Asia/Singapore (UTC+8).
- Model saya pakai: Opus 4.7, mode Auto, thinking High.
- Workspace path: D:\Bloom\

Mulai dengan TUGAS A sekarang. Setelah selesai, konfirmasi lalu tunggu saya kasih goal setting untuk eksekusi Fase U0 inti.
```

---

## BAGIAN 3 — Template Goal Setting (paste tiap kali mau tinggal Claude Code)

### 3.1 Template: Goal Pendek (1 sesi, ~2–4 jam)

Pakai ini kalau kamu di dekat laptop tapi mau fokus pekerjaan lain.

```
Goal pendek: [tulis spesifik, contoh di bawah]

Scope: U0 Task 1–4 (Inspect CEF + Logo static + Logo animated + Palette Preview)

Definition of Done:
- [ ] Inspect megency-standalone/lib/ → catat versi Chromium di decisions-log.md
- [ ] Update ADR-001 di decisions-log.md: lock framework (Svelte 4 atau fallback)
- [ ] Generate 3 SVG logo static Fredoka (primary + stacked + icon-only) di D:\Bloom\bloom-ui\src\assets\brand\
- [ ] Generate 1 SVG logo Baloo 2 untuk perbandingan
- [ ] Generate 5 SVG logo ANIMATED (dari UI Plan §1.1.1):
      - logo-bloom-intro.svg (1800ms, splash)
      - logo-bloom-loading.svg (2400ms infinite)
      - logo-bloom-idle.svg (4000ms infinite, subtle corner)
      - logo-bloom-celebrate.svg (1200ms, reward burst)
      - logo-bloom-tirai.svg (1500ms, curtain transition)
      Pakai pure SVG + SMIL/CSS keyframes. Total file size <80KB gzipped.
- [ ] Buat preview HTML yang nampilin 5 varian animated side-by-side di D:\Bloom\logo-animated-preview.html
- [ ] Generate palette-preview.html mandiri di D:\Bloom\ (16 token + 3 gradient + 4 komponen contoh)
- [ ] Append progress ke handoff-note.md tiap task selesai

STOP conditions (dari plan §13.1):
- CEF ternyata Chromium <79 → stop, catat blocker
- Butuh install dependency di luar whitelist → stop, tanya
- Butuh ganti warna palet → stop, tanya

Autonomous: HIGH. Pakai decisions otonom di plan §13.1 secara bebas.
Owner akan balik dalam ~3 jam.

Mulai dengan baca CLAUDE.md, current-goal.md, lalu update current-goal.md dengan goal ini, lalu eksekusi.
```

### 3.2 Template: Goal Panjang (multi-fase, ~8–24 jam autonomous)

Pakai ini kalau mau tinggal tidur / kerja seharian.

```
Multi-phase goal: Fase U0 100% + Fase U1 sampai 50%

=== PHASE 1: Fase U0 Brand Foundation (target: selesai 100%) ===

DoD (dari plan §13.1):
- [ ] Inspect CEF Megency, versi Chromium tercatat
- [ ] Framework decision locked dengan ADR
- [ ] Audit base gamemode D:\Bloom\server\ (5 file audit di docs/)
- [ ] 3 SVG logo static Fredoka + 1 Baloo 2
- [ ] 5 SVG logo ANIMATED (intro, loading, idle, celebrate, tirai) sesuai UI Plan §1.1.1
- [ ] logo-animated-preview.html jalan di browser (5 varian side-by-side)
- [ ] palette-preview.html jalan di browser
- [ ] docs/brand-guidelines.md ditulis (1 halaman)
- [ ] Folder bloom-ui/ init: Vite + Svelte + TypeScript, npm run dev jalan dengan "Hello Bloom"
- [ ] Font .woff2 tersedia di bloom-ui/src/assets/fonts/
- [ ] Status UI Track §11 di-update
- [ ] handoff-note.md updated
- [ ] Git commit + tag "ui-v0.0.0-foundation"

=== PHASE 2: Fase U1 Design System Core (target: 50%) ===

DoD partial:
- [ ] Design tokens Tokens Studio format di tokens/bloom.json
- [ ] Style Dictionary pipeline: tokens → src/styles/tokens.css
- [ ] 10 primitives Svelte component: Button, Input, Checkbox, Toggle, Badge, Avatar, Progress, Card, Divider, Icon
- [ ] Halaman playground di /__playground
- [ ] docs/component-catalog.md untuk 10 komponen tersebut
- [ ] Git commit + tag "ui-v0.1.0-primitives"

=== PHASE 3: STOP, tunggu owner review ===

Jangan loncat ke screen (Fase U2). Review visual dulu dengan owner.

=== RULES AUTONOMOUS ===

- Patuhi STOP conditions di plan §13.1.
- Checkpoint tiap 2–3 DoD item: commit + append handoff-note.md.
- Hit STOP → pivot ke task lain yang nggak terblok. Semua terblok → stop, tulis blockers.md.
- Jangan install dependency di luar whitelist (lihat plan §13.1 STOP condition #1).
- Jangan buat keputusan arsitektural besar sendiri.
- Max 20 file edit per task sebelum commit.
- Max 3 jam autonomous tanpa commit → self-review dulu.

Autonomous level: HIGH. Owner balik dalam ~24 jam.
Mulai dengan baca CLAUDE.md + plan + log, update current-goal.md dengan goal ini, lalu eksekusi Phase 1 Task 1.
```

### 3.3 Template: Goal untuk Review & Fix Only (kalau Claude Code sempat bablas)

```
Goal: Review + fix (tanpa fitur baru).

Scope:
- Baca handoff-note.md dari sesi sebelumnya.
- Baca mistakes-log.md untuk rules yang mungkin dilanggar sesi lalu.
- Audit visual: buka palette-preview.html, logo-preview, playground.
- Audit code: cek tiap komponen dari CLAUDE.md RULES AKTIF (warna, rem, dependency).
- Buat laporan `docs/audit-session-X.md` dengan temuan.

DoD:
- [ ] Semua pelanggaran rules dicatat di mistakes-log.md
- [ ] Semua fix diterapkan + commit
- [ ] Status UI Track §11 updated

STOP: jangan tambah fitur baru. Audit + fix saja.
Owner balik dalam ~2 jam.
```

---

## BAGIAN 4 — Goal Default per Fase (kalau owner nggak set spesifik)

Kalau owner cuma bilang "lanjutkan ke Fase U1" tanpa goal detail, Claude Code pakai default ini.

### Default Goal — Fase U0 Brand Foundation
Target: DoD lengkap di plan §13.1. Durasi estimasi: 1 minggu. STOP tiap akhir hari untuk owner review visual.

### Default Goal — Fase U1 Design System Core
Target:
1. Design tokens → CSS pipeline jalan.
2. Semua primitives (~15 komponen) selesai dengan state default/hover/disabled.
3. Semua containers (~6 komponen).
4. Halaman playground final + screenshot.
5. Dokumen `component-catalog.md` lengkap.

Estimasi: 2–3 minggu. STOP mingguan untuk visual review.

### Default Goal — Fase U2 Core Entry Flow
Target per screen:
1. Splash Screen (dengan tirai panggung animasi) → owner review.
2. Login/Register → owner review.
3. Character Selection → owner review.
4. Character Creator → owner review.
5. Loading In-Game → owner review.

Setiap screen = checkpoint untuk owner review. Estimasi: 3–4 minggu total.

### Default Goal — Fase U3 In-Game Essentials
Target per screen:
1. HUD Overlay → stress test di browser mock dengan 60fps minimum.
2. Chat UI → semua channel + mock message flow.
3. Inventory + Clothing → drag-drop + preview real-time.
4. Phone UI → shell + 3 app jalan (Messages, Bank, Settings).
5. Notification system → 5 tipe toast + sound.

Estimasi: 4–5 minggu. Owner review per screen.

### Default Goal — Fase U4 Event & Economy
Target: alur Valentine event end-to-end di mock bridge (trigger tanggal → popup → claim → item masuk inventory). Lalu replicate untuk Shop + Bank + Daily Login.

### Default Goal — Fase U5 CEF Integration & Bridge
Target: UI yang di-browser jalan di CEF Megency real. End-to-end test login dari client Android ke MySQL.

### Default Goal — Fase U6 Polish
Target: semua sound + Lottie + haptic + reduced-motion toggle + accessibility ter-apply.

### Default Goal — Fase U7 Admin Dashboard
Target: dashboard Node.js untuk CRUD item custom + event + paintjob.

---

## BAGIAN 5 — Quick Reference untuk Owner

### Buka Claude Code → tinggal:

1. **Set goal** → paste template §3.1 / §3.2 / §3.3.
2. **Verifikasi Claude Code baca** CLAUDE.md + plan + log (konfirmasi pertama).
3. **Awasi 1–2 task awal** untuk pastikan arah benar.
4. **Tinggal.**

### Owner balik → review:

1. Baca `docs/handoff-note.md` dari atas.
2. Buka `D:\Bloom\palette-preview.html` di browser untuk cek visual.
3. Buka `D:\Bloom\bloom-ui\` → `npm run dev` → cek `localhost:5173`.
4. `git log --oneline -20` untuk cek commit.
5. Set goal berikutnya atau tutup sesi.

### Shortcut owner-to-Claude-Code:

| Ucapan owner | Yang dilakukan Claude Code |
|---|---|
| "catat mistake: X" | Append `mistakes-log.md` + extract rule ke CLAUDE.md |
| "catat revisi: X → Y karena Z" | Append `revisions-log.md` + update dokumen |
| "catat keputusan: pilih A karena B" | Append `decisions-log.md` sebagai ADR |
| "review log minggu ini" | Baca semua log, tulis `weekly-review.md` |
| "status sekarang?" | Rangkum `current-goal.md` + progress + blocker |
| "lanjut phase berikutnya" | Baca plan §5, update current-goal.md, mulai |
| "stop sekarang" | Commit WIP, update handoff-note.md, konfirmasi stop |

---

*Semoga lancar pengerjaannya. Bunga Bloom-nya pasti mekar. 🌸*
