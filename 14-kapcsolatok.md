# Kapcsolatok: Második tábla létrehozása

## Bevezetés

Eddig egy táblával dolgoztunk: `tbl_Kutatók`. De a valódi erejét az Access akkor mutatja meg, amikor **több táblát kapcsolunk össze**.

Ebben a fejezetben:

1. Létrehozunk egy második táblát: `tbl_Látogatások`
2. Összekapcsoljuk a két táblát
3. Megértjük a **kapcsolatok** fogalmát

## Miért kell több tábla?

### A probléma: Ismétlődő adatok

Képzeljük el, hogy **egy táblában** szeretnénk tárolni a kutatókat ÉS a látogatásaikat:

```
┌────────┬────────────┬───────────────┬──────────────┬────────────────┐
│ Név    │ Email      │ Intézmény     │ LatDátum     │ CélKutatás     │
├────────┼────────────┼───────────────┼──────────────┼────────────────┤
│ Kovács │ kovacs.a@  │ ELTE BTK      │ 2024.03.10   │ Rákóczi        │
│ Anna   │ elte.hu    │               │              │                │
├────────┼────────────┼───────────────┼──────────────┼────────────────┤
│ Kovács │ kovacs.a@  │ ELTE BTK      │ 2024.03.15   │ Rákóczi        │
│ Anna   │ elte.hu    │               │              │                │
├────────┼────────────┼───────────────┼──────────────┼────────────────┤
│ Kovács │ kovacs.a@  │ ELTE BTK      │ 2024.04.02   │ Rákóczi        │
│ Anna   │ elte.hu    │               │              │                │
├────────┼────────────┼───────────────┼──────────────┼────────────────┤
│ Nagy   │ nagy.p@    │ MNL OL        │ 2024.03.12   │ színháztört.   │
│ Péter  │ gmail.com  │               │              │                │
└────────┴────────────┴───────────────┴──────────────┴────────────────┘
```

**Problémák:**

Kovács Anna neve, emailje, intézménye **háromszor** ismétlődik  
Ha Kovács Anna emailt vált, **három helyen** kell módosítani  
Elgépelés veszélye: “ELTE BTK” vs “ELTE BTk” vs “Elte BTK”  
Rengeteg felesleges adat tárolása

### A megoldás: Két tábla + kapcsolat

**1. tábla:** `tbl_Kutatók` – minden kutató egyszer szerepel

```
┌────────┬────────────┬───────────────┬──────────────┐
│KutatóID│ Név        │ Email         │ Intézmény    │
├────────┼────────────┼───────────────┼──────────────┤
│   1    │ Kovács Anna│ kovacs.a@...  │ ELTE BTK     │
│   2    │ Nagy Péter │ nagy.p@...    │ MNL OL       │
└────────┴────────────┴───────────────┴──────────────┘
```

**2. tábla:** `tbl_Látogatások` – látogatások

```
┌───────────┬─────────┬────────────┬─────────────────┐
│ LatID     │KutatóID │ LatDátum   │ CélKutatás      │
├───────────┼─────────┼────────────┼─────────────────┤
│     1     │    1    │ 2024.03.10 │ Kádár-kor       │
│     2     │    1    │ 2024.03.15 │ Kádár-kor       │
│     3     │    1    │ 2024.04.02 │ Kádár-kor       │
│     4     │    2    │ 2024.03.12 │ színháztörténet │
└───────────┴─────────┴────────────┴─────────────────┘
```

**Kapcsolat:** A `KutatóID` összeköti a két táblát!

Kovács Anna adatai **egyszer** szerepelnek  
Email módosítás **egy helyen**  
Nincs elgépelés veszély  
Hatékony adattárolás

## Kapcsolat típusok

Mielőtt létrehoznánk a második táblát, értsük meg a kapcsolat típusokat!

### Egy-a-többhöz kapcsolat (1:N)

A leggyakoribb kapcsolat típus. **Egy** rekord az egyik táblában **több** rekordhoz kapcsolódhat a másik táblában.

**Példák:**

- **Egy** kutató → **Több** látogatás
- **Egy** fond → **Több** állag
- **Egy** állag → **Több** irat

**Jelölés:**

```
Kutatók (1) ─────< Látogatások (N)
```

A “∞” vagy “<” jel jelzi a “több” oldalt.

**Hogyan működik?**

- A `tbl_Kutatók` táblában minden kutató **egyszer** szerepel (KutatóID = 1, 2, 3, …)
- A `tbl_Látogatások` táblában **több sor** is hivatkozhat ugyanarra a kutatóra (KutatóID = 1, 1, 1, 2, …)

### Több-a-többhöz kapcsolat (N:M)

Ritkább, de előfordul. **Több** rekord az egyik táblában **több** rekordhoz kapcsolódhat a másik táblában.

**Példa:**

- **Több** kutató dolgozhat **több** kutatási projekten
- **Több** iratot **több** témakörbe sorolhatunk

**Megvalósítás:** Egy köztes táblával (ezt majd a haladó kurzuson tanuljuk).

### Egy-az-egyhez kapcsolat (1:1)

Nagyon ritka. **Egy** rekord az egyik táblában **pontosan egy** rekordhoz kapcsolódik a másik táblában.

**Példa:** Személy tábla és Útlevél tábla (egy személynek egy útlevele van).

> **Most:** Az **egy-a-többhöz** (1:N) kapcsolattal fogunk dolgozni!

## A `tbl_Látogatások` tábla megtervezése

Tervezzük meg a második táblánkat!

### Milyen adatokat akarunk tárolni?

Egy látogatásról a következőket:

- **Ki** jött? (melyik kutató)
- **Mikor** jött?
- **Miért** jött? (kutatási téma)
- **Megjegyzések** (opcionális)

### Mezők definiálása

| Mezőnév | Adattípus | Méret | Kötelező | Leírás |
| --- | --- | --- | --- | --- |
| LatID | AutoNumber | - | ✓ | Egyedi azonosító (PK) |
| KutatóID | Number (Long Integer) | - | ✓ | Ki jött? (FK) |
| LatDátum | Date/Time | - | ✓ | Mikor jött? |
| CélKutatás | Short Text | 200 | ✗ | Kutatási téma |
| Megjegyzés | Long Text | - | ✗ | További jegyzetek |

**Fontos:**

- **LatID:** Elsődleges kulcs (Primary Key = PK)
- **KutatóID:** **Idegen kulcs** (Foreign Key = FK) – ez kapcsolja össze a két táblát!

> **Idegen kulcs (Foreign Key):** Egy mező, amely egy **másik tábla** elsődleges kulcsára hivatkozik.

## A `tbl_Látogatások` tábla létrehozása

Most hozzuk létre a táblát!

### 1. lépés: Új tábla létrehozása

1. **Létrehozás** fül → **Táblatervezés** gomb
2. Megnyílik az üres táblatervező

### 2. lépés: Mezők definiálása

#### LatID mező

1. **Mezőnév:** `LatID`
2. **Adattípus:** `AutoNumber`
3. **Leírás:** `Látogatás egyedi azonosítója`
4. Kattintsunk a sor bal szélére → Jobb egér → **Elsődleges kulcs** (vagy 🔑 gomb)

#### KutatóID mező

**Ez a kulcsmező, amely összeköti a két táblát!**

1. **Mezőnév:** `KutatóID`
2. **Adattípus:** `Number` (szám)
3. **Leírás:** `Melyik kutató látogatott?`

**Tulajdonságok (alsó panel):**

- **Mező mérete** (Field Size) → `Long Integer` (hosszú egész)
- **Kötelező** (Required) → `Igen`

> **Fontos:** A `KutatóID` típusa **Number (Long Integer)** legyen, mert a `tbl_Kutatók` táblában a `KutatóID` AutoNumber típusú, ami Long Integer.

#### LatDátum mező

1. **Mezőnév:** `LatDátum`
2. **Adattípus:** `Date/Time`
3. **Leírás:** `Látogatás dátuma`

**Tulajdonságok:**

- **Formátum:** `Rövid dátum`
- **Kötelező:** `Igen`
- **Alapértelmezett érték:** `=Date()` (mai dátum)

#### CélKutatás mező

1. **Mezőnév:** `CélKutatás`
2. **Adattípus:** `Short Text`
3. **Leírás:** `Kutatási téma`

**Tulajdonságok:**

- **Mező mérete:** `200`
- **Kötelező:** `Nem`

#### Megjegyzés mező

1. **Mezőnév:** `Megjegyzés`
2. **Adattípus:** `Long Text`
3. **Leírás:** `További jegyzetek`

**Tulajdonságok:**

- **Kötelező:** `Nem`

### 3. lépés: Tábla mentése

1. **Ctrl+S**
2. Név: `tbl_Látogatások`
3. **OK**

## Kapcsolat létrehozása a két tábla között

Most összekapcsoljuk a `tbl_Kutatók` és `tbl_Látogatások` táblákat!

### 1. lépés: Kapcsolatok ablak megnyitása

1. **Adatbázis-eszközök** fül → **Kapcsolatok** gomb

Megnyílik a **Kapcsolatok** ablak. Ez valószínűleg üres (még nincs kapcsolat).

### 2. lépés: Táblák hozzáadása

Ha nem látjuk a táblákat, adjuk hozzá őket:

1. **Tervezés** fül (a Kapcsolatok ablakban) → **Tábla megjelenítése** gomb

**Vagy:**

- Jobb egérgomb a Kapcsolatok ablak üres területén → **Tábla megjelenítése**

2. Megjelenik a “Tábla megjelenítése” ablak
3. Válasszuk ki: `tbl_Kutatók` → **Hozzáadás**
4. Válasszuk ki: `tbl_Látogatások` → **Hozzáadás**
5. **Bezárás**

Most két kis ablakot látunk a Kapcsolatok nézetben:

```
┌─────────────────┐       ┌──────────────────┐
│ tbl_Kutatók     │       │ tbl_Látogatások  │
├─────────────────┤       ├──────────────────┤
│🔑KutatóID       │       │🔑LatID           │
│ Név             │       │ KutatóID         │
│ Email           │       │ LatDátum         │
│ Intézmény       │       │ CélKutatás       │
│ RegDátum        │       │ Megjegyzés       │
│ Aktív           │       │                  │
└─────────────────┘       └──────────────────┘
```

### 3. lépés: Kapcsolat létrehozása

Most húzással hozzuk létre a kapcsolatot:

1. Kattintsunk a `tbl_Kutatók` táblában a `KutatóID` mezőre
2. **Tartsuk lenyomva az egeret**, és húzzuk át a `tbl_Látogatások` táblában a `KutatóID` mezőre
3. Engedjük el az egeret

Megjelenik a **Kapcsolatok szerkesztése** ablak!

### 4. lépés: Kapcsolat beállítása

A **Kapcsolatok szerkesztése** ablakban látjuk:

- **Tábla/lekérdezés:** `tbl_Kutatók`
- **Kapcsolódó tábla/lekérdezés:** `tbl_Látogatások`
- **KutatóID** ↔︎ **KutatóID**

Alul három jelölőnégyzet:

1. ☑ **Referenciális integritás érvényesítése** (Enforce Referential Integrity)
2. **Lépcsőzetes frissítés a kapcsolódó mezőkben** (Cascade Update Related Fields)
3. **Lépcsőzetes törlés a kapcsolódó rekordokban** (Cascade Delete Related Records)

**Mit jelöljünk be?**

**Referenciális integritás** – MINDIG jelöljük be!  
**Lépcsőzetes frissítés** – Jelöljük be (biztonságos)  
**Lépcsőzetes törlés** – NE jelöljük be levéltári kontextusban!

#### Mit jelentenek ezek?

**Referenciális integritás:**

- Biztosítja, hogy **érvényes** kapcsolat legyen
- Nem lehet olyan látogatást felvenni, amelynek KutatóID-ja nem létezik a Kutatók táblában
- Nem lehet törölni kutatót, amíg vannak hozzá kapcsolódó látogatások

**Lépcsőzetes frissítés:**

- Ha módosítjuk egy kutató ID-ját (ritkán fordul elő), akkor a Látogatások táblában is automatikusan frissül

**Lépcsőzetes törlés:**

- Ha törlünk egy kutatót, **automatikusan törlődnek** az összes látogatása is
- \*\* Nem akarjuk véletlenül törölni a látogatási nyilvántartást!

### 5. lépés: Kapcsolat létrehozása

1. Jelöljük be: ☑ **Referenciális integritás**
2. Jelöljük be: ☑ **Lépcsőzetes frissítés**
3. Kattintsunk: **Létrehozás**

Most a Kapcsolatok nézetben látunk egy **vonalat** a két tábla között:

```
┌─────────────────┐       ┌──────────────────┐
│ tbl_Kutatók     │       │ tbl_Látogatások  │
├─────────────────┤       ├──────────────────┤
│🔑KutatóID ───────1────<∞─ KutatóID         │
│ Név             │       │ LatDátum         │
│ Email           │       │ CélKutatás       │
└─────────────────┘       └──────────────────┘
```

A vonal két végén:

- **1** – Egy-a-többhöz kapcsolat “egy” oldala (Kutatók)
- **∞** – “Több” oldala (Látogatások)

> **Ez jelenti:** Egy kutatónak több látogatása lehet!

### 6. lépés: Kapcsolatok ablak bezárása

1. Zárjuk be a Kapcsolatok ablakot (✕)
2. Ha kérdezi, hogy mentse-e az elrendezést: **Igen**

## Adatok felvétele a Látogatások táblába

Most vigyünk fel néhány látogatást!

### 1. lépés: Látogatások tábla megnyitása

1. Dupla kattintás a `tbl_Látogatások` táblára (Navigációs panel)
2. Adatlap nézet nyílik meg

### 2. lépés: Első látogatás felvétele

Vigyük fel Kovács Anna első látogatását:

1. **LatID:** (automatikusan 1 lesz)
2. **KutatóID:** `1` (Kovács Anna ID-ja)
3. **LatDátum:** `2024-03-10`
4. **CélKutatás:** `Rákóczi-szabadságharc levéltári forrásai`
5. **Megjegyzés:** (hagyjuk üresen)
6. **Enter**

### 3. lépés: További látogatások

Vigyünk fel még néhány látogatást:

- **LatID:** 2 | **KutatóID:** 1 | **LatDátum:** 2024-03-15 | **CélKutatás:** Rákóczi-szabadságharc
- **LatID:** 3 | **KutatóID:** 1 | **LatDátum:** 2024-04-02 | **CélKutatás:** Rákóczi-szabadságharc
- **LatID:** 4 | **KutatóID:** 2 | **LatDátum:** 2024-03-12 | **CélKutatás:** Magyar színháztörténet 1945-1970
- **LatID:** 5 | **KutatóID:** 3 | **LatDátum:** 2024-02-28 | **CélKutatás:** Barokk építészet Pécsett

> **Figyelem:** A KutatóID-kat kézzel kell begépelni. Később megtanuljuk, hogyan lehet ezt egyszerűbbé tenni (kombinált lista).

### 4. lépés: Referenciális integritás tesztelése

Próbáljunk meg érvénytelen adatot felvinni!

1. Új sor
2. **KutatóID:** `999` (ez nem létezik a Kutatók táblában!)
3. **LatDátum:** mai dátum
4. **Enter**

**Hibaüzenet:** “Nem adhat hozzá vagy módosíthat rekordot, mert kapcsolódó rekord szükséges a tbl\_Kutatók táblában.”

Ez pontosan a referenciális integritás működése!

> **Ez védi az adatainkat** attól, hogy érvénytelen kapcsolatokat hozzunk létre.

### 5. lépés: Kombinált lista (Combo Box) készítése

Unalmas begépelni a KutatóID-kat. Csináljunk belőle legördülő listát!

#### Tervezési nézetre váltás

1. Zárjuk be a `tbl_Látogatások` táblát
2. Jobb egérgomb → **Tervezési nézet**

#### KutatóID mező módosítása

1. Kattintsunk a `KutatóID` mezőre
2. Az alsó panelen keressük meg: **Keresés** fül (Lookup tab)
3. **Vezérlő megjelenítése** (Display Control) → Válasszuk: **Kombinált lista** (Combo Box)

#### Sor forrása beállítása

Most adjuk meg, honnan töltse fel a listát:

4. **Sor típusa** (Row Source Type) → `Tábla/lekérdezés`
5. **Sor forrása** (Row Source) → Kattintsunk a `...` gombra

Megjelenik a Lekérdezés-készítő.

6. Válasszuk ki a `tbl_Kutatók` táblát
7. Húzzuk be a mezőket:
   - `KutatóID`
   - `Név`
   - `Intézmény`
8. **Bezárás** (✕) → **Igen** (mentés)

#### További beállítások

9. **Oszlopok száma** (Column Count) → `3`
10. **Kötött oszlop** (Bound Column) → `1` (a KutatóID-t tárolja)
11. **Oszlopszélességek** (Column Widths) → `0cm;4cm;4cm`

> **Mit jelent ez?**
> - **Oszlopszélességek:** Az első oszlop (KutatóID) 0 cm → rejtett, a Név és Intézmény látszik

#### Mentés és tesztelés

12. **Ctrl+S** (mentés)
13. Váltunk **Adatlap nézetre**

Most a `KutatóID` oszlopban egy legördülő lista van! 🎉

Kattintsunk rá → Látjuk a kutatók nevét és intézményét, de a rendszer az ID-t tárolja!

```
KutatóID         ▼
┌────────────────────────────────┐
│ Kovács Anna    ELTE BTK        │
│ Nagy Péter     ML OL           │
│ Szabó Mária    PTE BTK         │
└────────────────────────────────┘
```
