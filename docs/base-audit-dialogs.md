# Base Audit — `gamemodes/DIALOG.pwn`

**Sumber:** `D:\Bloom\server\gamemodes\DIALOG.pwn` (26 627 baris, ~1MB).
**Peran:** Satu-satunya `public OnDialogResponse` untuk gamemode (file lain pakai modular callback atau tidak punya response handler terpisah).
**Pola:** Rantai `if(dialogid == FOO)` + `switch(dialogid){ case BAR: ... }` untuk ratusan dialog ID yang didefinisikan di enum GM.pwn baris 68–792.

**Jumlah ShowPlayerDialog di seluruh gamemode:** 1263 pemanggilan di 84 file. Dari itu, 757 pemanggilan ada di DIALOG.pwn sendiri (chaining dialog step-by-step). Sisanya dari modul lain (CMD/, JOB/, HOUSE.pwn, dll) yang panggil ShowPlayerDialog lalu di-handle di DIALOG.pwn.

---

## 1. Dialog style yang dipakai

| Style constant | Fungsi | Target CEF |
|---|---|---|
| `DIALOG_STYLE_MSGBOX` | Pesan info/konfirmasi 1 kolom | CEF Toast / Modal |
| `DIALOG_STYLE_INPUT` | Input teks 1 baris | CEF Modal + Input |
| `DIALOG_STYLE_PASSWORD` | Input password | CEF Modal + Password |
| `DIALOG_STYLE_LIST` | List 1 kolom | CEF Modal + List |
| `DIALOG_STYLE_TABLIST` | List multi-kolom tanpa header | CEF Table |
| `DIALOG_STYLE_TABLIST_HEADERS` | List multi-kolom dengan header | CEF Table dengan header |

---

## 2. Mapping grup dialog → CEF screen (prioritas migrasi)

Tabel ini mengelompokkan ID dialog dari enum GM.pwn baris 68–792 ke screen CEF yang akan menggantikan. Satu CEF screen bisa menampung banyak dialog step via tab/wizard/sub-view.

### 2.1 Prioritas U2 — Core Entry Flow

| CEF Screen | Dialog ID legacy | Alur singkat |
|---|---|---|
| **Login** | `UCP_LOGIN`, `UCP_PIN_CODE`, `DIALOG_PASSWORD` | Prompt password → OnDialogResponse → bcrypt check → spawn flow |
| **Register** | `UCP_LOGIN` (branch), `UCP_CREATE_PASSWORD`, `DIALOG_EMAIL` | New account form → password + email + confirm |
| **Character Selection** | `UCP_CHARACTER`, `UCP_SPAWN_CHARACTER` | List slot karakter (base punya 1 karakter per akun — Bloom perlu refactor jadi 3 slot) |
| **Character Creator** | `UCP_CREATE_CHARACTER`, `UCP_CHARACTER_AGE`, `UCP_CHARACTER_GENDER`, `UCP_REGISTER_SPAWN`, `DIALOG_CHANGEAGE` | Multi-step: name → gender → age → origin → skin pick (mSelection) → spawn |

### 2.2 Prioritas U3 — In-Game Essentials

| CEF Screen | Dialog ID legacy | Alur singkat |
|---|---|---|
| **ATM Panel** | `DIALOG_ATMWITHDRAW`, `DIALOG_ATMDEPOSIT`, `DIALOG_ATMREKENING`, `DIALOG_ATMTRANSFER`, `DIALOG_ATMCONFIRM`, `DIALOG_ATMCONFIRM_WD`, `FIND_ATM_PAGE`, `FIND_ATM_SELECT` | ATM 4-tab: Withdraw / Deposit / Transfer / Rekening + confirmation step |
| **Bank Panel** | `DIALOG_BANK`, `DIALOG_BANKDEPOSIT`, `DIALOG_BANKWITHDRAW`, `DIALOG_BANKREKENING`, `DIALOG_BANKTRANSFER`, `DIALOG_BANKCONFIRM`, `DIALOG_MBANKING`, `DIALOG_WITHDRAWCONFIRM`, `DIALOG_TRANSFER_MENU`, `DIALOG_TRANSFER_LOGS` | Bank cabang (versi lengkap ATM) + mobile banking view |
| **Report Panel** | `DIALOG_REPORTS_ACCEPT`, `DIALOG_REPORTS_ACCEPT2`, `DIALOG_REPORTS_DENY`, `DIALOG_REPORTS_DENY2`, `DIALOG_ASKS`, `DIALOG_ASKS2` | Form report (/report) + admin accept/deny flow |
| **Settings** | `DIALOG_STATS`, `DIALOG_SETTINGS`, `DIALOG_HBEMODE`, `DIALOG_MAIN_SETTINGS`, `DIALOG_SET_DISTANCE`, `DIALOG_SET_TICKRATE`, `DIALOG_SET_MAX_OBJECTS`, `DIALOG_PERFORMANCE_*`, `DIALOG_TOGGLE`, `SAMPVOICE_CONFIG*`, `DIALOG_ANTI_FALL` | Settings panel: email, password, HBE mode, performance, voice, anti-fall |
| **Attachment customizer (TOYS)** | `DIALOG_TOY`, `DIALOG_TOYEDIT`, `DIALOG_TOYPOSISI/POSISIBUY/BUY/VIP/RANGE`, `DIALOG_TOYPOS[XYZ]`, `DIALOG_TOYPOSR[XYZ]`, `DIALOG_EDITBONE` | Toys picker + per-bone attach + XYZ/rotation sliders |
| **Vehicle Attachment (VTOY)** | `DIALOG_VTOY`, `DIALOG_VTOYEDIT`, `DIALOG_VTOYEDITMT`, `DIALOG_VTOYMT`, `DIALOG_VTOYSIZE`, `DIALOG_VTOYCOLOR`, `DIALOG_VTOYBOLD`, `DIALOG_VTOYPOS[XYZ]`, `DIALOG_VTOYPOSR[XYZ]`, `DIALOG_VTOYBUY`, `DIALOG_VTOYBUYLIST`, `DIALOG_VTOYRANGE`, `DIALOG_VTOY_BACKCOLOR`, `DIALOG_VTOY_FONT`, `DIALOG_VTOY_ALIGN`, `DIALOG_VTOY_RES`, `DIALOG_VTOY_TEXTURE`, `DIALOG_VTOY_TEXTURE_STR`, `DIALOG_VTOY_RESET_CONFIRM`, `DIALOG_IMPORT_LIST`, `DIALOG_IMPORT_CONFIRM` | Vehicle sticker/text/plate editor dengan font & color |
| **Hotbar / Context menu** | `DIALOG_PLAYER_COMMAND`, `DIALOG_PLAYER_COMMAND2`, `DIALOG_WEAPON_SWITCH`, `DIALOG_TAKE_WEAPON` | Context menu /pm, /examine, weapon switch |
| **Help** | `DIALOG_HELP`, `DIALOG_HELP_CREATE` | Help text listing |
| **GPS** | `DIALOG_GPS`, `DIALOG_GPS_JOB`, `DIALOG_GPS_MORE`, `DIALOG_GPS_PERSONAL`, `DIALOG_GPS_NEAREST`, `GPS_NEAREST_GARKOT`, `GPS_NEAREST_BISNIS`, `GPS_NEAREST_DEALER`, `GPS_NEAREST_WORKSHOP`, `GPS_NEAREST_GSTATION` | Waypoint menu kategori |

### 2.3 Prioritas U4 — Event, Economy & Social

| CEF Screen | Dialog ID legacy | Alur |
|---|---|---|
| **Property Management (House)** | `DIALOG_SELL_HOUSES`, `DIALOG_SELL_HOUSE`, `DIALOG_MY_HOUSES`, `HOUSE_INFO`, `HOUSE_STORAGE`, `HOUSE_WEAPONS`, `HOUSE_MONEY/WITHDRAWMONEY/DEPOSITMONEY`, `HOUSE_COMPONENT/*`, `HOUSE_BURGER/*`, `HOUSE_BANDAGE/*`, `HOUSE_MEDICINE/*`, `HOUSE_FOOD/*`, `HOUSE_SEED/*`, `HOUSE_MILK/*`, `HOUSE_MATERIAL/*`, `HOUSE_CLIPPISTOL/SG/SMG/*`, `HOUSE_MARIJUANA/EPHEDRINE/COCAINE/METH/*`, `HOUSE_SKIN`, `HOUSE_SKIN_SELECT`, `HOUSE_COOKING`, `DIALOG_PAYTAX_HOUSE`, `DIALOG_HOUSE_AGENCY`, `DIALOG_FURNITURE`, `FURNITURE_LIST*`, `FURNITURE_STORAGE*`, `FURNITURE_BUY` | Single property panel dengan tab: Info, Storage, Weapons, Money, Component, dll + sub-dialog deposit/withdraw per item |
| **Property Management (Business/Bisnis)** | `DIALOG_SELL_BISNISS`, `DIALOG_SELL_BISNIS`, `DIALOG_MY_BISNIS`, `BISNIS_MENU`, `BISNIS_INFO`, `BISNIS_NAME`, `BISNIS_VAULT`, `BISNIS_WITHDRAW`, `BISNIS_BUYPROD`, `BISNIS_EDITPROD`, `BISNIS_EDITPROD_NAME`, `BISNIS_PRICESET`, `BISNIS_NAMESET`, `BISNIS_SONG_URL`, `BISNIS_ACTOR`, `BISNIS_PRODUCT`, `BISNIS_PRODUCT_DEPOSIT`, `BISNIS_PRODUCT_WITHDRAW`, `BISNIS_ACTORBUY`, `DIALOG_JUAL_SUSU`, `DIALOG_PAYTAX_BISNIS` | Business owner panel: info, vault, product, actor, name/price, tax |
| **Property Management (Dealer, Workshop, PFarm, Vending)** | `DEALER_*`, `WORKSHOP_*`, `WS_*`, `PFARM_*`, `VENDING_*`, `DIALOG_PAYTAX_*` | Similar panel per property type |
| **Vehicle Management** | `DIALOG_PVEHMENU`, `DIALOG_PVEHMENULIST`, `DIALOG_GOTOVEH`, `DIALOG_GETVEH`, `DIALOG_DELETEVEH`, `DIALOG_BUYPLATE`, `DIALOG_PVEHLOCKED`, `DIALOG_BUYPVCP_*`, `DIALOG_RENT_JOBCARS*`, `DIALOG_SELLMYPV_CONFIRM`, `VEHICLE_*STORAGE/MONEY/COMPONENT/*`, `UNIMPOUNDPV_*`, `DIALOG_PLATE_TIME`, `DIALOG_VCOLOR_TYPE`, `DIALOG_VCOLOR_INPUT`, `DIALOG_TUNING_ENGINE`, `DIALOG_UPGRADE_BRAKE`, `DIALOG_FUEL_UPGRADE`, `VEHICLE_SONG`, `VEHICLE_SONGURL`, `VEHICLE_RADIO_LIST` |
| **Job Panel** | `DIALOG_JOB`, `DIALOG_SERVICE*`, `DIALOG_TRUCKER*`, `DIALOG_HAULING_*`, `DIALOG_PLANT`, `DIALOG_SWEEPER*`, `DIALOG_BUS*`, `DIALOG_LAWN_MOWER*`, `DIALOG_TRASHMASTER*`, `DIALOG_MINER_*`, `MINER_SELL_*`, `DIALOG_SELL_MINER`, `DIALOG_RENTBOAT*`, `DIALOG_RENTBIKES`, `DIALOG_RENTAL_CONFIRM`, `DIALOG_OIL_CLOTHES`, `DIALOG_KOPI_CLOTHES`, `DIALOG_SELL_ANIMAL`, `DIALOG_SELL_MEAT`, `DIALOG_SACF_COOK`, `DIALOG_EAT_DRINK`, `DIALOG_SACF_OFFER` | Panel pekerjaan: start/stop, destination, delivery, uniform, sell catch |
| **Shop UI (Server item)** | `DIALOG_SERVER_ITEM`, `DIALOG_BUY_LUMBER*`, `DIALOG_BUY_APOTEK`, `DIALOG_BUY_BANDAGE`, `DIALOG_BUY_MEDICINE`, `DIALOG_BUY_MEDKIT`, `DIALOG_BUY_FARMER`, `DIALOG_BUY_FOOD`, `DIALOG_BUY_SEED`, `DIALOG_BUY_POTATO`, `DIALOG_BUY_WHEAT`, `DIALOG_BUY_ORANGE`, `DIALOG_BUY_DRUGS`, `DIALOG_BUY_MARIJUANA`, `DIALOG_BUY_COCAINE`, `DIALOG_BUY_METH`, `DIALOG_BUY_EPHEDRINE`, `DIALOG_BUY_MINING`, `DIALOG_BUY_ROCK`, `DIALOG_BUY_IRON`, `DIALOG_BUY_GOLD`, `DIALOG_BUY_COMPONENT`, `DIALOG_BUY_FISH`, `DIALOG_BUY_FUEL`, `DIALOG_BUY_MEAT`, `DIALOG_BUY_OIL`, `DIALOG_BUY_PRODUCT`, `DIALOG_BUY_KOPI`, `DIALOG_GSTATION` | Shop grid dengan kategori + filter |
| **Phone UI** | `DIALOG_PHONE`, `DIALOG_ADDCTRESPONSE`, `DIALOG_ADDCT`, `DIALOG_EDITCTRESPONSE`, `DIALOG_EDITCTMENU`, `DIALOG_EDITNAMECT`, `DIALOG_EDITNUMBERCT`, `DIALOG_SENDMSGCT`, `TWITTER_MENU`, `TWITTER_NAME`, `TWITTER_POST`, `DIALOG_MBANKING`, `DIALOG_TOPUP_ETOLL_CONFIRM` | Phone frame: Contact, Message, Twitter, Mobile banking, E-toll |
| **Faction (SAPD/SAMD/SACF/SAGS/SANEWS)** | `DIALOG_LOCKERSAPD`, `DIALOG_WEAPONSAPD`, `DIALOG_LOCKERSAMD`, `DIALOG_WEAPONSAMD`, `DIALOG_LOCKERSANEW`, `DIALOG_WEAPONSANEW`, `DIALOG_LOCKERMONEY`, `DIALOG_LOCKERWDMONEY`, `DIALOG_LOCKERDPMONEY`, `DIALOG_LOCKERSACF`, `DIALOG_LOCKERSAGS`, `DIALOG_LOCKERWHEAT/*`, `DIALOG_LOCKERORANGE/*`, `DIALOG_LOCKERPOTATO/*`, `DIALOG_LOCKERMEAT/*`, `DIALOG_LOCKERMILK/*`, `DIALOG_LOCKERCOFFEE/*`, `DIALOG_LOCKERFISH/*`, `DIALOG_LOCKERPEMERAH`, `DIALOG_LOCKERVIP`, `DIALOG_LOCKER_LOGS`, `DIALOG_LOCKER_LOGSSAMD`, `DIALOG_FVSTORAGE`, `DIALOG_FV_SAFETY`, `DIALOG_FV_WARBAG`, `SVPOINT_SAPD/SAMD/SANEWS/SPAWNVEH/SACF/SAGS`, `DIALOG_EMERGENCY_LIST`, `DIALOG_TAXI_LIST`, `MDC_*` (MDC panel), `DIALOG_TICKET`, `DIALOG_CLEARTICKET`, `DIALOG_PAYTICKET`, `DIALOG_RAZIA`, `DIALOG_CREATE_GUN`, `DIALOG_BOOKGUN`, `SAPD_SET_UNIT`, `DIALOG_PRISON` | Faction panel: locker, vehicle spawn, MDC, tickets |
| **Event / Daily** | `DIALOG_JOIN_EVENT`, `DIALOG_VOUCHER` (dari modul VOUCHER.pwn) | Event join + voucher claim |
| **Social (Family, Friends, Wedding, Admin rating)** | `DIALOG_FAM_*` (14 ID), `DIALOG_ADMINS*` (6 ID), `WEDDING_FOOD`, `DIALOG_LB_MAIN`, `DIALOG_LB_LIST` | Family manager + Admin rating + Leaderboard + Wedding |
| **Casino (U6)** | `DIALOG_BJ_BET`, `DIALOG_LOTRE_MAIN`, `DIALOG_LOTRE_DETAIL`, `DIALOG_LOTRE_BUY`, `DIALOG_LOTRE_MYTICKETS`, `DIALOG_LOTRE_CONFIRM` | Casino game panels |
| **Admin tools** | `D_AC_*` (8 ID), `ANTI_CHEAT_MENU`, `ANTI_NOP_MENU`, `MECH_TICKET`, `DIALOG_ADMIN_SIGNAL`, `DIALOG_ECO_MAIN`, `DIALOG_ECO_EDIT`, `DIALOG_ECO_INPUT`, `DIALOG_SERVER_UPDATE*`, `DIALOG_DT_MENU`, `DIALOG_DT_HEX`, `NEWS_RADIO_*` (9 ID) | Admin dashboard (U4+ admin side) |
| **Misc gameplay** | `DIALOG_HEALTH`, `DIALOG_STUCK`, `DIALOG_BOOMBOX`, `DIALOG_BOOMBOX_RADIO`, `DIALOG_BOOMBOX_URL`, `DIALOG_BARRICADE`, `DIALOG_JOINPB` (paintball), `DIALOG_REPAIRKIT`, `DIALOG_CCTV`, `DIALOG_CK_*`, `SPRAYTAG_*`, `BLSKIT_*`, `DIALOG_EXAMINE`, `DIALOG_LIVE_STREAMING`, `DIALOG_QUIZ_BR`, `DIALOG_CRATE_*`, `DIALOG_PICKUP_*`, `DIALOG_SELL_OFFER`, `DIALOG_ID_CONFIRM`, `DIALOG_SIM_CONFIRM`, `DIALOG_ECO_MENU`, `DIALOG_MARKET_BUY`, `DIALOG_MARKET_SELL`, `DIALOG_FINDTRASH_LIST`, `DIALOG_WEAPSHOOT`, `DIALOG_SELL_PFARM*`, `DIALOG_MY_PFARM`, `DIALOG_SELL_DEALER*`, `DIALOG_MY_DEALER`, `DIALOG_SELL_VENDING*`, `DIALOG_MY_VENDING`, `VENDING_SETPRICE`, `VENDING_MONEY`, `VENDING_WITHDRAWMONEY`, `GARKOT_PICKUP`, `DIALOG_SALARY`, `DIALOG_PAYCHECK` | Grouped under lingkup gameplay — mapping ke CEF Phase U4+ |

---

## 3. Observasi penting

1. **Modular dispatch rapi:** `OnDialogResponse` adalah file sendiri (DIALOG.pwn) tapi tiap grup if/switch cukup panjang. Setelah migrasi ke CEF, file ini bisa diciutkan drastis.
2. **Dialog step-by-step** sangat umum: setelah user pilih di dialog A, panggil ShowPlayerDialog dialog B. Di CEF ini jadi state machine di satu screen (wizard atau tab).
3. **Confirm dialog** banyak (semua yang namanya `*_CONFIRM`, `*_CONFIRM_WD`, dll). Di CEF ini jadi modal konfirmasi standar yang bisa di-reuse.
4. **Input validasi hampir selalu di server** (contoh password length, name charset, dll). Pattern ini **harus dipertahankan** di bridge CEF — client CEF cuma kirim event, server validasi.
5. **Satu dialog ID dipakai multi-konteks** (`DIALOG_UNUSED` dipakai sebagai popup info sementara). Di CEF ini jadi toast/popup generic.
6. **mSelection (skin picker)** dipakai di OnPlayerModelSelection, bukan OnDialogResponse. CEF Attachment customizer & character creator perlu reimplement grid dengan preview 3D (keluar dari DIALOG.pwn).
7. **Chat RP /me /do /ooc** ada di `OnPlayerText` di GM.pwn baris 2450, bukan di DIALOG.pwn. CEF chat screen hanya bungkus layer visual + input relay.

---

## 4. Strategi migrasi (ringkas, decision point)

**Opsi A (Big-bang):** Semua dialog diganti CEF sekaligus → risiko tinggi, timeline sulit.
**Opsi B (Fase bertahap sesuai U2–U4 plan):** Dialog yang masuk fase berjalan paralel. Dialog belum di-migrate tetap pakai legacy. Perlu bridge "dialog proxy" supaya pemain nggak lihat 2 UI mencampur (atau toggle per screen).
**Rekomendasi:** Opsi B. Mulai dari UCP_LOGIN/REGISTER/CHARACTER di U2. Dialog lain tetap SAMP legacy sampai fase masing-masing.

**Keputusan arsitektur yang perlu owner confirm (bukan sekarang):**
1. Bridge CEF event mapping: 1 event per dialog ID, atau 1 event generic `ui:dialog:response` dengan payload `{dialogId, response, listitem, inputtext}`?
2. Legacy dialog boleh hidup berdampingan dengan CEF di fase transisi, atau hard cut per modul?
3. Multi-step wizard di CEF → 1 screen stateful atau multi-screen navigasi?
