# Lekérdezések: Adatok szűrése és elemzése

## Bevezetés

Most, hogy két táblánk van (Kutatók és Látogatások), és össze vannak kapcsolva, tanuljuk meg, hogyan **kérdezzük le** az adatokat!

A **lekérdezés** (query) egy olyan eszköz, amely:

- Adatokat szűr (pl. “csak az ELTE-s kutatók”)
- Adatokat rendez (pl. “dátum szerint növekvő sorrendben”)
- Adatokat csoportosít (pl. “hány látogatás volt havonta”)
- Több táblából egyesít adatokat

> **Fontos:** A lekérdezés **nem** tárol adatokat! Csak “kérdést tesz fel” a tábláknak, és megjeleníti az eredményt.

## Egyszerű lekérdezés: Ki látogatott márciusban?

Kezdjünk egy egyszerű példával!

### 1. lépés: Lekérdezés-készítő indítása

1. **Létrehozás** fül → **Lekérdezéstervezés** gomb

Megjelenik a **Lekérdezés-készítő** ablak, felül a **Tábla megjelenítése** ablak.

### 2. lépés: Táblák kiválasztása

Mely táblákból szeretnénk adatokat?

- Kell a **Látogatások** tábla (dátum, téma)
- Kell a **Kutatók** tábla is (név, intézmény)

1. **Tábla megjelenítése** ablakban:
   - Dupla kattintás: `tbl_Kutatók`
   - Dupla kattintás: `tbl_Látogatások`
2. **Bezárás**

Most látjuk a két táblát az ablak felső részében, egy vonallal összekötve (a kapcsolat!):

```
┌─────────────────┐       ┌──────────────────┐
│ tbl_Kutatók     │       │ tbl_Látogatások  │
├─────────────────┤       ├──────────────────┤
│🔑KutatóID ───────1────<∞─ KutatóID         │
│ Név             │       │ LatDátum         │
│ Email           │       │ CélKutatás       │
│ Intézmény       │       │ Megjegyzés       │
└─────────────────┘       └──────────────────┘
```

### 3. lépés: Mezők kiválasztása

Alsó részben egy rácsos táblázat látható. Ide húzzuk be a mezőket, amelyeket meg szeretnénk jeleníteni:

#### Név mező

1. Húzzuk a `tbl_Kutatók` táblából a `Név` mezőt lefelé a rács első oszlopába

**Vagy:**

1. Dupla kattintás a `Név` mezőre → automatikusan bekerül a rácsba

#### További mezők

Ugyanígy adjuk hozzá:

- `Intézmény` (tbl\_Kutatók)
- `LatDátum` (tbl\_Látogatások)
- `CélKutatás` (tbl\_Látogatások)

A rács most így néz ki:

```
┌─────────┬───────────┬──────────┬────────────┐
│ Mező:   │ Név       │ Intézmény│ LatDátum   │ CélKutatás │
├─────────┼───────────┼──────────┼────────────┤
│ Tábla:  │tbl_Kutatók│tbl_Kutatók│tbl_Látogatások│tbl_Látogatások│
│ Rendezés│           │          │            │            │
│ Megj.:  │     ☑     │     ☑    │     ☑      │     ☑      │
│ Feltétel│           │          │            │            │
└─────────┴───────────┴──────────┴────────────┘
```

**Sorok jelentése:**

- **Mező:** Melyik mezőt jelenítjük meg
- **Tábla:** Melyik táblából származik
- **Rendezés:** Növekvő/csökkenő sorrend
- **Megjelenítés:** Megjelenik-e az eredményben (☑ = igen)
- **Feltétel:** Szűrési feltétel

### 4. lépés: Szűrési feltétel megadása

Most állítsuk be, hogy **csak a márciusi látogatásokat** szeretnénk látni!

1. Kattintsunk a `LatDátum` oszlop **Feltétel** sorába
2. Írjuk be: `Between #2024-03-01# And #2024-03-31#`

> **Dátumok Access-ben:** Dátumokat `#` jelek közé írunk! Pl. `#2024-03-15#`

**Más szűrési lehetőségek:**

- Pontosan 2024. március 10.: `#2024-03-10#`
- Március 1-től kezdve: `>=#2024-03-01#`
- Március 31-ig: `<=#2024-03-31#`

### 5. lépés: Rendezés beállítása

Rendezzük a találatokat dátum szerint növekvő sorrendben:

1. Kattintsunk a `LatDátum` oszlop **Rendezés** sorába
2. Válasszuk: **Növekvő** (Ascending)

### 6. lépés: Lekérdezés futtatása

Nézzük meg az eredményt!

1. **Tervezés** fül → **Futtatás** gomb (piros felkiáltójel !)

**Vagy:**

- **Nézet** gomb → **Adatlap nézet**

Most látjuk az eredményt:

```
┌────────────────┬──────────────┬────────────┬───────────────────────┐
│ Név            │ Intézmény    │ LatDátum   │ CélKutatás            │
├────────────────┼──────────────┼────────────┼───────────────────────┤
│ Kovács Anna    │ ELTE BTK     │ 2024.03.10 │ Rákóczi-szabadságharc │
│ Nagy Péter     │ Független    │ 2024.03.12 │ Színháztörténet       │
│ Kovács Anna    │ ELTE BTK     │ 2024.03.15 │ Rákóczi-szabadságharc │
└────────────────┴──────────────┴────────────┴───────────────────────┘
```

Látjuk, hogy márciusban 3 látogatás volt!

### 7. lépés: Lekérdezés mentése

Mentsük el, hogy később is használhassuk:

1. **Ctrl+S**
2. Név: `qry_Marciusi_latogatasok`
3. **OK**

> **Jó gyakorlat:** A lekérdezések nevét érdemes `qry_` előtaggal kezdeni (query = lekérdezés).

## Több feltétel: ELTE-s kutatók látogatásai

Nézzünk egy bonyolultabb példát: kik jártak az ELTE-ről?

### 1. lépés: Új lekérdezés

1. **Létrehozás** → **Lekérdezéstervezés**
2. Adjuk hozzá: `tbl_Kutatók` és `tbl_Látogatások`
3. **Bezárás**

### 2. lépés: Mezők kiválasztása

Húzzuk be:

- `Név` (tbl\_Kutatók)
- `Intézmény` (tbl\_Kutatók)
- `LatDátum` (tbl\_Látogatások)
- `CélKutatás` (tbl\_Látogatások)

### 3. lépés: Feltétel az intézményre

1. `Intézmény` oszlop, **Feltétel** sor
2. Írjuk be: `"ELTE BTK"`

> **Szövegek Access-ben:** Idézőjelek közé írjuk őket: `"ELTE BTK"`

### 4. lépés: Futtatás

**Futtatás** gomb → Látjuk az ELTE-s kutatók összes látogatását!

### 5. lépés: Mentés

- **Ctrl+S** → Név: `qry_ELTE_latogatasok`

## ÉS (AND) feltétel: ELTE-s kutatók márciusban

Mit tegyünk, ha **két feltétel** is teljesüljön egyszerre?

**Példa:** ELTE-s kutatók ÉS márciusi dátum

### Megoldás: Ugyanabban a Feltétel sorban

```
┌─────────┬───────────┬──────────┬────────────┐
│ Mező:   │ Intézmény │ LatDátum │            │
├─────────┼───────────┼──────────┼────────────┤
│Feltétel:│"ELTE BTK" │Between #2024-03-01# And #2024-03-31#│
└─────────┴───────────┴──────────┴────────────┘
```

**Eredmény:** Csak azok a látogatások, ahol **MIND** az intézmény “ELTE BTK” **ÉS** a dátum március hónapban van.

## VAGY (OR) feltétel: ELTE vagy PTE kutatók

Mit tegyünk, ha **bármelyik feltétel** teljesülhet?

**Példa:** ELTE-s kutatók VAGY PTE-s kutatók

### Megoldás: Következő sorba (vagy:)

```
┌─────────┬───────────┐
│ Mező:   │ Intézmény │
├─────────┼───────────┤
│Feltétel:│"ELTE BTK" │
│  vagy:  │"PTE BTK"  │
└─────────┴───────────┘
```

**Eredmény:** Azok a látogatások, ahol az intézmény “ELTE BTK” **VAGY** “PTE BTK”.

## Helyettesítő karakterek (Wildcard)

Mit tegyünk, ha nem tudjuk pontosan a szöveget?

### Csillag (\*) – bármilyen karaktersorozat

**Példa:** Minden kutató, akinek neve “Kovács”-sal kezdődik:

- Feltétel: `"Kovács*"`

**Találatok:** Kovács Anna, Kovács Péter, Kovács-Nagy Mária

### Kérdőjel (?) – pontosan egy karakter

**Példa:** Email cím, ahol a domain “elte.hu” vagy “ppke.hu”:

- Feltétel: `"*@??ke.hu"`

**Találatok:** …([**elte.hu?**](#ref-elte.hu)), …([**ppke.hu?**](#ref-ppke.hu))

### Példák levéltári használatra

- Minden “Nemzeti” kezdetű intézmény: `"Nemzeti*"`
- Email cím tartalmaz “([**gmail?**](#ref-gmail))”: `"*@gmail.com"`
- Kutatási téma tartalmazza a “színház” szót: `"*színház*"`

## Számított mezők

Készíthetünk olyan mezőt is, amely **számítás eredményét** mutatja!

### Példa: Hány napja volt a látogatás?

Számítsuk ki, hogy hány napja volt egy látogatás a mai naphoz képest!

#### 1. lépés: Új lekérdezés

1. **Létrehozás** → **Lekérdezéstervezés**
2. Táblák: `tbl_Kutatók`, `tbl_Látogatások`

#### 2. lépés: Mezők

Húzzuk be:

- `Név`
- `LatDátum`

#### 3. lépés: Számított mező hozzáadása

Kattintsunk egy üres oszlop **Mező** sorába, és írjuk be:

```
NapokÓta: Date()-[LatDátum]
```

**Magyarázat:**

- `NapokÓta:` – Az új mező neve
- `Date()` – Mai dátum
- `[LatDátum]` – Látogatás dátuma mezőre hivatkozunk
- `-` – Kivonás

#### 4. lépés: Futtatás

**Futtatás** → Látjuk, hogy hány napja volt minden látogatás!

```
┌────────────────┬────────────┬────────────┐
│ Név            │ LatDátum   │ NapokÓta   │
├────────────────┼────────────┼────────────┤
│ Kovács Anna    │ 2024.03.10 │     5      │
│ Nagy Péter     │ 2024.03.12 │     3      │
└────────────────┴────────────┴────────────┘
```

## Csoportosítás: Hányszor járt minden kutató?

Most egy kicsit bonyolultabb lekérdezést készítünk: **összesítjük**, hogy minden kutató hányszor látogatott!

### 1. lépés: Új lekérdezés

1. **Létrehozás** → **Lekérdezéstervezés**
2. Táblák: `tbl_Kutatók`, `tbl_Látogatások`

### 2. lépés: Mezők

Húzzuk be:

- `Név` (tbl\_Kutatók)
- `Intézmény` (tbl\_Kutatók)
- `LatID` (tbl\_Látogatások) – Ezt fogjuk számolni!

### 3. lépés: Összesen sor megjelenítése

1. **Tervezés** fül → **Összesen** gomb (Σ szimbólum)

Megjelenik egy új sor a rácsban: **Összesen:**

```
┌─────────┬────────┬───────────┬───────┐
│ Mező:   │ Név    │ Intézmény │ LatID │
├─────────┼────────┼───────────┼───────┤
│ Tábla:  │tbl_... │tbl_...    │tbl_...│
│ Összesen│Csoportosítás│Csoportosítás│Darabszám│
└─────────┴────────┴───────────┴───────┘
```

### 4. lépés: Összesítés beállítása

- **Név** és **Intézmény** → `Csoportosítás` (Group By) – már be van állítva
- **LatID** → Kattintsunk az Összesen sorába, válasszuk: **Darabszám** (Count)

> **Mit jelent ez?**
> - Csoportosítunk kutatónként (név szerint)
> - Megszámoljuk, hogy minden csoportban hány látogatás (LatID) van

### 5. lépés: Mező átnevezése

Nevezzük át a `LatID` mezőt valami érthetőbbre:

1. Kattintsunk a `LatID` oszlop **Mező** sorába
2. Írjuk elé: `LátogatásSzám:`

Így lesz: `LátogatásSzám: LatID`

### 6. lépés: Futtatás

**Futtatás** → Eredmény:

```
┌────────────────┬──────────────┬────────────────┐
│ Név            │ Intézmény    │ LátogatásSzám  │
├────────────────┼──────────────┼────────────────┤
│ Kovács Anna    │ ELTE BTK     │       3        │
│ Nagy Péter     │ Független    │       1        │
│ Szabó Mária    │ PTE BTK      │       1        │
└────────────────┴──────────────┴────────────────┘
```

Látjuk, hogy Kovács Anna háromszor járt, a többiek egyszer!

### 7. lépés: Rendezés csökkenő sorrendben

Ha szeretnénk, hogy a legtöbbször látogatók legyenek elől:

1. `LátogatásSzám` oszlop, **Rendezés** sor
2. Válasszuk: **Csökkenő** (Descending)

### 8. lépés: Mentés

- **Ctrl+S** → Név: `qry_Latogatasok_kutatok_szerint`

## További összesítő függvények

A **Darabszám** mellett más függvények is vannak:

| Függvény | Mit csinál? | Példa |
| --- | --- | --- |
| **Sum** (Összeg) | Összeadja az értékeket | Összes kikölcsönzött iratok száma |
| **Avg** (Átlag) | Átlagot számol | Átlagos látogatási idő |
| **Min** (Minimum) | Legkisebb érték | Legrégebbi látogatás dátuma |
| **Max** (Maximum) | Legnagyobb érték | Legutóbbi látogatás dátuma |
| **Count** (Darabszám) | Megszámolja a rekordokat | Hány látogatás volt? |

## Gyakorlati feladatok

### Feladat 1: Áprilisi látogatások

Készítsünk lekérdezést, amely az áprilisi látogatásokat mutatja!

**Mezők:** Név, Intézmény, LatDátum, CélKutatás  
**Feltétel:** LatDátum között 2024-04-01 és 2024-04-30  
**Mentés:** `qry_Aprilisi_latogatasok`

Megoldás

1. Létrehozás → Lekérdezéstervezés
2. Táblák: tbl\_Kutatók, tbl\_Látogatások
3. Mezők behúzása: Név, Intézmény, LatDátum, CélKutatás
4. LatDátum Feltétel: `Between #2024-04-01# And #2024-04-30#`
5. Futtatás
6. Ctrl+S → `qry_Aprilisi_latogatasok`

### Feladat 2: Független kutatók

Készítsünk lekérdezést, amely a független kutatókat és látogatásaikat mutatja!

**Mezők:** Név, Email, LatDátum, CélKutatás  
**Feltétel:** Intézmény = “Független kutató”  
**Mentés:** `qry_Fuggetlen_kutatok`

Megoldás

1. Létrehozás → Lekérdezéstervezés
2. Táblák: tbl\_Kutatók, tbl\_Látogatások
3. Mezők: Név, Email, LatDátum, CélKutatás
4. Intézmény Feltétel: `"Független kutató"`
5. Futtatás
6. Ctrl+S → `qry_Fuggetlen_kutatok`

### Feladat 3: Leggyakoribb kutatási témák

Készítsünk összesítő lekérdezést, amely megmutatja, hogy melyik kutatási téma hányszor fordult elő!

**Mezők:** CélKutatás (csoportosítás), Darabszám  
**Rendezés:** Darabszám szerint csökkenő  
**Mentés:** `qry_Temak_gyakorisaga`

Megoldás

1. Létrehozás → Lekérdezéstervezés
2. Tábla: tbl\_Látogatások
3. Mezők: CélKutatás, LatID
4. Tervezés → Összesen gomb
5. CélKutatás → Csoportosítás
6. LatID → Darabszám, átnevezés: `TémaSzám: LatID`
7. TémaSzám Rendezés: Csökkenő
8. Futtatás
9. Ctrl+S → `qry_Temak_gyakorisaga`

### Feladat 4: Legutóbbi látogatás kutatónként

Készítsünk lekérdezést, amely minden kutatóhoz megmutatja a legutóbbi látogatása dátumát!

**Mezők:** Név, Intézmény, Max(LatDátum)  
**Összesítés:** Max függvény  
**Mentés:** `qry_Legutolso_latogatas`

Megoldás

1. Létrehozás → Lekérdezéstervezés
2. Táblák: tbl\_Kutatók, tbl\_Látogatások
3. Mezők: Név, Intézmény, LatDátum
4. Tervezés → Összesen
5. Név, Intézmény → Csoportosítás
6. LatDátum → Maximum, átnevezés: `LegutolsóLátogatás: LatDátum`
7. Futtatás
8. Ctrl+S → `qry_Legutolso_latogatas`
