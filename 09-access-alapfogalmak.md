# Access alapfogalmak

## Bevezetés

Mielőtt elkezdenénk használni az Access-t, meg kell értenünk néhány alapfogalmat. Ezek azok a „építőkövek”, amelyekből minden Access adatbázis felépül.

## Az Access felülete

Amikor megnyitunk egy Access fájlt, a következő fő részeket látjuk:

### Menüszalag (Ribbon)

A képernyő tetején található, fülek szerint szervezve:

- **Fájl:** Mentés, megnyitás, nyomtatás
- **Kezdőlap:** Alapvető műveletek (nézetek váltása, keresés, rendezés)
- **Létrehozás:** Új tábla, lekérdezés, űrlap, jelentés készítése
- **Külső adatok:** Importálás, exportálás (pl. Excelből/be)
- **Adatbázis-eszközök:** Kapcsolatok, makrók, adatbázis-karbantartás

### Navigációs ablaktábla (bal oldalt)

Itt látjuk az adatbázis összes objektumát, kategóriák szerint:

- **Táblák** (Tables)
- **Lekérdezések** (Queries)
- **Űrlapok** (Forms)
- **Jelentések** (Reports)

### Munkaterület

A képernyő közepén, itt nyílnak meg a táblák, űrlapok stb.

> **Tipp:** Ha nem látjuk a navigációs ablaktáblát, nyomjuk meg az `F11` billentyűt!

## Az adatbázis felépítése: objektumok

Egy Access adatbázis (`.accdb` fájl) különböző **objektumokat** tartalmaz. A négy legfontosabb objektumtípus:

### Tábla (Table)

- **Ez maga az adat!** Minden más objektum a táblákban tárolt adatokkal dolgozik.
- Sorokból (rekordok) és oszlopokból (mezők) áll, mint egy Excel munkalap.
- **Példa:** `tbl_Kutatók` tábla, amely kutatókat tárol.

### Lekérdezés (Query)

- Adatok lekérdezése, szűrése, rendezése, csoportosítása.
- Nem tárol adatot, csak „kérdést tesz fel” a táblának.
- **Példa:** “Mutasd azokat a kutatókat, akik az ELTE-ről érkeztek!”

### Űrlap (Form)

- Szép, felhasználóbarát felület adatbevitelhez és módosításhoz.
- Mint egy papíralapú űrlap, de digitális.
- **Példa:** Kutatói regisztrációs űrlap.

### Jelentés (Report)

- Nyomtatható, formázott kimenet.
- **Példa:** Havi látogatottsági lista.

> **Fontos:** A **tábla** tartalmazza az adatokat. A többi objektum (lekérdezés, űrlap, jelentés) csak különböző módon **jeleníti meg** vagy **dolgozza fel** a táblákban tárolt adatokat.

## Táblák részletesen

A tábla az Access legfontosabb objektuma. Nézzük meg részletesen!

### Tábla = Excel munkalap?

Első ránézésre egy Access tábla úgy néz ki, mint egy Excel munkalap: sorok és oszlopok. **De van néhány fontos különbség:**

| Excel | Access tábla |
| --- | --- |
| Sorok = adatok | **Rekordok** = adatok |
| Oszlopok = bárhogy elnevezhetők | **Mezők** = pontosan definiált típussal |
| Cella = bármilyen típusú adat | Cella = csak a mező típusának megfelelő adat |
| Bárhová írhatunk | Minden sor ugyanazokból a mezőkből áll |

Részletezzük ezeket a különbségeket levéltári példákkal!

#### Sorok vs. Rekordok

**Excel-ben: Sorok = adatok** - Bárhol kezdődhet az adat (pl. az 5. sortól) - Lehetnek üres sorok közben - Lehet összesítő sor, megjegyzés sor - Nem kötelező kitölteni minden sort

**Access táblában: Rekordok = adatok** - Minden sor = 1 kutató/irat/látogatás - Nincs üres sor (nem lehet) - Minden rekord egyenértékű - Nincs “összesítő rekord” (azt lekérdezés csinálja)

**Levéltári példa - Excel (megengedett, de nem ideális):**

```
     A           B              C
1    KUTATÓK NYILVÁNTARTÁSA
2    
3    Név         Email          Intézmény
4    Kovács A.   k@elte.hu      ELTE
5    
6    Nagy P.     n@pte.hu       PTE
7    ═══════════════════════════════════
8    Összesen: 2 kutató
```

**Access-ben ez NEM megengedett!** Csak:

```
Rekord 1: Kovács A. | k@elte.hu | ELTE
Rekord 2: Nagy P.   | n@pte.hu  | PTE
```

Az “Összesen: 2 kutató” számítást lekérdezéssel végezzük: `SELECT COUNT(*) FROM tbl_Kutatók`

#### Oszlopok vs. Mezők

**Excel-ben: Oszlopok = bárhogy elnevezhetők** - Az oszlop neve lehet bármi - Nem kötelező fejléc - Lehet összevont cella, több soros fejléc

**Access táblában: Mezők = pontosan definiált** - Mező név: alfanumerikus, \_ megengedett - MINDEN mezőnek van **adattípusa** - Kötelező mezőnév - Egy fejléc, egy jelentés

**Levéltári példa - Rossz Excel gyakorlat:**

```
      A                    B           C
1     ┌──────────────┐
2     │  K U T A T Ó │     Email      Intézmény
3     └──────────────┘
4     Kovács Anna         k@elte.hu   ELTE BTK
```

**Access-ben szigorúan:**

```
Mező: Név (Rövid szöveg, max 100 karakter)
Mező: Email (Rövid szöveg, max 100 karakter)  
Mező: Intézmény (Rövid szöveg, max 100 karakter)
```

#### Cella adattípusa - A LEGFONTOSABB KÜLÖNBSÉG!

**Excel-ben: Cella = bármilyen típus**

Ugyanabban az oszlopban lehet szám, szöveg, dátum, akár vegyesen!

**Levéltári példa - Excel (ROSSZ, de megengedett):**

```
     A          B               C
1    Név        Látogatások     Aktív
2    Kovács A.  2024.01.15      IGEN
3    Nagy P.    3               NEM
4    Tóth B.    sokszor volt    1
```

Látjuk a problémát? A “Látogatások” oszlopban: - 1. sor: dátum - 2. sor: szám  
- 3. sor: szöveg

**Access-ben ez ELKÉPZELHETETLEN!**

```
Mező: Név (Rövid szöveg)
Mező: LátogatásokSzáma (Szám - Long Integer) ← MINDIG szám!
Mező: Aktív (Igen/Nem) ← MINDIG logikai érték!
```

Ha megpróbálunk betűt írni a “LátogatásokSzáma” mezőbe → **HIBAÜZENET**! ❌

**Miért jó ez?** Mert így az Access tudja:

- Rendezni a számokat numerikusan (1, 2, 10 helyett 1, 10, 2)
- Dátumokat időrendi sorrendbe rakni
- Ellenőrizni, hogy érvényes-e az adat (pl. február nincs 31 napja)
- Megakadályozni a hibás adatbevitelt

#### Szerkezeti szigor

**Excel-ben: Bárhová írhatunk**

```
     A          B          C         D
1    Kutatók
2    
3    Név        Email               Intézmény
4    Kovács A.  k@elte.hu           ELTE
5    
6              Nagy P.     n@pte.hu         PTE  ← eltolt!
7    
8    Megjegyzés: Nagy Péter gyakran jár
```

**Access-ben: Minden sor UGYANAZOKBÓL a mezőkből áll**

```
┌──────────┬───────────┬───────────┐
│ Név      │ Email     │ Intézmény │ ← MINDIG ez a 3 mező
├──────────┼───────────┼───────────┤
│ Kovács A.│ k@elte.hu │ ELTE      │ ← 3 mező
│ Nagy P.  │ n@pte.hu  │ PTE       │ ← 3 mező
│ Tóth B.  │ t@bme.hu  │ BME       │ ← 3 mező
└──────────┴───────────┴───────────┘
```

**Nem lehet:**

- Eltolt mező
- Extra mező egy rekordban
- Hiányzó mező (üres lehet a cellája, de a mezőnek léteznie kell!)
- Megjegyzés sor (ezt külön Megjegyzés **mezőbe** írjuk)

**Gyakori kezdő hiba:** Excel-ből való áttéréskor sokan próbálnak “megjegyzés sorokat” vagy “összesítő sorokat” hozzáadni. Access-ben ezt **NEM** tehetjük meg! Használjunk helyette:

- **Megjegyzés mező** (Long Text típus) a táblában
- **Lekérdezés** az összesítéshez (COUNT, SUM stb.)

#### Miért jó mindez a levéltári munkában?

**1. Adatintegritás**

Excel-ben könnyen elírhatjuk a dátumot:

```
LátogatásDátuma oszlop:
- 2024.01.15
- 15/01/2024
- január 15
- múlt hét  ← !!! EZ PROBLÉMÁS
```

Access-ben:

```
LátogatásDátuma (Dátum/Idő mező):
- CSAK érvényes dátum lehet
- Egységes formátum
- "múlt hét" → HIBAÜZENET!
```

**2. Pontos lekérdezések**

Excel: “Hány kutató látogatott január első két hetében?” → Végig kell nézni, figyelni az eltérő formátumokra, számolgatni

Access:

```
SELECT COUNT(*) 
FROM tbl_Látogatások
WHERE LátogatásDátuma BETWEEN #01/01/2024# AND #14/01/2024#
```

→ Egy kattintás, pontos eredmény!

**3. Hibamegelőzés**

Excel: Véletlenül felülírhatjuk a szomszéd cellát

```
     A          B
1    Kovács A.  k@elte.hu
2    Nagy P.    ELTE      ← !!! Ez email mező kellett volna!
```

Access: Nem keverhetjük össze, mert:

- Minden mező külön, névvel ellátott
- Az űrlapon külön dobozban jelenik meg
- Nem lehet “véletlenül” másik mezőbe írni

### Példa: Kutatók táblája

Nézzünk egy konkrét példát! Tegyük fel, hogy kutatókat tartunk nyilván:

```
┌────────┬─────────────────┬──────────────────────┬──────────────────────┬──────────────┐
│ KutatóID│ Név            │ Email                │ Intézmény           │ RegDátum     │
├────────┼─────────────────┼──────────────────────┼──────────────────────┼──────────────┤
│   1    │ Kovács Anna    │ kovacs.a@elte.hu     │ ELTE BTK            │ 2024.01.15   │
│   2    │ Nagy Péter     │ nagy.p@gmail.com     │ Független kutató    │ 2024.01.20   │
│   3    │ Szabó Mária    │ szabo.m@uni-pecs.hu  │ PTE BTK             │ 2024.02.03   │
└────────┴─────────────────┴──────────────────────┴──────────────────────┴──────────────┘
```

Ebben a táblában:

- **3 rekord** van (3 kutató)
- **5 mező** van (KutatóID, Név, Email, Intézmény, RegDátum)

## Alapfogalmak részletesen

### Mező (Field)

A **mező** egy oszlop a táblában. Minden mezőnek van:

- **Mezőneve:** pl. `Név`, `Email`
- **Adattípusa:** milyen típusú adatot tárolhat (szöveg, szám, dátum stb.)
- **Tulajdonságai:** pl. kötelező-e kitölteni, milyen hosszú lehet

> **Fontos:** Egy mezőben **csak** egy típusú adat szerepelhet. Ha a `RegDátum` mező dátum típusú, akkor nem írhatunk bele szöveget!

### Rekord (Record)

A **rekord** egy sor a táblában. Egy rekord **egy entitást** (pl. egy kutatót, egy iratot) képvisel, és tartalmazza az összes hozzá tartozó mezőt.

**Példa:** Kovács Anna adatai alkotnak egy rekordot: - KutatóID: 1 - Név: Kovács Anna  
- Email: [kovacs.a@elte.hu](mailto:kovacs.a@elte.hu) - Intézmény: ELTE BTK - RegDátum: 2024.01.15

### Elsődleges kulcs (Primary Key)

Az **elsődleges kulcs** (röviden: **PK**) egy speciális mező, amely:

- **Egyedileg azonosít** minden rekordot
- **Nem lehet üres** (mindig ki kell tölteni)
- **Nem lehet ismétlődő** (két rekordnak nem lehet ugyanaz az elsődleges kulcsa)

**Miért kell?**

Képzeljük el, hogy van két Kovács Anna kutatónk. Hogyan különböztessük meg őket? A név, email, intézmény mind változhat. De a `KutatóID` egyedi marad!

```
┌────────┬─────────────────┬──────────────────────┐
│ KutatóID│ Név            │ Email                │
├────────┼─────────────────┼──────────────────────┤
│   1    │ Kovács Anna    │ kovacs.a@elte.hu     │  ← Ez az 1-es Kovács Anna
│   2    │ Nagy Péter     │ nagy.p@gmail.com     │
│   3    │ Kovács Anna    │ anna.k@gmail.com     │  ← Ez a 3-as Kovács Anna
└────────┴─────────────────┴──────────────────────┘
```

> **Jó gyakorlat:** Az elsődleges kulcsot érdemes **AutoNumber** típusúvá tenni, így automatikusan generálódik (1, 2, 3, …), és nem kell törődnünk vele.

## Adattípusok

Amikor létrehozunk egy mezőt, meg kell adnunk az **adattípusát**. Az Access így tudja, milyen adatot várunk, és milyen műveleteket lehet rajta végezni.

### Legfontosabb adattípusok

| Adattípus | Magyar név | Mire használjuk? | Példa | Maximum méret |
| --- | --- | --- | --- | --- |
| **Short Text** | Rövid szöveg | Nevek, címek, rövid szövegek | “Kovács Anna” | 255 karakter |
| **Long Text** | Hosszú szöveg | Megjegyzések, leírások | “A kutató a Rákóczi-szabadságharc…” | ~1 GB |
| **Number** | Szám | Mennyiségek, számok | 42 | Típustól függ |
| **Date/Time** | Dátum/idő | Dátumok, időpontok | 2024.01.15 | - |
| **Currency** | Pénznem | Pénzösszegek | 1500 Ft | - |
| **Yes/No** | Igen/Nem | Logikai értékek | ✓ vagy ✗ | - |
| **AutoNumber** | Automatikus számozás | Elsődleges kulcs | 1, 2, 3… | - |

### Részletes leírások

#### Short Text (Rövid szöveg)

- **Használat:** Nevek, címek, email, telefonszám, stb.
- **Maximum:** 255 karakter
- **Példák levéltári használatra:**
  - Kutató neve
  - Email cím
  - Intézmény neve
  - Irat címe (ha rövid)

> **Tipp:** Ha biztosak vagyunk, hogy egy szöveg nem lesz hosszabb 255 karakternél, válasszuk ezt. Gyorsabb, mint a Long Text.

#### Long Text (Hosszú szöveg)

- **Használat:** Hosszabb szövegek, megjegyzések, leírások
- **Maximum:** Kb. 1 GB (gyakorlatban ~65,535 karakter)
- **Példák levéltári használatra:**
  - Kutatási téma részletes leírása
  - Fond történetének leírása
  - Megjegyzések egy iratról

> **Figyelem:** Long Text mezőn nehezebb keresni és rendezni!

#### Number (Szám)

- **Használat:** Számok, mennyiségek (NE pénzösszegek!)
- **Altípusok:**
  - **Byte:** 0-255 (pl. életkor)
  - **Integer:** -32,768 – 32,767
  - **Long Integer:** Kb. -2 milliárd – +2 milliárd (alapértelmezett)
  - **Double:** Tizedesjegyek
- **Példák levéltári használatra:**
  - Iratok száma egy dobozban
  - Oldalszám
  - Látogatások száma

> **Figyelem:** Telefonszám NE legyen Number típusú! (Nem számolunk vele, és van benne `/`, `-`, `+` jel.) Legyen Short Text!

#### Date/Time (Dátum/idő)

- **Használat:** Dátumok, időpontok
- **Formátumok:**
  - Rövid dátum: 2024.01.15
  - Hosszú dátum: 2024. január 15.
  - Idő: 14:30
  - Dátum+idő: 2024.01.15 14:30
- **Példák levéltári használatra:**
  - Regisztráció dátuma
  - Látogatás időpontja
  - Digitalizálás dátuma
  - Irat keletkezési éve (ha pontos dátum)

> **Tipp:** Az Access automatikusan ellenőrzi, hogy valódi dátumot adtunk-e meg. “2024.02.31” hibát dob (február nincs 31 napja)!

#### Yes/No (Igen/Nem)

- **Használat:** Logikai értékek, amelyek csak IGAZ vagy HAMIS értéket vehetnek fel
- **Megjelenés:** ☑ / ☐ (jelölőnégyzet)
- **Példák levéltári használatra:**
  - Aktív kutató? (igen/nem)
  - Digitalizálva? (igen/nem)
  - Törölve? (igen/nem)
  - Publikálható? (igen/nem)

> **Tipp:** Ha egy kérdésre csak “igen” vagy “nem” válasz lehetséges, használjuk ezt a típust!

#### AutoNumber (Automatikus számozás)

- **Használat:** Elsődleges kulcs (ID mező)
- **Működés:** Automatikusan generál egyedi számokat: 1, 2, 3, 4…
- **Fontos:**
  - Nem módosítható kézzel
  - Ha törlünk egy rekordot, az AutoNumber “kihagyódik” (nem használja újra)
- **Példák levéltári használatra:**
  - KutatóID
  - IratID
  - LátogatásID

> **Fontos:** Az AutoNumber célja az **egyediség**, nem az, hogy “szép sorrendben” legyenek a számok. Ha törlünk rekordokat, lyukak maradnak a számsorban!

## Példa: Táblaterv elkészítése

Tervezzük meg papíron (vagy elméletben) a `tbl_Kutatók` táblát!

### 1. lépés: Milyen adatokat akarunk tárolni?

- Kutató neve
- Email címe
- Intézménye (ahonnan érkezett)
- Regisztráció dátuma
- Aktív-e még a kutató?

### 2. lépés: Mezők definiálása

| Mezőnév | Adattípus | Méret/Formátum | Kötelező? | Megjegyzés |
| --- | --- | --- | --- | --- |
| KutatóID | AutoNumber | - | ✓ | Elsődleges kulcs |
| Név | Short Text | 100 | ✓ | Teljes név |
| Email | Short Text | 100 | ✓ | Email cím |
| Intézmény | Short Text | 150 | ✗ | Munkahely/egyetem |
| RegDátum | Date/Time | Rövid dátum | ✓ | Regisztráció napja |
| Aktív | Yes/No | - | ✓ | Jelenleg aktív? |

### 3. lépés: Elsődleges kulcs kiválasztása

- **KutatóID** lesz az elsődleges kulcs
- AutoNumber típus → automatikusan növekszik
- Minden kutató egyedi azonosítót kap
