# Base Audit — Summary & Mapping ke CEF

**Sumber:** gabungan dari `base-audit-gm.md`, `base-audit-dialogs.md`, `base-audit-textdraws.md`, `base-audit-plugins.md`.
**Tanggal audit:** 2026-10-31.
**Audit level:** Overview + mapping, bukan line-by-line enumeration (base terlalu besar: 8.7K line GM.pwn, 26.6K line DIALOG.pwn, 4.1K line TEXTDRAW.pwn, 84 file gamemode).

---

## 1. Identitas base yang sebenarnya

**Nama asal:** Reactive Roleplay Server (developer: Traymon).
**Jenis:** Server RP Indonesia **lengkap**, bukan basic. Scope setara server RP komersial medium-size.
**Platform run:** open.mp + plugin `samp-compat` (sudah di-port, bukan masih SA-MP).

**Jumlah fitur yang sudah ada:**
- ~450+ dialog ID
- ~300+ textdraw unik
- 778 command `CMD:` di 104 file (!)
- Modul mencakup: UCP, bank, ATM, bisnis, house, workshop, dealer, private vehicle, private farm, 20+ pekerjaan, 5 faction (SAPD, SAMD, SACF, SAGS, SANEWS), family (geng), auction, hunting, mining, fishing, kopi, oil, meth, admin tools, anti-cheat, MDC, phone, boombox, music radio, vending machine, furniture, wedding, casino (BJ, slot, lotre), paintball, racing, shooting range, event, voucher, salary, pajak, leaderboard, barricade, CCTV, spraytag, dll.

**Implikasi untuk Bloom:**
- Scope Bloom MVP (lihat master plan §14.3) **jauh lebih kecil** dari fitur base. Banyak modul harus di-"hibernate" di fase awal: casino, family, racing, auction, wedding, battle royale, dll → tunda ke Fase U6+/post-MVP.
- Core yang perlu dipertahankan di MVP: UCP+karakter, bank/ATM, inventory, chat RP, HUD, phone (sebagian), event bertanggal.

---

## 2. Mapping master: Dialog + Textdraw legacy → CEF screen Bloom

| CEF Screen (Fase) | Dialog ID legacy | Textdraw legacy | Base files sumber |
|---|---|---|---|
| **Splash + Logo intro (U2)** | — | `RRPLogoTD`, `LOGOSAMBABEE`, `LOGOMASSAMBABEE`, loading bg di CreateTextDraw() | GM.pwn init, TEXTDRAW.pwn |
| **Login (U2)** | `UCP_LOGIN`, `UCP_PIN_CODE`, `DIALOG_PASSWORD` | Login bg textdraw (dari CreateTextDraw global) | DIALOG.pwn, GM.pwn OnPlayerConnect |
| **Register (U2)** | `UCP_LOGIN` branch, `UCP_CREATE_PASSWORD`, `DIALOG_EMAIL` | — | DIALOG.pwn |
| **Character Selection (U2)** | `UCP_CHARACTER`, `UCP_SPAWN_CHARACTER` | Char select bg textdraw | DIALOG.pwn, GM.pwn OnPlayerRequestClass |
| **Character Creator (U2)** | `UCP_CREATE_CHARACTER`, `UCP_CHARACTER_AGE`, `UCP_CHARACTER_GENDER`, `UCP_REGISTER_SPAWN`, `DIALOG_CHANGEAGE` | mSelection skin picker | DIALOG.pwn, GM.pwn OnPlayerModelSelection |
| **Loading In-Game (U2)** | — | `LoadingBAR_RRP[*][10]`, progress2 bars | TEXTDRAW.pwn |
| **HUD overlay (U3)** | — | `InfoTD`, `TextTime/Date`, `DP*`, `TDEditor_TD` HBE, `HbeFinalTD`, Hunger/Thirst/PeeBarTD, `IdplayerTD`, `MoneyplayerTD`, `V*TD` speedo, `GreenZone_TD`, `PanelPlayer[*][28]` | TEXTDRAW.pwn, GM.pwn OnPlayerUpdate |
| **Chat UI (U3)** | — (chat RP ada di OnPlayerText, bukan dialog) | — | GM.pwn OnPlayerText line 2450 |
| **Phone UI (U3+U4)** | `DIALOG_PHONE`, `DIALOG_ADDCTRESPONSE`, `DIALOG_ADDCT`, `DIALOG_EDITCT*`, `DIALOG_SENDMSGCT`, `TWITTER_*`, `DIALOG_MBANKING`, `DIALOG_TOPUP_ETOLL_CONFIRM` | — | DIALOG.pwn, PHONEBOOK.pwn, TWITTER section |
| **ATM Panel (U3)** | `DIALOG_ATM*`, `FIND_ATM_*` | `ATM_Player[*][62]` | DIALOG.pwn, ATM.pwn, TEXTDRAW.pwn |
| **ID Card popup (U3)** | — | `IDCARD_Player[*][49]` | TEXTDRAW.pwn |
| **Inventory + Clothing (U3)** | *(parsial)* `HOUSE_SKIN`, `HOUSE_SKIN_SELECT` + modul MORE/INVENTORY.pwn, MORE/INVENSAMBABEE.pwn | — | HOUSE.pwn, MORE/INVENTORY.pwn |
| **Attachment customizer / Toys (U3)** | `DIALOG_TOY*`, `DIALOG_EDITBONE` | — | TOYS.pwn, DIALOG.pwn |
| **Helmet (U3)** | *(dari HELMET.pwn)* | — | HELMET.pwn |
| **Weapon attachment (U3)** | *(dari WEAPON_ATTH.pwn, 3 ShowPlayerDialog)* | — | WEAPON_ATTH.pwn |
| **Settings (U3)** | `DIALOG_SETTINGS`, `DIALOG_HBEMODE`, `DIALOG_MAIN_SETTINGS`, `DIALOG_SET_DISTANCE/TICKRATE/MAX_OBJECTS`, `DIALOG_PERFORMANCE_*`, `DIALOG_TOGGLE`, `SAMPVOICE_CONFIG*`, `DIALOG_ANTI_FALL` | — | DIALOG.pwn, MORE/STREAM_DISTANCE.pwn, MORE/SAMPVOICE.pwn |
| **Notification toast (U3)** | — (base pakai SendClientMessage) | `InfoTD`, `FishingAreaTD` | FUNCTION.pwn (ClientMessage helpers) |
| **Report (U3)** | `DIALOG_REPORTS_*`, `DIALOG_ASKS*` | — | REPORT.pwn, ASK.pwn |
| **Property management House (U4)** | `DIALOG_SELL_HOUSES`, `DIALOG_MY_HOUSES`, `HOUSE_*` (50+ ID), `DIALOG_PAYTAX_HOUSE`, `DIALOG_HOUSE_AGENCY`, `DIALOG_FURNITURE`, `FURNITURE_*` | — | HOUSE.pwn, MORE/FURNITURE.pwn |
| **Property management Business (U4)** | `DIALOG_SELL_BISNIS*`, `BISNIS_*`, `DIALOG_MY_BISNIS`, `DIALOG_PAYTAX_BISNIS` | — | BISNIS.pwn |
| **Property management Dealer/Workshop/PFarm/Vending (U4)** | `DEALER_*`, `WORKSHOP_*`, `WS_*`, `PFARM_*`, `VENDING_*`, `DIALOG_PAYTAX_*` | — | MORE/DEALER.pwn, MORE/WORKSHOP.pwn, MORE/PRIVATE_FARM.pwn, MORE/VENDING_MACHINE.pwn |
| **Vehicle management (U4)** | `DIALOG_PVEHMENU/MENULIST`, `DIALOG_BUYPVCP_*`, `DIALOG_RENT_JOBCARS*`, `VEHICLE_*STORAGE`, `UNIMPOUNDPV_*`, `DIALOG_PLATE_TIME`, `DIALOG_VCOLOR_*`, `DIALOG_TUNING_*`, `DIALOG_UPGRADE_*`, `DIALOG_FUEL_UPGRADE`, `VEHICLE_SONG/URL/RADIO_LIST`, `DIALOG_VTOY*` | `ModTD[29]`, speedometer TDs | PRIVATE_VEHICLE.pwn, MORE/VEHICLE_TOYS.pwn |
| **Job panel (U4)** | `DIALOG_JOB`, `DIALOG_SERVICE*`, `DIALOG_TRUCKER*`, `DIALOG_HAULING_*`, `DIALOG_PLANT`, `DIALOG_SWEEPER*`, `DIALOG_BUS*`, `DIALOG_LAWN_MOWER*`, `DIALOG_TRASHMASTER*`, `DIALOG_MINER_*`, `DIALOG_RENT*`, `DIALOG_OIL_CLOTHES`, `DIALOG_KOPI_CLOTHES`, `DIALOG_SELL_*`, `DIALOG_SACF_*`, `DIALOG_EAT_DRINK` | Fishing area, Cook meth, Shooting range | JOB/*.pwn, MORE/SHOOTING_RANGE.pwn |
| **Shop UI (U4)** | `DIALOG_SERVER_ITEM`, `DIALOG_BUY_*` (25 ID), `DIALOG_GSTATION` | — | DIALOG.pwn, GAS_STATION.pwn, SERVER.pwn |
| **Bank cabang (U4)** | `DIALOG_BANK*`, `DIALOG_TRANSFER_*` | — | DIALOG.pwn |
| **Faction panel SAPD/SAMD/SACF/SAGS/SANEWS (U4)** | 60+ ID locker/weapon/money/food, `SVPOINT_*`, `MDC_*`, `DIALOG_TICKET`, `DIALOG_PAYTICKET`, `DIALOG_RAZIA`, `DIALOG_CREATE_GUN`, `DIALOG_BOOKGUN`, `DIALOG_FVSTORAGE`, `DIALOG_FV_*`, `DIALOG_PRISON`, `DIALOG_EMERGENCY_LIST`, `DIALOG_TAXI_LIST`, `DIALOG_CLEARTICKET`, `SAPD_SET_UNIT`, `SPECTATOR` (admin) | `CctvTD[6]`, Spectator_TD | CMD/FACTION.pwn, MDC.pwn, SAPD_*, DYNAMIC_LOCKER.pwn |
| **Event + Daily (U4)** | `DIALOG_JOIN_EVENT`, voucher dialogs | — | EVENT.pwn, VOUCHER.pwn |
| **Family / Social (U4)** | `DIALOG_FAM_*` (14 ID), `DIALOG_ADMINS*` (6 ID — admin rating), `WEDDING_FOOD`, `DIALOG_LB_*` leaderboard | — | MORE/FAMILY.pwn, MORE/ADMIN_RATING.pwn, MORE/WEDDING.pwn, MORE/LEADERBOARD.pwn |
| **Casino (U6)** | `DIALOG_BJ_BET`, `DIALOG_LOTRE_*` + modul SLOT.pwn | — | CASINO/BLACK_JACK.pwn, CASINO/LOTRE.pwn, CASINO/SLOT.pwn |
| **Admin tools (U4 side-track)** | `D_AC_*` (8 ID), `ANTI_*_MENU`, `MECH_TICKET`, `DIALOG_ADMIN_SIGNAL`, `DIALOG_ECO_*`, `DIALOG_SERVER_UPDATE*`, `DIALOG_DT_*`, `NEWS_RADIO_*` | — | CMD/ADMIN.pwn, ANTI_CHEAT/*.pwn, MORE/ADMIN_RATING.pwn, MORE/MUSIC_RADIO.pwn |

---

## 3. Fitur base yang tidak dibutuhkan di Bloom MVP

Berdasarkan master plan §14.3 (MVP = akun+karakter, UI Bloom lengkap, char creator, item mod via dashboard, event bertanggal, ekonomi dasar, chat RP, admin dasar):

**Tunda ke post-MVP (fase U6+ atau tidak di-port):**
- Family (geng) system
- Casino (Blackjack, Lotre, Slot)
- Wedding
- Quiz BR / Battle Royale
- Auction
- Shooting range mini-game
- Billiard
- Paintball
- Racing CP
- Hunting
- News radio broadcasting
- MDC (SAPD computer) — bisa di Fase U4 SAPD panel sekaligus
- CCTV
- Spraytag
- Boombox
- Camper van
- Content creator (live streaming)
- Faction call / Taxi call (gabung ke Phone)

**Tetap pertahankan tapi UI minimal di MVP:**
- Phone (hanya SMS + mobile banking + contact — Twitter tunda)
- Phonebook
- GPS kategori
- ID Card

**Hapus / tidak di-port:**
- Logo RRP (RRPLogoTD, LOGOSAMBABEE, LOGOMASSAMBABEE) — ganti BloomLogo
- Dialog test / `DIALOG_UNUSED` sebagai popup → ganti CEF toast generic
- Duplikat file (ACTOR.pwn vs ACTOR(1).pwn, JOB_MINER_BACKUP.pwn)

---

## 4. Fitur Bloom yang BELUM ada di base

Perlu dibangun baru (bukan sekadar re-skin dialog):
1. **3-slot karakter per akun** — base cuma 1 karakter per account. Skema MySQL harus di-refactor (table `accounts` + `characters` dengan FK `account_id`).
2. **Character creator CEF visual** — base pakai mSelection skin picker, bukan full creator dengan slider wajah/warna kulit. Perlu research skin model GTA SA customization limits.
3. **Dashboard admin web** (Node.js) untuk upload item mod — base belum ada. Fase U7 di plan UI.
4. **Event bertanggal dengan daily reward** — base punya `EVENT.pwn` sederhana + `VOUCHER.pwn`, tapi perlu sistem terjadwal dengan kalender + `event_rewards`/`event_claims` tables.
5. **Bloom brand identity** (palette, font, logo, animasi) — belum ada.
6. **Clothing customization lengkap** (baju, celana, sepatu, aksesori detail) — base punya skin + toys attachment, tapi belum level deep customization di Bloom plan.
7. **CEF client bridge** — base referensi CEF belum ada (kemungkinan Megency standalone yang disebut di plan). Perlu dokumentasi spec (U5 plan).

---

## 5. Risiko audit yang belum dieksplorasi

1. **DIALOG.pwn 1MB belum full-read.** Yang di-audit: enum (dari GM.pwn), style dialog yang dipakai, pola dispatch, ShowPlayerDialog count. Belum: tiap body dialog response logic (apa yang terjadi setelah user pilih). Perlu per-screen deep-dive saat masuk fase U2+.
2. **CreateTextDraw() global (TEXTDRAW.pwn baris 2775+)** belum dibaca — kemungkinan berisi textdraw login screen, char select bg, admin HUD, dll yang penting untuk Fase U2 implementation.
3. **E_PLAYERS enum full tail** (dari ~line 1000 ke end) belum dibaca — kemungkinan ada field tambahan vehicle, inventory, dll.
4. **CMD/PLAYER.pwn, CMD/ADMIN.pwn, CMD/FACTION.pwn** (daftar panjang command) — belum di-audit per-command, hanya count. Perlu waktu dedicated.
5. **Modul `MORE/UCP.pwn`** — mungkin ada UCP web interface skeleton, perlu baca.
6. **`database.sql` di root `D:\Bloom\`** — belum dibaca, perlu audit skema terpisah.
7. **`megency-standalone/`** di root — ini client CEF yang disebut di plan UI. Belum di-inspect. Fase U0 Brand Foundation inti nanti akan masuk ke sini (lihat ADR-001 pending CEF check).

---

## 6. Rekomendasi untuk sesi berikutnya

1. **U0 Brand Foundation inti** (sesi lain): generate logo SVG, palette preview HTML, inspect `megency-standalone/lib/` untuk CEF version → confirm ADR-001.
2. **Audit lanjut (sesi dedicated kalau butuh):**
   - `base-audit-database.md` dari `database.sql`.
   - `base-audit-commands.md` dari CMD/ folder.
   - `base-audit-cef-client.md` dari `megency-standalone/`.
3. **Fase 1 planning** (setelah U0 Brand): rencana refactor skema account→characters (3-slot) + modular reorganization gamemode ke `bloom-gamemode/`.
4. **Fase U2 CEF implementation** butuh:
   - Baca `DIALOG.pwn` section login (`dialogid == UCP_LOGIN`, `UCP_CHARACTER`, `UCP_CREATE_PASSWORD`, dll) line-by-line.
   - Baca `CreateTextDraw()` section login/char-select.
   - Mapping ke bridge event `auth:login`, `auth:register`, `character:list`, `character:select`, `character:create`.

---

## 7. Verdict akhir untuk owner

Base ini jauh lebih siap dari yang disebutkan di prompt ("mentahan basic roleplay"). Kenyataannya: **gamemode lengkap production-level** dengan ratusan fitur. Strategi migrasi UI ke CEF Bloom:

- **Dialog + Textdraw total yang perlu di-port ke CEF Bloom MVP:** ~120 dialog ID + ~15 textdraw group (dari ~450 dialog + ~30 textdraw group yang ada). Sisanya tetap legacy sampai fase masing-masing / di-hibernate.
- **Fitur gameplay yang IKUT (tidak diubah):** chat RP, anti-cheat, bcrypt, bank/ATM backend, inventory data model, vehicle model, job/faction backend, event/voucher backend, phone backend, HUD data model.
- **Yang hanya ganti tampilan ke CEF:** dialog login/char-select/char-creator (U2), HUD/ATM/report/settings/attachment (U3), property/job/shop/phone/faction panel (U4), casino (U6).
- **Yang ditulis baru total:** 3-slot karakter per akun, dashboard admin web, event scheduler + daily reward UI, Bloom brand identity, clothing deep customization.

Estimasi effort migrasi UI (sudah ada di plan §6):
- U0 1 minggu
- U1 2–3 minggu
- U2 3–4 minggu
- U3 4–5 minggu
- U4 2–3 minggu
- U5 CEF integration 2–4 minggu
- U6 polish 2–3 minggu
- **MVP U0–U5 total: ~3.5–5 bulan solo.**

Base ini memperkuat timeline tersebut — tidak perlu nulis gamemode dari nol, cuma re-skin + 3-slot refactor + dashboard web.
