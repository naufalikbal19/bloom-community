# Base Audit — `include/` + `plugins/` + Filterscripts

**Sumber:** `D:\Bloom\server\include\`, `D:\Bloom\server\plugins\`, `D:\Bloom\server\filterscripts\`, `D:\Bloom\server\server.cfg`.

---

## 1. Plugin runtime (dari `server.cfg`)

```
plugins crashdetect samp-compat mysql streamer sscanf pawnregex pawncmd
        samp_bcrypt bscrashfix mapandreas textdraw-streamer gvar requests
        profiler nativechecker
```

| Plugin | File di `plugins/` | Peran | Status open.mp | Catatan |
|---|---|---|---|---|
| `crashdetect` | ✅ `.dll` + `.so` + `.DLL.dat` | Crash log & stack trace | ✅ Essential, open.mp OK | `crashdetect.txt` di log dir |
| `samp-compat` | ✅ | Layer kompat SA-MP di open.mp | ✅ Native open.mp plugin | **Confirms base jalan di open.mp** |
| `mysql` | ✅ `mysql.dll/so` + `mysql_static.so` | MySQL R41-4+ | ✅ open.mp fully supported | `libmariadb.dll` ada |
| `streamer` | ✅ | Incognito streamer (objects, pickups, areas, CPs, actors) | ✅ Essential |
| `sscanf` | ✅ `sscanf.dll/so` + `amxsscanf.dll/so` | Argument parser (sscanf2) | ✅ Essential |
| `pawnregex` | ✅ + `pawnregex.cfg` | Regex | ✅ open.mp OK |
| `pawncmd` | ✅ + `pawncmd.cfg` | Command processor (Pawn.CMD) | ✅ open.mp OK; alternatif ke YCMD/ZCMD |
| `samp_bcrypt` | ✅ | Password hashing (bcrypt) | ✅ open.mp OK |
| `bscrashfix` | ✅ | Bitstream crash fix | ✅ open.mp OK |
| `mapandreas` | ✅ | Z-height map lookup | ✅ open.mp OK |
| `textdraw-streamer` | ✅ | TextDraw streamer | ✅ open.mp OK |
| `gvar` | ✅ | Global per-player variables | ✅ open.mp OK |
| `requests` | ✅ | HTTP client wrapper | ✅ open.mp OK; alternatif ke `a_http` native |
| `profiler` | ✅ | Script profiler | ✅ open.mp OK; aktif (lihat `GM-profile.html` di gamemodes) |
| `nativechecker` | ✅ | Verify native fn presence saat startup | ✅ open.mp OK |

### Plugin terdaftar di folder tapi NGGAK dimuat di `server.cfg`
| Plugin | Alasan tidak dimuat | Note |
|---|---|---|
| `discord-connector` | Opsional | Butuh `discord_bot_token` config di server.cfg (sudah di-set — tapi plugin nggak di `plugins=`) |
| `jit` | Opsional | JIT compiler untuk Pawn — bisa percepat eksekusi. **Rekomendasi**: aktifkan di produksi Bloom (test dulu) |
| `pawnraknet` | Opsional | RakNet packet access — advanced; nggak essential |
| `sampvoice` | Dibungkus include di GM.pwn | Dimuat via `plugins=`? Perlu double-check: `sampvoice.dll/so` ada di folder, header di GM.pwn ada. Kemungkinan **harus ditambahkan ke server.cfg** untuk aktif |

**Rekomendasi Bloom:**
- Pertahankan plugin stack ini. Semua kompat open.mp.
- Pertimbangkan drop `requests` (pakai `a_http` native) atau `pawnregex` (pakai string helpers) kalau mau tipis — tapi bukan prioritas.
- Pastikan `sampvoice` dimuat kalau fitur voice chat beneran dipakai.
- Hidupkan `jit` di staging/prod untuk benchmark.

---

## 2. Include lokal (`server/include/`)

```
gl_common.inc
gl_messages.inc
gl_spawns.inc
vehicleutil.inc
```

| File | Peran dugaan | Note |
|---|---|---|
| `gl_common.inc` | Common helper (grand larc gamemode legacy) | Kemungkinan boilerplate gang-wars/base; **cek pemakaian** — kalau nggak dipakai, hapus |
| `gl_messages.inc` | Message/chat helpers | Sama |
| `gl_spawns.inc` | Spawn location data | Sama |
| `vehicleutil.inc` | Vehicle utility (plate, color, model name) | Mungkin dipakai PRIVATE_VEHICLE.pwn — perlu grep |

**Catatan:** Include stack asli yang dipakai GM.pwn (a_samp, YSI, Pawn.CMD, dll) datang dari path library pawno/pawnc di-set di tool, bukan folder lokal `server/include/`. Folder `server/include/` ini sepertinya legacy sisa, perlu konfirmasi apakah ter-reference oleh gamemode via `#include "..."`.

Dari grep: GM.pwn baris 44 pakai `#include <strlib.inc>` — jika strlib ini ada di include lokal, akan tersembunyi di sini. Belum ketemu di 4 file di atas. Berarti `strlib`, `samp_bcrypt`, `garageblock`, `EVF`, `geolite`, `progress2`, `mSelection`, `textdraw-streamer`, `nex-ac`, `anti_spoof` include-nya di **library pawno/pawnc global**, bukan lokal.

**Action item (bukan sekarang):** scan `pawno/include/` jika ada di `server/pawno/`, karena itu library compile untuk `.pwn → .amx`.

---

## 3. Filterscripts (`server/filterscripts/`)

```
antivpn.amx + .pwn
implant_mapping.amx + .pwn + .rar
voice.amx + .pwn
map/
filterscripts.zip
```

| Filterscript | Peran | Dipakai sekarang? |
|---|---|---|
| `antivpn` | VPN detector (block atau log) | ⚠️ Perlu cek `server.cfg filterscripts` — hanya `implant_mapping` yang dimuat |
| `implant_mapping` | Mapping overlay / tambahan object | ✅ Dimuat (`filterscripts implant_mapping`) |
| `voice` | Voice chat FS (kemungkinan sampvoice setup) | ⚠️ Status aktif unclear |

**Rekomendasi Bloom:**
- `antivpn` — pertimbangkan di-aktifkan jika pemain luar negeri ingin dibatasi. Owner decision.
- `implant_mapping` — ini custom mapping Reactive RP. Untuk Bloom, perlu bikin mapping sendiri bertema teater/girlies kalau mau (tidak prioritas MVP).
- `voice` — tunda kalau voice chat tidak di-prioritaskan di MVP.

---

## 4. Scriptfiles (`server/scriptfiles/`)

```
YSI
callbackfix.amx
colandreas          (collision & NG lookup data)
furnitures           (data furniture custom)
nex-ac_nop_settings.cfg
nex-ac_settings.cfg
skins               (data skin / ped data)
desktop.ini
```

| Item | Peran |
|---|---|
| `YSI` folder | YSI configuration / cached data (y_ini config) |
| `callbackfix.amx` | Standalone callback fix (invoked via LoadFilterScript?) |
| `colandreas` | ColAndreas collision data (plugin ColAndreas?) — **tapi plugin nggak di server.cfg**, mungkin cuma data file |
| `furnitures` | Save data furniture user |
| `nex-ac_*.cfg` | Nex-AC config (whitelist, NOP settings) |
| `skins` | Skin/ped data file |

**Rekomendasi Bloom:**
- Pertahankan nex-ac config, tambahkan whitelist untuk CEF bridge calls supaya nggak false positive.
- Furniture save data: cek apakah ini file flat atau MySQL. Untuk Bloom bisa migrate ke MySQL kalau belum.

---

## 5. Database file

`D:\Bloom\database.sql` sudah ada di root. **Belum di-audit** untuk sesi ini. Rekomendasi: fase A.2 (sesi berikutnya) buat `docs/base-audit-database.md` yang isinya:
- List table + jumlah row estimasi
- Foreign key relationship
- Flag masalah (plaintext column, missing index, dsb)
- Rekomendasi skema baru Bloom (3-slot characters per account, dll)

---

## 6. Verdict kompat open.mp

**Status:** ✅ **Base sudah di open.mp** (confirmed via `samp-compat` plugin di stack). Tidak perlu "migrasi open.mp" — plan master §Fase 1 tentang migrasi mungkin perlu diubah jadi "rapihkan modular + skema DB baru" saja.

**Risiko plugin:**
- `sampvoice`: open.mp support belum first-class. Jika voice chat kritis, cari alternatif (seperti FCNPC voice, atau TeamSpeak overlay).
- `nex-ac`: pure Pawn, aman tapi perlu whitelist tweak untuk CEF.

**Rekomendasi untuk `docs/decisions-log.md`** (nanti sesi berikutnya):
- ADR-004: Pertahankan plugin stack existing + aktifkan `jit` di produksi.
- ADR-005: Tunda implementasi voice chat sampai MVP release.
