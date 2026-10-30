# Base Audit — `gamemodes/TEXTDRAW.pwn`

**Sumber:** `D:\Bloom\server\gamemodes\TEXTDRAW.pwn` (4150 baris, 234KB).
**Peran:** Deklarasi variable textdraw + 2 fungsi besar: `CreatePlayerTextDraws(playerid)` (per-player) dan `CreateTextDraw()` (global one-time).
**Jumlah textdraw unik (estimasi):** 300+ (gabungan `Text:` global + `PlayerText:` per-player, banyak yang berupa array seperti `[MAX_PLAYERS][62]` jadi puluhan element per nama variable).

**Fungsi show/hide** utama ada di `FUNCTION.pwn` (bukan di TEXTDRAW.pwn) — TEXTDRAW.pwn hanya pembuatan + styling. Pemanggilan show/hide dilakukan oleh modul masing-masing (HBE.pwn, SPEEDOMETER section, dll).

**Textdraw click dispatch:** `OnClickDynamicPlayerTextDraw` (GM.pwn line 4652, ~199 baris) dan `OnClickDynamicTextDraw` (line 4851, ~400 baris) menangani klik untuk interaksi (ATM, panel, hotbar, dsb).

---

## 1. Grup textdraw (dari header komentar + variable name)

| Grup | Variable key | Target CEF screen (fase) |
|---|---|---|
| **Server logo** | `RRPLogoTD[9]`, `LOGOSAMBABEE[10]`, `LOGOMASSAMBABEE[8]` | Watermark / branding → ganti dengan BloomLogo di CEF (fase U2+ idle variant) |
| **Info/Status core** | `InfoTD[MAX_PLAYERS]`, `TextTime`, `TextDate`, `RedScreen`, `BlackScreen` | HUD jam & tanggal → CEF HUD overlay top-right (fase U3) |
| **Top-10 list** | `TopTenList` | Leaderboard tampilan singkat → CEF Social (fase U4) |
| **HBE Modern (hunger/bladder/energy)** | `TDEditor_TD[19]` | HUD stat bar → CEF HUD overlay left-bottom (fase U3) |
| **HBE Simple (Grimzz)** | `HbeFinalTD[9]`, `HungerBarTD/ThirstBarTD/PeeBarTD[MAX_PLAYERS]`, `HungerStrTD/ThirstStrTD/PeeStrTD[MAX_PLAYERS]`, `IdplayerTD`, `MoneyplayerTD` | HUD stat bar alt mode → CEF HUD (user bisa pilih style) |
| **Mod shop (vehicle mod)** | `ModTD[29]` | Vehicle tuning panel → CEF Vehicle Management (fase U4) |
| **Speedometer** | `NewvehicleTD[10]`, `VengineOnTD/VengineOffTD/VmphTD/VfuelTD/VHealthhTD/VbeltonTD/VbeltoffTD[MAX_PLAYERS]`, `DPvehname/DPvehengine/DPvehspeed/DPvehfare[MAX_PLAYERS]` (modern), `SPvehname/SPvehengine/SPvehspeed[MAX_PLAYERS]` (simple) | HUD vehicle panel → CEF HUD right-bottom (fase U3) |
| **Dashboard player (DP*)** | `DPname[MAX_PLAYERS]`, `DPmoney`, `DPcoin` | HUD money/name → CEF HUD money chip (fase U3) |
| **Fishing area** | `FishingAreaTD[MAX_PLAYERS]` | Job notif → CEF Toast (fase U3) |
| **CCTV** | `CctvTD[6]` | CCTV viewer overlay → CEF Admin / SAPD panel (fase U4) |
| **ID Card** | `IDCARD_Player[MAX_PLAYERS][49]` | Panel ID card player → CEF ID popup (fase U3) |
| **ATM** | `ATM_Player[MAX_PLAYERS][62]` | ATM UI → **CEF ATM panel** (fase U3, prioritas U2+ karena banyak di base) |
| **Green zone** | `GreenZone_TD[MAX_PLAYERS][14]` | Safe zone HUD overlay → CEF HUD indicator (fase U3) |
| **Loading bar** | `LoadingBAR_RRP[MAX_PLAYERS][10]` | Loading / progress → CEF Loading screen (fase U2) |
| **Spectator** | `Spectator_TD[MAX_PLAYERS][23]` | Spectate mode UI → CEF Admin overlay (fase U4) |
| **Cook meth** | `CookMeth_TD[MAX_PLAYERS][22]` | Mini-game cooking → CEF mini-game overlay (fase U4) |
| **Shooting range** | 11 textdraw per player (`background_srangeTD` sampai `lasttarget_srangeTD`) | Shooting range HUD → CEF mini-game panel (fase U4) |
| **Panel player** | `PanelPlayer[MAX_PLAYERS][28]` | Main player panel/hotbar → **CEF HUD hotbar + panel** (fase U3) |
| *(lanjut dari CreateTextDraw() global, 1375 baris, perlu pembacaan lanjut)* | Login screen bg, Character selection screen, FAQ, mapping, admin overlay, event banner, dll | Fase-per-fase |

---

## 2. Observasi untuk migrasi CEF

1. **Jumlah PlayerText per player cukup besar** — total slot `PlayerText` per player bisa ratusan. Server menghabiskan slot `MAX_PLAYER_TEXTDRAWS = 256` dengan cepat. Setelah pindah CEF, slot ini free untuk fitur lain atau textdraw legacy khusus (contoh textdraw 3D positional).
2. **Textdraw click sebagai event trigger** — di OnClickDynamicPlayerTextDraw banyak logic UX (hotbar klik, panel klik ATM). Di CEF ini jadi event JS → bridge → Pawn action.
3. **ID Card** (`IDCARD_Player`) 49 element — kemungkinan tabel 7×7 atau layout detail. CEF reimplement sebagai card component tunggal dengan field terstruktur.
4. **ATM** (`ATM_Player`) 62 element — layout kompleks, perlu reverse engineering buka tutup logic di DIALOG.pwn (`DIALOG_ATMWITHDRAW` dll) + textdraw click di OnClickDynamicPlayerTextDraw.
5. **HBE dual mode (Modern vs Simple)** — base sudah menyediakan pilihan user. CEF idealnya tetap kasih pilihan (Settings → HUD style).
6. **Loading bar progress2** — pakai include `progress2`. CEF ganti dengan BloomLogo loading variant.
7. **Logo textdraw lama** (`RRPLogoTD`, `LOGOSAMBABEE`) — hapus, ganti CEF BloomLogo idle variant di pojok.

---

## 3. Textdraw yang bisa tetap legacy (tidak perlu ke CEF)

Beberapa textdraw lebih cocok tetap legacy karena **3D projected / world-positioned** atau **sangat ringan dan nggak butuh style Bloom**:

- Nametag di atas kepala karakter (3D label text) — tetap pakai `Create3DTextLabel`, bukan CEF (karena perlu world projection).
- Fishing area indicator (floating di depan karakter) — bisa tetap textdraw karena posisional.
- Server MOTD scrolling / Red/Black Screen full overlay — bisa tetap textdraw karena simple.

**Decision:** Yang pindah CEF adalah **UI panel + HUD overlay statis** (anchor di sudut layar). Yang tetap textdraw adalah **worldspace 3D text / nametag**.

---

## 4. Mapping lengkap TextDraw → CEF screen (siap dipakai di spec U3)

| CEF Screen | Textdraw legacy yang digantikan |
|---|---|
| **HUD overlay (U3)** | InfoTD, TextTime, TextDate, DPname/money/coin, TDEditor_TD HBE, HbeFinalTD, HungerBarTD/ThirstBarTD/PeeBarTD, IdplayerTD, MoneyplayerTD, VengineOn/Off, VmphTD, VfuelTD, VHealthhTD, VbeltonTD/off, DPveh*, SPveh*, GreenZone_TD |
| **ATM Panel (U3)** | ATM_Player[*][62] |
| **ID Card Panel (U3)** | IDCARD_Player[*][49] |
| **Hotbar / Main panel (U3)** | PanelPlayer[*][28] |
| **Loading screen (U2)** | LoadingBAR_RRP, bagian splash dari CreateTextDraw() (butuh audit lanjut) |
| **Logo watermark (U0/U2)** | RRPLogoTD, LOGOSAMBABEE, LOGOMASSAMBABEE |
| **Modshop panel (U4)** | ModTD[29] |
| **Shooting range panel (U4)** | 11 textdraw sray (background_sry — lasttarget_sry) |
| **Spectator overlay (U4)** | Spectator_TD |
| **Cook mini-game (U4)** | CookMeth_TD |
| **CCTV viewer (U4)** | CctvTD[6] |
| **Fishing area indicator (U3 / tetap legacy)** | FishingAreaTD |
| **Leaderboard (U4)** | TopTenList |
| **(TBD setelah audit CreateTextDraw global ~baris 2775+)** | Login screen bg, char selection bg, FAQ, event banner, admin overlay — perlu dibaca di fase U2 sebelum mulai implement login screen CEF |

---

## 5. Catatan budget

Jika semua HUD + panel + login/char-select pindah ke CEF, sisa textdraw legacy di server estimasi <20% dari jumlah sekarang. Memory per-player ratusan textdraw turun jauh. **Keuntungan performa Android low-end: besar.**
