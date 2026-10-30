# Base Audit — `gamemodes/GM.pwn`

**Sumber:** `D:\Bloom\server\gamemodes\GM.pwn` (8732 baris, 308KB).
**Judul asli:** Reactive Roleplay Server — Developed by Traymon.
**Status:** Gamemode SA-MP Pawn Indonesia-style, basis roleplay kompleks (bukan basic!).

---

## 1. Include stack (urutan dari GM.pwn baris 12–63)

### 1.1 Standard & external library
| Include | Peran | Status open.mp |
|---|---|---|
| `a_samp` | Core SA-MP (dengan `#define MAX_PLAYERS 100`) | ✅ ada drop-in `a_samp` di open.mp |
| `profiler` | Profiling plugin | ✅ dukungan plugin profiler |
| `a_mysql` | MySQL plugin include | ✅ versi R41-4+ kompatibel open.mp |
| `anti_spoof` | Anti name/skin spoof (strict mode on, log console on) | ⚠️ pure Pawn, cek compile saja |
| `a_http` | HTTP client bawaan SA-MP | ✅ ada di open.mp |
| `streamer` | Incognito's streamer | ✅ open.mp kompatibel |
| `EVF` | Entity Vehicle Fix / event framework (perlu konfirmasi) | ⚠️ cek sumber |
| `samp_bcrypt` | Password hashing (bcrypt) | ✅ open.mp kompatibel |
| `garageblock` | Garage block system | ⚠️ include lokal, perlu cek |
| `strlib` | String helpers | ✅ pure Pawn |
| `YSI_Coding\y_timers` | YSI timers | ✅ open.mp OK (YSI 5+) |
| `YSI_Coding\y_va` | YSI varargs | ✅ |
| `Pawn.CMD` | Command processor (bukan ZCMD/YCMD) | ✅ plugin pawncmd |
| `sscanf2` | Argument parser | ✅ |
| `geolite` | GeoIP lookup | ⚠️ perlu DB file |
| `progress2` | Progress bar textdraw | ✅ |
| `mSelection` | Model selection (skin picker) | ✅ |
| `textdraw-streamer` | Textdraw streamer | ✅ plugin tersedia |
| `mapandreas` | Height map lookup | ✅ plugin tersedia |
| `Pawn.Regex` | Regex library | ✅ plugin tersedia |
| `sampvoice` | Voice chat plugin (SV_USE…) | ⚠️ cek open.mp support — plugin masih SAMP-first |
| `nex-ac` | Nex-AC anticheat | ✅ pure Pawn, config file di scriptfiles |

### 1.2 Modular include (file lokal di `gamemodes/`)
Baris 65 di GM.pwn: `#include "DEFINE.pwn"`. Dari struktur folder, pola `#include "FILE.pwn"` muncul untuk banyak modul (COLOR, FUNCTION, SERVER, NATIVE, TASK, DIALOG, TEXTDRAW, TEXTDRAWCLICK, ATM, ANIMS, ASK, AUDIO, BANNED, BISNIS, DOOR, DYNAMIC_LOCKER, EVENT, GAS_STATION, GATE, HELMET, HOUSE, PRIVATE_VEHICLE, REPORT, SALARY, SAPD_SPIKE, TOYS, VOUCHER, WEAPON_ATTH) + folder `JOB/`, `CASINO/`, `CMD/`, `ANTI_CHEAT/`, `MORE/` yang masing-masing berisi banyak sub-file. **GM.pwn adalah hub include**, bukan file berisi semua logika.

### 1.3 Plugin runtime (dari `server.cfg`)
```
plugins crashdetect samp-compat mysql streamer sscanf pawnregex pawncmd
        samp_bcrypt bscrashfix mapandreas textdraw-streamer gvar requests
        profiler nativechecker
```
Catatan: `samp-compat` muncul di plugin list — berarti server **sudah pakai open.mp** tapi dengan samp-compat layer. **Konfirmasi penting:** base ini sudah di-port ke open.mp, atau masih SA-MP + plan migrasi? Dari plugin stack: open.mp.

---

## 2. Callback public utama (ditemukan di GM.pwn via grep `^\s*public`)

| Line | Callback | Peran untuk Bloom |
|---|---|---|
| 1825 | `OnGameModeInit()` | Setup global state, load MySQL, buat textdraw global, actor, event |
| 2265 | `OnGameModeExit()` | Teardown |
| 2322 | `OnPlayerEnterVehicle` | HUD vehicle update |
| 2450 | `OnPlayerText` | Chat RP /me /do /ooc dispatch |
| 2739 | `OnPlayerCommandPerformed` | Logging & feedback |
| 2750 | `OnPlayerCommandReceived` | Pre-command check (jail, duty, etc) |
| 2786 | `OnPlayerConnect` | Hubungan ke login flow → DIALOG login UCP |
| 3023 | `OnPlayerDisconnect` | Save data, log |
| 3207 | `OnPlayerSpawn` | Post-spawn setup, HUD show |
| 3507 | `OnPlayerModelSelection` | mSelection skin picker response |
| 4464 | `OnPlayerRequestClass` | Dialihkan ke login flow |
| 4480 | `OnPlayerDeath` | Death handler + hospital system |
| 4611 | `OnPlayerEditAttachedObject` | TOYS / HELMET / WEAPON_ATTH editor |
| 4652 | `OnClickDynamicPlayerTextDraw` | Textdraw click dispatcher (HUD, ATM, panel) |
| 4851 | `OnClickDynamicTextDraw` | Global textdraw click (login screen, menu) |
| 5251 | `OnPlayerEditDynamicObject` | Furniture / mapping editor |
| 5686 | `OnPlayerStreamIn` | Nametag/attach sync |
| 5701 | `OnPlayerPickUpDynamicPickup` | Pickup handlers |
| 5725 | `OnPlayerEnterDynamicCP` | Checkpoint handler (job, delivery) |
| 5784 / 5926 | `OnPlayerEnter/LeaveDynamicArea` | Zone-based logic (greenzone, business zone) |
| 5979 | `OnPlayerEnterRaceCheckpoint` | Race & delivery route |
| 6075 | `OnPlayerClickMap` | GPS click → waypoint |
| 6123 | `OnPlayerEnterCheckpoint` | Static checkpoint |
| 6908 | `OnPlayerKeyStateChange` | Hotkey (phone, inventory, etc) — **penting**: ini jadi trigger utama buka UI CEF nanti |
| 7482 | `OnPlayerStateChange` | Driver/passenger/on-foot transitions |
| 7898 | `OnPlayerWeaponShot` | Hit validation |
| 7979 / 8114 | `OnPlayerGive/TakeDamage` | HP system |
| 8185 | `OnPlayerUpdate` | Per-tick update (HUD, anti-cheat) |
| 8378 | `OnVehicleDamageStatusUpdate` | Vehicle damage HUD |
| 8457 / 8507 / 8537 | `OnVehicleSpawn/Death/Destroyed` | Vehicle lifecycle |

**Catatan untuk CEF migration:**
- Dialog response ditangani di `DIALOG.pwn` (OnDialogResponse). Semua yang di-migrasi ke CEF perlu bridge call menggantikan ShowPlayerDialog / jalur OnDialogResponse.
- Textdraw click → OnClickDynamicPlayerTextDraw / OnClickDynamicTextDraw. Begitu HUD/panel pindah ke CEF, callback ini sepi; sisanya tetap handle non-UI legacy jika ada.

---

## 3. Enum E_PLAYERS — struktur data karakter (parsial)

Enum `E_PLAYERS` mulai di sekitar baris 893. Field yang menonjol dari window pembacaan baris 893–1000:
- Identitas: pORM, pID, pName, pAdminname, pTwittername, pIP, pPassword, pEmail
- Hak akses: pAdmin, pHelper, pLevel, pLevelUp, pVip, pVipTime, pGold, pRegDate, pLastLogin
- Ekonomi: pMoney, pBankMoney, pBankRek, pPhone, pPhoneCredit, pPhoneBook, pSMS, pCall, pCallTime, pWT (wallet?), pEtoll
- Playtime: pHours, pMinutes, pSeconds, pPaycheck
- Appearance: pSkin, pFacSkin, pGender, pAge
- Posisi: pInDoor, pInHouse, pInBiz, pInws (workshop), pTransferWS, pMenuType, pPosX/Y/Z/A, pInt, pWorld
- Kesehatan: pHealth, pArmour, pHunger, pBladder, pEnergy + Time counter untuk masing-masing
- Status medis: pSick, pSickTime, pHospital, pHospitalTime, pInjured
- Pekerjaan: pOnDuty, pOnDutyTime, pFaction, pFactionRank, pFactionLead, pBroadcast, pNewsGuest, pFamily, pFamilyRank
- Hukum: pJail, pJailTime, pArrest, pArrestTime, pWarn
- Job state: pJob, pJob2, pExitJob
- Inventaris: pMedicine, pMedkit, pMask, pHelmet, pFindEms, pGas, pOil, pBandage, pGPS, pMaterial, pComponent, pFood, pSeed, pWheat, pOrange, pPotato, pMeat, pMilk

Catatan: ini **1 akun = 1 karakter aktif** (bukan sistem 3-slot karakter per account). Bloom MVP butuh 3-slot karakter per account → **perlu refactor skema account vs character di Fase 1**.

Dialog login terpisah (`UCP_LOGIN`, `UCP_CHARACTER`, `UCP_CREATE_CHARACTER`, `UCP_SPAWN_CHARACTER`) menunjukkan ada UCP system — tapi perlu verifikasi struktur table (lihat `database.sql`).

---

## 4. Enum dialog ID (GM.pwn baris 68–792)

**Jumlah:** ~450+ dialog ID (satu enum tunggal, tanpa namespace). Dikelompokkan dengan komentar `//---[ … ]---` sebagai grup:

| Grup komentar | Jumlah estimasi | Fungsi | Fase CEF |
|---|---|---|---|
| UCP (login, register, karakter) | 9 | Login/Register/Pin/Create password/Create character/Age/Gender | **U2** |
| DIALOG utility (PASSWORD, EMAIL, STATS, SETTINGS, HBEMODE, DMV) | 6 | Settings & help | U4 |
| GOLDSHOP / VIP | 4 | VIP shop (ganti nama, beli vehicle/skin pakai gold) | U4 |
| GIVE / AMOUNT | 2 | Transaksi antar pemain | U3 |
| DIALOG BISNIS | 17 | Business ownership, vault, product, actor, name/price | U4 |
| DIALOG HOUSE | 50+ | House ownership, storage per item (burger, bandage, medicine, food, seed, milk, material, clip, drugs, meth, skin, cooking) | U4 |
| VEHICLE STORAGE | 30+ | Private vehicle storage per item | U4 |
| DIALOG PRIVATE VEHICLE | 11 | Pvehmenu, buy, delete, plate, locked, categories | U4 |
| DIALOG TOYS | 13 | Toys/accessories editor | **U3 (Attachment customizer)** |
| DIALOG PLAYER (help, GPS, job) | 10 | Help, GPS kategori | U4 |
| DIALOG WEAPONS | 1 | Edit bone | U3 attach |
| DIALOG FACTION locker | 20+ | SAPD/SAMD/SANEW/SACF/SAGS locker (weapon, money, food item) | U4 |
| DIALOG JOB MECH | 15 | Service, color, paintjob, wheels, spoiler, hoods, vents, lights, exhausts, bumpers, roofs, side skirts, bullbars, neon | U4 |
| Trucker / Hauling / Plant | 7 | Job delivery UI | U4 |
| Bank / ATM | 10 | Deposit/withdraw/transfer/rekening/konfirmasi | **U3 (ATM panel)** |
| Reports / Asks | 4 | Report system | **U3 (Report panel)** |
| Sidejob (sweeper, bus, lawnmower, trash) | 8 | Job area selection | U4 |
| Health / Phone / Stuck | 3 | Health kit, phone, stuck anti-fall | U3 |
| Workshop | 16 | Owner workshop management | U4 |
| Rental | 4 | Boat/bike rental | U4 |
| Dealer | 10 | Vehicle dealership | U4 |
| Private Farm | 15 | PFarm plant, seed, harvest | U4 |
| Paytax | 7 | Property tax categories | U4 |
| Contact / Phonebook | 7 | Phone contacts CRUD | U4 (Phone app) |
| Garkot | 1 | Garage lot | U4 |
| Tilang / Ticket | 2 | SAPD ticket | U4 |
| Admin Signal | 1 | Admin signaling | — admin |
| Boombox | 3 | Boombox radio URL | U4 |
| MDC | 15+ | Mobile Data Computer (lookup player/vehicle/dealer/bisnis/house) | U4 (SAPD panel) |
| MyTax | 4 | Tax ownership listing | U4 |
| Twitter | 3 | Twitter in-game | U4 (Phone app) |
| SV Point (SAPD/SAMD/SANEWS/SACF/SAGS spawn) | 6 | Faction vehicle spawn | U4 |
| Emergency / Taxi list | 2 | Call list | U4 |
| Vehicle Toys (VTOY) | ~24 | Vehicle attachments editor (edit, size, color, pos, texture, font, align, res) | U3 |
| Spraytag | 5 | Spray tag editor | U4 |
| Barricade / Paintball / Repairkit / CCTV / CK (confirm kill) | 7 | Various actions | U4 |
| Vending machine | 8 | Vending ownership | U4 |
| Vehicle song/radio | 4 | In-car music URL | U4 |
| Gas station | 1 | Refuel | U4 |
| Furniture | 8 | House furniture | U4 |
| Impound | 2 | Impound release | U4 |
| Join event | 1 | Event join | **U4 (Event panel)** |
| Examine | 1 | Examine player (/examine) | U3 |
| Anti-cheat admin | 2 | AC admin dialog | admin |
| Mech ticket | 1 | Admin ticket | admin |
| SAPD unit | 1 | SAPD unit set | U4 |
| News radio | 9 | News broadcast | U4 |
| Locker logs | 2 | SAPD/SAMD locker audit | admin |
| BLS kit | 4 | BLS medic kit menu (inspect, surgery, revive) | U4 |
| Prison | 1 | Prison dialog | U4 |
| Wedding food | 1 | Wedding event | U4 |
| Player command / weapon switch | 3 | Player context menu, hotbar swap | **U3 (HUD)** |
| Live streaming / content creator | 1 | Streaming toggle | U4 |
| Create gun / bookgun | 2 | SAPD evidence gun | U4 |
| Quiz BR | 1 | Battle royale quiz | U6 (opsional) |
| Razia / Paytiket | 2 | SAPD razia & ticket | U4 |
| Sell animal / meat | 2 | Butcher sell | U4 |
| Plate time / Oil clothes / Kopi clothes | 3 | Side job uniform | U4 |
| Admin rating | 6 | Admin rating system | admin |
| Miner | 6 | Mining job (sell rock/iron/gold, smelting) | U4 |
| Stream distance / performance | 7 | Settings performance | **U3 (Settings)** |
| FV storage / safety / warbag | 3 | Faction vehicle storage | U4 |
| Vehicle color | 2 | Color type/input | U4 |
| House agency | 1 | Housing agency | U4 |
| Mbanking | 1 | Mobile banking | **U4 (Phone bank app)** |
| Topup e-toll | 1 | Toll top-up | U4 |
| ATM confirm/transfer/withdraw/logs | 5 | Lanjutan ATM | U3 |
| Weapshoot | 1 | Weapon shoot setting | U4 |
| D_AC_* (anti-cheat) | 8 | AC toggle/whitelist/player/live data | admin |
| Leaderboard | 2 | Leaderboard | **U4 (Social)** |
| DT (debug trainer) | 2 | Debug | admin |
| Take weapon | 1 | SAPD take weapon | U4 |
| Blackjack bet | 1 | Casino | **U6 (Casino)** |
| Crates | 7 | Crate storage system | U4 |
| Pickup list | 2 | Pickup drops | U4 |
| Help create | 1 | Help | U4 |
| Sell offer / ID confirm / SIM confirm / Eco menu | 4 | Economy & sell | U4 |
| Market buy/sell | 2 | Market system | U4 |
| Find trash | 1 | Trash find | U4 |
| Eco main/edit/input | 3 | Economy admin | admin |
| Sampvoice config | 3 | Voice chat settings | **U3 (Settings)** |
| Lotre | 5 | Lottery | **U6 (Casino)** |
| Locker pemerah | 1 | Milk locker | U4 |
| Family | 14 | Family (geng) system | U4 |
| Anti-fall | 1 | Anti-fall toggle | U3 |
| Tuning engine / Brake upgrade / Fuel upgrade | 3 | Vehicle tuning | U4 |
| Server item buy (lumber, material, apotek, bandage, medicine, medkit, farmer, food, seed, potato, wheat, orange, drugs, mining, rock, iron, gold, component, fish, fuel, meat, oil, product, kopi) | 25 | Shop server item | **U4 (Shop)** |
| Server update | 3 | Admin item | admin |
| SACF cook / Eat drink / SACF offer | 3 | SACF faction job | U4 |

**Total unik:** ~450+ (`enum` tunggal besar). Beberapa dipakai 2 kali untuk konteks berbeda (contoh `DIALOG_UNUSED` sebagai popup info sementara).

---

## 5. Observasi awal untuk CEF migration

1. **Dialog style flavor dipakai:** DIALOG_STYLE_LIST, DIALOG_STYLE_INPUT, DIALOG_STYLE_TABLIST, DIALOG_STYLE_TABLIST_HEADERS. MSGBOX & PASSWORD mungkin ada juga. Perlu cek semua di DIALOG.pwn jika mau migrate universal.
2. **Textdraw click dispatch** (`OnClickDynamicPlayerTextDraw` di line 4652, 199 line body) adalah hub HUD interaksi — ATM, panel player, hotbar, phone trigger lewat sini.
3. **Chat RP** di `OnPlayerText` (line 2450, 289 line) sudah include /me /do /ooc parsing — modul chat CEF tinggal bungkus event.
4. **Model selection** (mSelection) dipakai untuk skin picker, toys, furniture — di CEF perlu replace dengan grid custom + preview. Lihat line 3507 (`OnPlayerModelSelection`).
5. **Password hashing**: pakai bcrypt via `samp_bcrypt`. Secure. Bloom bisa pertahankan atau upgrade argon2 kalau mau.
6. **Anti-cheat**: nex-ac (bagus) + `anti_spoof` (strict) + modul `ANTI_CHEAT/*.pwn` custom. CEF harus hati-hati nggak trigger false positive.

---

## 6. Flag open.mp compat

Dari header `samp-compat` di `server.cfg`: base ini sudah di-boot via **open.mp dengan samp-compat layer**. Artinya:
- `samp03svr` binary mungkin masih ada untuk SA-MP fallback, tapi production jalan di open.mp.
- Fitur baru open.mp (per-player timers, nicer streamer, etc) **belum dipakai** — karena masih pola SA-MP klasik.
- Migrasi ke "open.mp native" (lepas samp-compat) perlu audit lanjutan untuk per-callback.
- Plugin `sampvoice` ⚠️ open.mp support — perlu konfirmasi, bisa jadi bottleneck.

---

## 7. Verdict untuk Bloom

- **Pakai ulang:** Core account/MySQL framework, bcrypt, chat RP /me /do /ooc, HUD data model (hunger/thirst/pee), vehicle system, inventory stock variables, nex-ac config.
- **Refactor besar:** Account vs character schema (1 account = 3 slot). Dialog system (dihapus seluruhnya, diganti CEF). Textdraw HUD (dihapus, diganti CEF overlay).
- **Tulis ulang:** Login flow (dialog → CEF). Character creator (mSelection → CEF grid). Semua dialog shop/business/house/vehicle UI.
- **Tahan dulu:** Casino, Family, Wedding, Content creator — ini "later phase" di roadmap Bloom MVP.
- **Buang/konsolidasi:** Duplikat seperti `ACTOR.pwn` vs `ACTOR(1).pwn`, `JOB_MINER_BACKUP.pwn` (backup file).
