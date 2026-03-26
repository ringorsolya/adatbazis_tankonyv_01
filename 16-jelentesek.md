# Jelentések: Nyomtatható listák készítése

## Bevezetés

Az adatokat eddig táblákban, űrlapokon és lekérdezésekben néztük. De mi van, ha nyomtatni szeretnénk őket? Vagy PDF-be exportálni?

Erre valók a **jelentések** (reports)!

A jelentés:

- **Nyomtatásra** optimalizált formátum
- **Professzionális** megjelenés (fejléc, lábléc, oldalszámok)
- **Csoportosítható** (pl. kutatók intézmény szerint csoportosítva)
- **Exportálható** (PDF, Word, Excel)

## Egyszerű jelentés: Kutatók listája

Készítsünk egy egyszerű nyomtatható kutatói listát!

### 1. lépés: Jelentés varázsló indítása

1. Kattintsunk egyszer a `tbl_Kutatók` táblára (kijelölés, NE megnyitás!)
2. **Létrehozás** fül → **Jelentés** gomb

Az Access automatikusan készít egy jelentést!

### 2. lépés: A jelentés megtekintése

Most egy formázott listát látunk:

```
┌─────────────────────────────────────────────┐
│                tbl_Kutatók                  │  ← Jelentés fejléce
│              2024. március 15.              │
├─────────────────────────────────────────────┤
│ KutatóID  Név            Email      Intézmény│  ← Oszlopfejlécek
├─────────────────────────────────────────────┤
│    1      Kovács Anna    kovacs... ELTE BTK │
│    2      Nagy Péter     nagy...   Független│
│    3      Szabó Mária    szabo...  PTE BTK  │
│   ...                                        │
├─────────────────────────────────────────────┤
│                      1. oldal                │  ← Oldal lábléce
└─────────────────────────────────────────────┘
```

### 3. lépés: Nyomtatási kép nézet

Nézzük meg, hogyan nézne ki kinyomtatva:

1. **Nézet** gomb → **Nyomtatási kép** (Print Preview)

Most látjuk a teljes oldalt, úgy, ahogy kinyomtatnánk.

**Eszközök:**

- **Zoom** (nagyítás/kicsinyítés)
- **Egy/Két oldal** nézet
- **Nyomtatás** gomb (ha ténylegesen kinyomtatnánk)
- **PDF vagy XPS** – Exportálás PDF-be

### 4. lépés: PDF exportálás

Exportáljuk PDF-be a listát:

1. **Adatok** fül → **PDF vagy XPS**
2. Válasszuk ki a helyet (pl. Asztalt)
3. Fájlnév: `Kutatók_lista.pdf`
4. **Közzététel**

Létrejött a PDF! Megnyithatjuk és kinyomtathatjuk.

### 5. lépés: Jelentés mentése

Mentsük el a jelentést:

1. Zárjuk be a jelentést (✕)
2. Az Access megkérdezi: “Mentsük?”
3. **Igen**
4. Név: `rpt_Kutatok_lista`
5. **OK**

> **Jó gyakorlat:** A jelentések nevét `rpt_` előtaggal kezdjük (report = jelentés).

## Jelentés testre szabása

A jelentéseket is testre szabhatjuk, mint az űrlapokat!

### 1. lépés: Tervezési nézetre váltás

1. Dupla kattintás az `rpt_Kutatok_lista` jelentésre (megnyitás)
2. **Nézet** gomb → **Tervezési nézet**

### 2. lépés: A jelentés szakaszai

Egy jelentés több szakaszból áll:

```
┌──────────────────────────────────┐
│ Jelentés fejléce                 │  ← Egyszer, az elején
├──────────────────────────────────┤
│ Oldalfejléc                      │  ← Minden oldal tetején
├──────────────────────────────────┤
│ Részletek                        │  ← Ismétlődik minden rekordnál
├──────────────────────────────────┤
│ Oldallábléc                      │  ← Minden oldal alján
├──────────────────────────────────┤
│ Jelentés lábléce                 │  ← Egyszer, a végén
└──────────────────────────────────┘
```

### 3. lépés: Cím hozzáadása

Adjunk hozzá egy szép címet a jelentés fejlécéhez:

1. Kattintsunk a **Jelentés fejléce** szakaszba
2. Keressük meg a cím címkét (pl. “tbl\_Kutatók”)
3. Dupla kattintás → Szerkesztési mód
4. Töröljük ki, írjuk be: **Kutatói Nyilvántartás**

#### Formázás

1. Címke kijelölve
2. **Kezdőlap** fül:
   - Betűméret: 20
   - Félkövér
   - Középre igazítás

### 4. lépés: KutatóID oszlop elrejtése

A KutatóID-t nem szükséges nyomtatni. Rejtsük el:

1. Kattintsunk a **KutatóID** szövegdobozra (Részletek szakasz)
2. F4 → Tulajdonságlap
3. **Látható** → Nem

Ugyanezt a **KutatóID** oszlopfejléccel is (Oldalfejléc szakaszban).

### 5. lépés: Oszlopok átméretezése

Ha túl széles vagy keskeny egy oszlop:

1. Kattintsunk az oszlop szövegdobozára
2. Húzzuk a jobb szélét (◀▶ kurzor)

### 6. lépés: Dátum hozzáadása a lábléchez

Adjuk hozzá a nyomtatás dátumát az oldal láblécéhez:

1. **Tervezés** fül → **Dátum és idő** gomb
2. Válasszuk ki a dátumformátumot (pl. “Hosszú dátum”)
3. **OK**

Megjelenik a láblécben: `=Date()`

### 7. lépés: Oldalszám hozzáadása

Adjuk hozzá az oldalszámot:

1. **Tervezés** fül → **Oldalszámok** gomb
2. Formátum: “X / Y oldal” (pl. “1 / 3 oldal”)
3. Pozíció: Oldal lábléce, középen
4. **OK**

### 8. lépés: Mentés és előnézet

1. **Ctrl+S** (mentés)
2. **Nézet** → **Nyomtatási kép**

Most egy profi jelentést látunk címmel, dátummal, oldalszámmal! 🎉

## Jelentés lekérdezésből

Természetesen jelentést nemcsak táblákból, hanem lekérdezésekből is készíthetünk!

### Példa: Márciusi látogatások jelentése

1. Kattintsunk egyszer a `qry_Marciusi_latogatasok` lekérdezésre
2. **Létrehozás** → **Jelentés**

Az Access készít egy jelentést a márciusi látogatásokról!

### Mentés

- **Ctrl+S** → Név: `rpt_Marciusi_latogatasok`

## Csoportosított jelentés

A jelentések egyik legerősebb funkciója a **csoportosítás**.

**Példa:** Kutatók listája, intézmények szerint csoportosítva.

### 1. lépés: Jelentésvarázsló

Ezúttal használjuk a varázslót:

1. **Létrehozás** → **Jelentésvarázsló** (Report Wizard)

### 2. lépés: Táblák és mezők kiválasztása

1. **Táblák/lekérdezések:** `tbl_Kutatók`
2. **Elérhető mezők** → **Kiválasztott mezők:**
   - Intézmény
   - Név
   - Email
   - Aktív
3. **Tovább**

### 3. lépés: Csoportosítási szintek

1. “Szeretne csoportosítási szinteket megadni?”
2. Dupla kattintás: **Intézmény**

Most az Intézmény “feljebb kerül” → ez lesz a csoportosító mező.

3. **Tovább**

### 4. lépés: Rendezési sorrend

1. Rendezzük a neveket ABC sorrendben
2. Első rendezési mező: **Név**, **Növekvő**
3. **Tovább**

### 5. lépés: Elrendezés

1. Elrendezés: **Lépcsőzetes** (Stepped)
2. Tájolás: **Álló** (Portrait)
3. **Tovább**

### 6. lépés: Cím és befejezés

1. Cím: `Kutatók intézmények szerint`
2. **Befejezés**

### 7. lépés: Eredmény

Most egy csoportosított jelentést látunk:

```
┌─────────────────────────────────────────────┐
│      Kutatók intézmények szerint            │
├─────────────────────────────────────────────┤
│                                              │
│ ELTE BTK                                     │  ← Csoport fejléc
│    Kovács Anna       kovacs.a@elte.hu   ☑   │
│    Tóth Katalin      toth.k@elte.hu     ☑   │
│                                              │
│ Független kutató                             │
│    Nagy Péter        nagy.p@gmail.com   ☑   │
│    Varga Éva         (nincs email)      ☐   │
│                                              │
│ PTE BTK                                      │
│    Szabó Mária       szabo.m@...        ☑   │
└─────────────────────────────────────────────┘
```

### 8. lépés: Mentés

- **Ctrl+S** → Név: `rpt_Kutatok_intezmeny_szerint`

## Összesítés jelentésekben

Csoportokon belül összesíthetünk is!

**Példa:** Hány kutató van intézményenként?

### 1. lépés: Tervezési nézet

1. Nyissuk meg: `rpt_Kutatok_intezmeny_szerint`
2. **Nézet** → **Tervezési nézet**

### 2. lépés: Csoportlábléc megjelenítése

1. Jobb egérgomb az **Intézmény fejléc** sávra
2. **Csoport tulajdonságai**
3. **Csoportlábléc** (Group Footer) → **Igen**
4. **OK**

Most megjelent egy új szakasz: **Intézmény lábléc**

### 3. lépés: Darabszám hozzáadása

1. **Tervezés** fül → **Vezérlők** csoport → **Szövegdoboz** (Text Box)
2. Rajzoljunk egy szövegdobozt az **Intézmény lábléc** szakaszba
3. A szövegdobozba írjuk: `=Count([KutatóID])`

Ez megszámolja, hány kutató van az adott csoportban (intézményben).

### 4. lépés: Címke hozzáadása

A szövegdoboz melletti címkét nevezzük át:

1. Dupla kattintás → Szerkesztési mód
2. Írjuk be: **Összesen:**

### 5. lépés: Formázás

Tegyük félkövérre:

- Címke és szövegdoboz kijelölése
- **Kezdőlap** → **Félkövér** (B)

### 6. lépés: Eredmény

**Nézet** → **Nyomtatási kép**

Most látjuk:

```
ELTE BTK
   Kovács Anna ...
   Tóth Katalin ...
   Összesen: 2

Független kutató
   Nagy Péter ...
   Varga Éva ...
   Összesen: 2

PTE BTK
   Szabó Mária ...
   Összesen: 1
```

## Exportálási lehetőségek

A jelentéseket különböző formátumokba exportálhatjuk:

### PDF exportálás

1. Jelentés megnyitása (Nyomtatási kép nézet)
2. **Adatok** fül → **PDF vagy XPS**
3. Hely, fájlnév megadása
4. **Közzététel**

### Word exportálás

1. **Külső adatok** fül → **Word** gomb
2. Fájlnév megadása
3. **OK**

> **Megjegyzés:** A Word exportálás nem tökéletes (formázás elveszhet), de szöveg szerkesztéshez használható.

### Excel exportálás

1. **Külső adatok** → **Excel**
2. Fájlnév
3. **OK**

> **Használat:** Ha a nyomtatott adatokat továbbra is elemezni, szűrni szeretnénk Excelben.

## Gyakorlati feladatok

### Feladat 1: Látogatások listája

Készítsünk egy egyszerű jelentést a `qry_Marciusi_latogatasok` lekérdezésből!

1. Jelentés automatikus generálása
2. Testre szabás: cím, dátum, oldalszám
3. Exportálás PDF-be
4. Mentés: `rpt_Marciusi_latogatasok`

### Feladat 2: ELTE-s kutatók

Készítsünk jelentést az ELTE-s kutatókról:

1. Használjuk a `qry_ELTE_latogatasok` lekérdezést
2. Csoportosítsuk kutatók szerint (Név)
3. Mindegyik kutató alatt legyenek a látogatásai
4. Mentés: `rpt_ELTE_kutatok_latogatasai`

### Feladat 3: Statisztikai összesítő

Készítsünk jelentést, amely intézményenként mutatja:

- Hány kutató van
- Hány látogatás volt összesen
