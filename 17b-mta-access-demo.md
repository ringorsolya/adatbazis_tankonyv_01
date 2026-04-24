# Történeti adatbázis Access-ben: MTA-demo

Eddig a `tbl_Kutatók` és `tbl_Látogatások` táblák segítségével tanultuk meg az Access alapjait. Ebben a rövid, gyakorlatias fejezetben **valódi történeti adaton** mutatjuk be ugyanezt a folyamatot: három Excel-fájlt töltünk be, kapcsolatot rajzolunk közéjük, és futtatunk négy egyszerű lekérdezést.

A gyakorlat az *MTA alapítói és első nemzedéke (1825–1850)* adatsor köré épül. Ugyanez az adat szerepel majd a következő fejezetben a saját eszköz bemutatásakor — így itt pontosan láthatjuk, miért és mit automatizál a saját eszköz.

## Miért ez a gyakorlat?

A tankönyv eddigi példáiban (Kutatók, Látogatások) a struktúra *didaktikus* volt — kitalált adat, átlátható mezőnevekkel. A történeti kutatásban a valóság ritkán ilyen tiszta: a nyers források tele vannak változó helyesírással, vesszővel elválasztott felsorolással, egymást átfedő kategóriákkal.

Az MTA-adatsor nyers formája (az eredeti `MTA_alapitok_es_elso_nemzedek_1825-1850.xlsx` fájl) éppen ilyen: a felekezet mező tízféleképpen szerepel ("rk", "r. kat.", "katolikus", "római katolikus" stb.), az MTA-szerep oszlop pedig vesszős felsorolás ("alapító, igazgató tag"). Ha ezt közvetlenül Access-be töltenénk, hamar belefutnánk a "hogy kapok meg egy *tiszta* lekérdezést?" problémába.

Az itt bemutatott három fájl már **eleve helyesen felbontott** változat. Ez az, amit a hallgatóknak meg kell szokniuk: **egy nyers forrásból** a történészi munka első lépése **több, tisztán körülhatárolt táblát faragni**.

## A három tábla és kapcsolatuk

A három Excel-fájl a következőket tartalmazza:

**`01_szemelyek.xlsx`** — 50 rekord, fő tábla. Minden MTA-tag egy sor. Oszlopok:

- `szemely_id` — elsődleges kulcs (1–50)
- `nev`, `szul_ev`, `halal_ev`, `nem`, `szul_hely`, `foglalkozas`
- `vallas_id` — idegen kulcs a `02_vallasok` táblára
- `mta_osztaly`, `valasztas_eve`

**`02_vallasok.xlsx`** — 3 soros kódszótár (lookup-tábla):

- `vallas_id` — elsődleges kulcs (1, 2, 3)
- `vallas_nev` — kanonikus felekezet-név (Római katolikus / Református / Evangélikus)

**`03_mta_szerepek.xlsx`** — 59 rekord. A vesszővel elválasztott MTA-szerepek feloldott formája:

- `szerep_id` — elsődleges kulcs
- `szemely_id` — idegen kulcs a `01_szemelyek` táblára
- `szerep` — egyetlen szerep-érték (pl. "alapító" vagy "igazgató tag")

A kapcsolatok rajza:

```
┌──────────────────────┐              ┌──────────────────────┐
│  02_vallasok         │              │  01_szemelyek        │
│  ──────────          │    1  :  N   │  ──────────          │
│  vallas_id    (PK) ──┼──────────────┤  szemely_id   (PK)   │
│  vallas_nev          │              │  ...                 │
└──────────────────────┘              │  vallas_id    (FK)   │
                                      │  ...                 │
                                      └──────────┬───────────┘
                                                 │ 1 : N
                                      ┌──────────┴───────────┐
                                      │  03_mta_szerepek     │
                                      │  ──────────          │
                                      │  szerep_id    (PK)   │
                                      │  szemely_id   (FK)   │
                                      │  szerep              │
                                      └──────────────────────┘
```

Két kapcsolattípusra látunk egyszerre példát: a `vallasok → szemelyek` irányban egy klasszikus **lookup-kapcsolat** (sok személy tartozhat egy felekezethez), a `szemelyek → mta_szerepek` irányban pedig egy **egy-a-sokhoz** kapcsolat (egy személynek több szerepe lehet).

## A fájlok letöltése

A három gyakorló fájl letöltésre kattintható formában:

- [01_szemelyek.xlsx](01_szemelyek.xlsx) — 50 fős fő tábla
- [02_vallasok.xlsx](02_vallasok.xlsx) — 3 soros felekezet-szótár
- [03_mta_szerepek.xlsx](03_mta_szerepek.xlsx) — 59 szerep-rekord

**A letöltéshez:** jobb kattintás a linken → *"Hivatkozás mentése másként"* (Chrome / Firefox / Edge). Érdemes mindhárom fájlt ugyanabba a mappába tenni.

## Betöltés Access-be

### 1. lépés: új adatbázis

1. Nyissuk meg az Access-t → **Üres adatbázis**
2. Név: `mta_demo.accdb`, mentsük egy általunk kiválasztott mappába
3. **Létrehozás**

### 2. lépés: az első Excel-fájl importálása

1. **Külső adatok** fül → **Új adatforrás** → **Fájlból** → **Excel**
2. *Tallózás* → válasszuk ki a `01_szemelyek.xlsx` fájlt
3. Az ablak alján: **"Forrásadatok importálása új táblába az aktuális adatbázisban"**
4. **OK**

A varázsló lépései:

- *"Első sor oszlopfejléceket tartalmaz"* → **Igen** (pipáljuk be)
- A `szemely_id` oszlopnál: *Indexelve: Igen (ismétlődés nem megengedett)*
- *"Elsődleges kulcs kiválasztása"* → **"Saját elsődleges kulcs választása"** → `szemely_id`
- Tábla neve: `szemelyek` (az alapértelmezett `01_szemelyek` névből vegyük ki a "01_" előtagot — nevek táblákban ne induljanak számjeggyel)
- **Befejezés**

### 3. lépés: a másik két fájl

A 2. lépést ismételjük meg a másik két fájlra:

- `02_vallasok.xlsx` → elsődleges kulcs: `vallas_id`, tábla neve: `vallasok`
- `03_mta_szerepek.xlsx` → elsődleges kulcs: `szerep_id`, tábla neve: `mta_szerepek`

A bal oldali navigációs panelen most három tábla jelenik meg: `szemelyek`, `vallasok`, `mta_szerepek`. Dupla kattintással mindegyik megnyitható adatlap nézetben.

> **Megjegyzés:** ha a hallgatónak megváltozott az oszlopok típusa (pl. a `szul_ev` szövegként jött be), **Tervező nézetben** könnyen átállítható **Szám** típusra.

## Kapcsolatok definiálása

1. **Adatbázis-eszközök** fül → **Kapcsolatok** gomb
2. A *"Táblák megjelenítése"* ablakban mindhárom táblát adjuk hozzá → **Bezárás**
3. A három tábla ablaka megjelenik — mindegyikben a mezőnevek listája, a PK dőlt-félkövérrel

### Első kapcsolat: `vallasok` ↔ `szemelyek`

1. Kattintsunk a `vallasok` tábla `vallas_id` mezőjére, és **húzzuk** a `szemelyek` tábla `vallas_id` mezőjére
2. Megjelenik a *"Kapcsolatok szerkesztése"* ablak
3. **Referenciális integritás érvényesítése** → **pipáljuk be**
4. **Létrehozás**

A rajzon most egy vékony vonal jelenik meg a két tábla között, "1" és "∞" jellel — ez a **referenciális integritás** jelölése, és azt biztosítja, hogy a `szemelyek` táblában ne szerepelhessen olyan `vallas_id`, ami nincs a `vallasok` táblában.

### Második kapcsolat: `szemelyek` ↔ `mta_szerepek`

Ugyanígy: húzzuk a `szemelyek.szemely_id`-t a `mta_szerepek.szemely_id`-re, és érvényesítsük a referenciális integritást.

Mentés **Ctrl+S**. A kapcsolatrajzot érdemes nyitva hagyni a lekérdezések írásakor, hogy lássuk, mi mihez kapcsolódik.

## Négy egyszerű lekérdezés

Mindegyik lekérdezést **Tervező nézetben** állítjuk össze — nincs szükség SQL-t írni, csak táblákat húzni és mezőket választani.

### Lekérdezés 1 — minden személy a felekezete megnevezésével

Ez a legegyszerűbb JOIN: két táblát kapcsolunk össze a közös kulcs mentén.

1. **Létrehozás** fül → **Lekérdezéstervezés**
2. *Táblák megjelenítése:* `szemelyek` és `vallasok` → **Bezárás** (Access automatikusan megrajzolja a kapcsolatot)
3. A `szemelyek` táblából dupla kattintással: `nev`, `szul_ev`
4. A `vallasok` táblából dupla kattintással: `vallas_nev`
5. A `nev` oszlop **Rendezés** sorában: *Növekvő*
6. **Futtatás** (piros felkiáltójel)
7. Mentés: **Ctrl+S** → `qry_01_szemelyek_felekezettel`

**Várható eredmény:** 50 sor, minden személy a kanonikus felekezet-névvel.

### Lekérdezés 2 — hány MTA-tag tartozott felekezetenként?

Ez az első **aggregált** (összegző) lekérdezésünk.

1. **Létrehozás** → **Lekérdezéstervezés**
2. Húzzuk be a `szemelyek` és `vallasok` táblát → **Bezárás**
3. Vigyük le a `vallas_nev` mezőt, **majd még egyszer** a `vallas_nev` mezőt (az első a csoportosítás kulcsa, a második a számoláshoz kell)
4. A **Tervezés** szalagon kapcsoljuk be az **Összesítés** (Σ) gombot — új sor jelenik meg *"Összesítés"* felirattal
5. Az első `vallas_nev` alatt maradjon *Group By* (Csoportosítás)
6. A második `vallas_nev` alatt állítsuk át: *Count* (Darab)
7. **Futtatás**
8. Mentés: `qry_02_felekezeti_eloszlas`

**Várható eredmény:**

| vallas_nev       | Count Of vallas_nev |
|------------------|---------------------|
| Római katolikus  | 31                  |
| Református       | 10                  |
| Evangélikus      | 9                   |

### Lekérdezés 3 — 1830-ban választott nyelvészeti osztályú tagok

Ez a lekérdezés két szűrési feltételt mutat meg egyszerre.

1. **Létrehozás** → **Lekérdezéstervezés**
2. Csak a `szemelyek` táblát húzzuk be → **Bezárás**
3. Vigyük le: `nev`, `foglalkozas`, `mta_osztaly`, `valasztas_eve`
4. A `valasztas_eve` oszlop **Feltétel** sorába: `1830`
5. A `mta_osztaly` oszlop **Feltétel** sorába: `"nyelvtudományi"`
6. A `nev` oszlop **Rendezés** sora: *Növekvő*
7. **Futtatás**
8. Mentés: `qry_03_1830_nyelveszek`

**Várható eredmény:** többek között Vörösmarty Mihály, Toldy (Schedel) Ferenc, Kisfaludy Sándor. Amikor két feltétel ugyanabban a sorban áll, az logikai ÉS: mindkettőnek teljesülnie kell.

### Lekérdezés 4/A — kik voltak több MTA-szerepben (két lépésben)?

Ezt először két lépésre bontjuk, hogy a hallgatók lássák: **lekérdezésre is lehet lekérdezést építeni**.

**Első lekérdezés** — hány szerepe van személyenként:

1. **Létrehozás** → **Lekérdezéstervezés**
2. Húzzuk be a `szemelyek` és `mta_szerepek` táblát → **Bezárás**
3. Vigyük le: `nev`, majd a `szerep` mezőt
4. **Összesítés** (Σ) bekapcsolása
5. `nev` alatt: *Group By*, `szerep` alatt: *Count*
6. Mentés: `qry_04a_szerepszam`

**Második lekérdezés** — az előzőre épülve szűrjük a többszerepűeket:

1. **Létrehozás** → **Lekérdezéstervezés**
2. *Táblák megjelenítése:* a **Lekérdezések** fülön húzzuk be a `qry_04a_szerepszam`-et → **Bezárás**
3. Vigyük le mindkét mezőt
4. A `CountOfszerep` oszlop **Feltétel** sorába: `>1`
5. Rendezés csökkenő a szerepek száma szerint
6. **Futtatás**
7. Mentés: `qry_04a_tobbszerepuek`

**Várható eredmény:** 9 sor — Széchenyi István (alapító + alelnök), Vay Ábrahám, Andrássy György, Károlyi György, Teleki József, Döbrentei Gábor, Helmeczy Mihály, Toldy (Schedel) Ferenc, Prónay Sándor, egyenként 2 szereppel.

### Lekérdezés 4/B — ugyanaz egyetlen lekérdezésben

Ha az Összesítés és Feltétel kombinációt már kényelmesen használjuk, Lekérdezés 4 egyetlen lépésben is összerakható. A Feltétel sor ilyenkor a csoportosítás **utáni** szűrésre vonatkozik.

1. **Létrehozás** → **Lekérdezéstervezés**
2. Húzzuk be a `szemelyek` és `mta_szerepek` táblát → **Bezárás**
3. Vigyük le: `nev`, majd a `szerep` mezőt
4. **Összesítés** (Σ) bekapcsolása
5. `nev` alatt: *Group By*, `szerep` alatt: *Count*
6. A `szerep` oszlop **Feltétel** sorába: `>1`
7. A `szerep` oszlop **Rendezés** sora: *Csökkenő*
8. **Futtatás**
9. Mentés: `qry_04b_tobbszerepuek_egylepesben`

**Várható eredmény:** ugyanaz a 9 sor, mint a 4/A-ban.

> **Mikor melyik?** A **4/A** (kétlépéses) didaktikailag erősebb: megmutatja, hogy a lekérdezés nem zsákutca, hanem újabb építőelem egy következő lekérdezéshez. A **4/B** (egylépéses) kompaktabb és a gyakorlatban gyakrabban használt. Mindkettő pontosan ugyanazt az eredményt adja.

## Összefoglalás és átvezetés

A gyakorlatban a következő logikát látszottuk végig:

1. A nyers Excel-adatból **több, tisztán körülhatárolt táblát** készítünk — ez a normalizálás.
2. Az Access-be **három különálló táblaként** töltjük be őket.
3. A táblák közötti logikai kapcsolatot **referenciális integritással** rögzítjük.
4. Az elemzést **lekérdezésekként** fogalmazzuk meg — minden egyes kutatási kérdést egy külön, mentett és újrafuttatható lekérdezés képvisel.

A következő fejezet ugyanerre az MTA-adatra a **saját, böngészőben futó eszközünket** veti be. Ott nem kell külön táblákat definiálnunk, kapcsolatokat rajzolnunk, lekérdezéseket tervezőrácson összerakunk — **mindez már be van építve** a prozopográfia sablonba. Az itt megértett fogalmak viszont pontosan ugyanazok maradnak, csak a felület lesz egyszerűbb.
