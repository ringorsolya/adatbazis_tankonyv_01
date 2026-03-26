# Az első tábla létrehozása: Kutatók nyilvántartása

## Bevezetés

Ebben a fejezetben lépésről lépésre létrehozzuk az első Access táblánkat a gyakorlatban.

A célunk: egy **kutatói nyilvántartó** tábla, amely tartalmazza: - Kutatók nevét - Email címét - Intézményét - Regisztrációjának dátumát - Azt, hogy jelenleg aktív-e

## Előkészületek

### Munkakönyvtár létrehozása

Először hozzunk létre egy mappát a számítógépünkön, ahol az Access fájljainkat fogjuk tárolni.

1. Nyissuk meg a **Fájlkezelőt** (Windows Intéző)
2. Navigáljunk oda, ahol dolgozni szeretnénk (pl. `Dokumentumok`)
3. Hozzunk létre egy új mappát: jobb egérgomb → **Új** → **Mappa**
4. Nevezzük el: `Access_tanfolyam`

> Érdemes rendszeresen menteni/biztonsági mentést készíteni!

### Access indítása

1. Nyissuk meg a **Microsoft Access** programot

   - Start menü → **Access** vagy
   - Keresés: “Access”
2. Az Access kezdőképernyőjén kattintsunk: **Üres adatbázis**
3. Adjunk nevet az adatbázisnak:

   - **Fájlnév:** `Kutatoi_nyilvantartas.accdb`
   - **Hely:** Válasszuk ki a létrehozott `Access_tanfolyam` mappát (mappa ikon)
4. Kattintsunk a **Létrehozás** gombra

> **Fontos:** Az Access automatikusan létrehoz egy üres táblát (`Tábla1` néven). Ezt később átnevezzük vagy töröljük.

## A tábla megtervezése

Mielőtt elkezdenénk gépelni, tervezzük meg, milyen mezőket szeretnénk:

| Mezőnév | Adattípus | Méret | Kötelező | Leírás |
| --- | --- | --- | --- | --- |
| KutatóID | AutoNumber | - | ✓ | Egyedi azonosító (elsődleges kulcs) |
| Név | Short Text | 100 | ✓ | Kutató teljes neve |
| Email | Short Text | 100 | ✓ | Email cím |
| Intézmény | Short Text | 150 | ✗ | Munkahely/egyetem |
| RegDátum | Date/Time | - | ✓ | Regisztráció dátuma |
| Aktív | Yes/No | - | ✓ | Jelenleg aktív kutató? |

## Tábla létrehozása tervezési nézetben

### 1. lépés: Tervezési nézetre váltás

Az Access alapértelmezetten **Adatlap nézetben** nyitotta meg a táblát (mint az Excel). Mi azonban **Tervezési nézetben** szeretnénk dolgozni, mert ott pontosan megadhatjuk a mezőket és típusaikat.

1. Kattintsunk a `Kezdőlap` fülre (ha nincs már ott)
2. Bal oldalon keressük meg a **Nézet** gombot (nagy ikon)
3. Kattintsunk rá: **Nézet** → **Tervezési nézet**

Vagy egyszerűbben:

- Jobb alsó sarokban három kis ikon látható: 📋 📝 📄
- Kattintsunk a középső ikonra (📝 Tervezési nézet)

Az Access megkérdezi a tábla nevét:

4. Írjuk be: `tbl_Kutatók`
5. Kattintsunk: **OK**

> **Jó gyakorlat:** A táblák nevét érdemes `tbl_` előtaggal kezdeni, hogy könnyen megkülönböztessük őket a lekérdezésektől, űrlapoktól.

### 2. lépés: A tervezési nézet megismerése

Most egy rácsos táblázatot látunk három oszloppal:

```
┌─────────────┬──────────────┬─────────────────────────────┐
│ Mezőnév     │ Adattípus    │ Leírás (opcionális)        │
├─────────────┼──────────────┼─────────────────────────────┤
│ ID          │ AutoNumber   │                             │
│             │              │                             │
│             │              │                             │
└─────────────┴──────────────┴─────────────────────────────┘
```

Az Access automatikusan létrehozott egy `ID` nevű mezőt, ami AutoNumber típusú. Ezt használjuk majd elsődleges kulcsnak!

**Alul** látjuk a **Mező tulajdonságai** panelt. Itt részletesen beállíthatjuk a kiválasztott mező tulajdonságait.

### 3. lépés: Az ID mező átnevezése

Az első sor (`ID` mező) már ki van választva. Nevezzük át `KutatóID`-ra:

1. Kattintsunk az `ID` szóra (Mezőnév oszlop)
2. Töröljük ki, és írjuk be: **KutatóID**
3. Nyomjunk **Tab** billentyűt (ez a következő oszlopra ugrik)

Az Adattípus már **AutoNumber** – ezt hagyjuk így!

4. Nyomjunk megint **Tab**-ot
5. A Leírás oszlopban írjuk be: **Egyedi azonosító**

> **Megjegyzés:** A Leírás mező nem kötelező, de hasznos dokumentációnak.

### 4. lépés: Elsődleges kulcs beállítása

A `KutatóID` lesz az elsődleges kulcs. Állítsuk be:

1. Kattintsunk a `KutatóID` sor elejére (a szürke négyzetbe a bal szélen)
2. A felső menüszalagon (Tervezés fül) keressük meg a **🔑 Elsődleges kulcs** gombot
3. Kattintsunk rá

Most a `KutatóID` sor bal szélén megjelent egy kis 🔑 kulcs ikon. Ez jelzi, hogy ez az elsődleges kulcs.

> **Vagy:** Jobb egérgombbal kattintva a sorra, válasszuk: **Elsődleges kulcs**

### 5. lépés: További mezők hozzáadása

Most adjuk hozzá a többi mezőt. Kattintsunk a **második sor** Mezőnév cellájába, és kezdjük:

#### Név mező

1. **Mezőnév:** Írjuk be: `Név`
2. **Tab** billentyű → Adattípus: `Short Text` (ez az alapértelmezett, hagyjuk)
3. **Tab** → Leírás: `Kutató teljes neve`
4. **Enter** (új sor)

**Tulajdonságok beállítása:**

Most állítsuk be a mező részletes tulajdonságait az alsó panelen:

- Keressük meg: **Mező mérete** (Field Size) → Írjuk be: `100`
- **Kötelező** (Required) → Válasszuk: **Igen**
- **Üres karakterláncok engedélyezése** (Allow Zero Length) → **Nem**

> **Mit jelentenek ezek?** - **Mező mérete:** Maximum 100 karakter hosszú lehet a név - **Kötelező:** Nem lehet üresen hagyni - **Üres karakterláncok:** Nem fogadunk el üres szöveget (““)

#### Email mező

Kattintsunk a **harmadik sor** Mezőnév cellájába:

1. **Mezőnév:** `Email`
2. **Adattípus:** `Short Text`
3. **Leírás:** `Email cím`

**Tulajdonságok:**

- **Mező mérete:** `100`
- **Kötelező:** `Igen`

> **Tipp:** Később (haladó szinten) beállíthatunk ellenőrző szabályt, amely biztosítja, hogy valódi email formátumot adjanak meg (pl. tartalmaz `@` jelet).

#### Intézmény mező

1. **Mezőnév:** `Intézmény`
2. **Adattípus:** `Short Text`
3. **Leírás:** `Munkahely vagy egyetem neve`

**Tulajdonságok:**

- **Mező mérete:** `150`
- **Kötelező:** `Nem` (Ez lehet üres! Pl. független kutatók esetén)

> **Miért nem kötelező?** Nem minden kutatónak van intézményi affiliációja.

#### RegDátum mező

1. **Mezőnév:** `RegDátum`
2. **Adattípus:** Kattintsunk a legördülő menüre → válasszuk: **Date/Time**
3. **Leírás:** `Regisztráció dátuma`

**Tulajdonságok:**

- **Formátum** (Format) → Válasszuk: **Rövid dátum** (Short Date)
- **Kötelező:** `Igen`
- **Alapértelmezett érték** (Default Value) → Írjuk be: `=Date()`

> **Mit jelent a `=Date()`?**  
> Ez egy függvény, amely automatikusan beszúrja a mai dátumot, amikor új rekordot veszünk fel. Így nem kell minden alkalommal begépelni!

#### Aktív mező

1. **Mezőnév:** `Aktív`
2. **Adattípus:** Válasszuk: **Yes/No**
3. **Leírás:** `Jelenleg aktív kutató?`

**Tulajdonságok:**

- **Alapértelmezett érték:** `True` (vagy `-1`)

> **Miért True?** Alapértelmezésben minden új kutató aktív. Ha később inaktívvá válik, kézzel átírjuk.

### 6. lépés: A tábla mentése

Mentsük el a táblát:

1. **Ctrl+S** vagy **Fájl** → **Mentés**

Az Access már korábban (a tervezési nézetre váltáskor) elmentette `tbl_Kutatók` néven, úgyhogy most csak elmenti a változtatásokat.

> **Fontos:** Szoktassuk meg, hogy gyakran mentünk! **Ctrl+S** legyen reflex!

### 7. lépés: Ellenőrzés

Ellenőrizzük le, hogy minden rendben van-e:

```
┌────────────┬──────────────┬────────────────────────────┐
│ Mezőnév    │ Adattípus    │ Leírás                     │
├────────────┼──────────────┼────────────────────────────┤
│🔑KutatóID  │ AutoNumber   │ Egyedi azonosító           │
│ Név        │ Short Text   │ Kutató teljes neve         │
│ Email      │ Short Text   │ Email cím                  │
│ Intézmény  │ Short Text   │ Munkahely vagy egyetem     │
│ RegDátum   │ Date/Time    │ Regisztráció dátuma        │
│ Aktív      │ Yes/No       │ Jelenleg aktív kutató?     │
└────────────┴──────────────┴────────────────────────────┘
```

Ha minden stimmel, készen vagyunk! 🎉

## Adatlap nézetbe váltás – első adatok bevitele

Most nézzük meg, hogyan néz ki a táblánk “élőben”, és vigyünk fel néhány kutatót!

### Adatlap nézetre váltás

1. Kattintsunk a **Nézet** gombra (vagy jobb alsó sarokban az adatlap ikon 📋)
2. Válasszuk: **Adatlap nézet**

Most egy üres táblázatot látunk, oszlopokkal:

```
┌──────────┬─────┬───────┬───────────┬──────────┬───────┐
│ KutatóID │ Név │ Email │ Intézmény │ RegDátum │ Aktív │
├──────────┼─────┼───────┼───────────┼──────────┼───────┤
│          │     │       │           │          │   ☐   │
└──────────┴─────┴───────┴───────────┴──────────┴───────┘
```

> **Figyeljük meg:** - A **KutatóID** oszlop szürke – nem tudjuk szerkeszteni (AutoNumber) - A **RegDátum** automatikusan kitöltődik a mai dátummal (alapértelmezett érték) - Az **Aktív** egy jelölőnégyzet ☐

### Első rekord felvétele

Kattintsunk a **Név** oszlop első cellájába, és kezdjük el beírni az adatokat:

**1. kutató:**

1. **Név:** Kovács Anna
2. **Tab** → **Email:** [kovacs.a@elte.hu](mailto:kovacs.a@elte.hu)
3. **Tab** → **Intézmény:** ELTE BTK
4. **Tab** → **RegDátum:** 2024-01-15 (vagy használjuk az alapértelmezettet)
5. **Tab** → **Aktív:** ☑ (pipáljuk be)
6. **Enter** (új sor)

> **Mi történt?** - A `KutatóID` automatikusan **1** lett - Az összes adat elmentődött

**2. kutató:**

Írjuk be a következő sort:

1. **Név:** Nagy Péter
2. **Email:** [nagy.p@gmail.com](mailto:nagy.p@gmail.com)
3. **Intézmény:** MNL OL
4. **RegDátum:** 2024-01-20
5. **Aktív:** ☑
6. **Enter**

**3. kutató:**

1. **Név:** Szabó Mária
2. **Email:** [szabo.m@uni-pecs.hu](mailto:szabo.m@uni-pecs.hu)
3. **Intézmény:** PTE BTK
4. **RegDátum:** 2024-02-03
5. **Aktív:** ☑
6. **Enter**

### További kutatók hozzáadása

Vigyünk fel még legalább 5-10 kutatót!

> **Tipp:** Variáljuk az adatokat! Legyen köztük olyan is, akinek nincs intézménye (hagyjuk üresen), és olyan is, aki inaktív (ne pipáljuk be az Aktív mezőt).

## Alapműveletek az adatlapon

Most, hogy van néhány rekordunk, próbáljunk ki néhány alapműveletet!

### Navigáció a rekordok között

Az ablak alján látunk navigációs gombokat:

```
◀◀  ◀  Rekord: ___ / 10  ▶  ▶▶  ▶*  🔍
```

- **◀◀** – Első rekordra ugrik
- **◀** – Előző rekord
- **▶** – Következő rekord
- **▶▶** – Utolsó rekordra ugrik
- **▶\*** – Új (üres) rekord hozzáadása

### Adatok szerkesztése

1. Kattintsunk bármelyik cellára
2. Módosítsuk az értéket (pl. változtassuk meg valaki email címét)
3. **Tab** vagy **Enter** → Az adat automatikusan mentődik

> **Fontos:** Az Access azonnal menti a változásokat! Nincs “Mentés” gomb az adatlapon.

### Rekord törlése

Ha tévedésből felvettünk egy kutatót, törölhetjük:

1. Kattintsunk a törölni kívánt sor **bal szélére** (a szürke négyzetre)
   - Az egész sor kijelölődik
2. Nyomjuk meg a **Delete** billentyűt
3. Az Access megerősítést kér: **Igen** (törlés) vagy **Nem** (mégsem)

> **Figyelem:** A törölt rekord KutatóID-ja nem kerül újra felhasználásra! Ha töröljük a 7-es ID-jű kutatót, a következő új kutató 8-as, 9-es, stb. lesz.

### Oszlopszélességek állítása

Ha egy oszlop túl keskény vagy túl széles:

1. Vigyük az egeret az oszlopfejlécek közötti határvonalra (pl. `Név` és `Email` között)
2. Az egérkurzor ↔︎ alakra vált
3. Kattintsunk és húzzuk jobbra vagy balra

**Vagy:**

- Dupla kattintás a határvonalon → Automatikusan igazodik a legszélesebb tartalomhoz

### Oszlopok elrejtése

Ha szeretnénk ideiglenesen elrejteni egy oszlopot (pl. KutatóID):

1. Jobb egérgomb az oszlopfejlécre
2. **Oszlop elrejtése**

**Visszahozás:**

1. Jobb egérgomb bármelyik oszlopfejlécre
2. **Oszlopok megjelenítése/elrejtése**
3. Pipáljuk be a kívánt oszlopokat

## Hibakezelés – mit tegyünk, ha…

### “A mező nem frissíthető”

**Probléma:** Nem tudjuk szerkeszteni a KutatóID mezőt.

**Megoldás:** Ez normális! Az AutoNumber mezőket az Access kezeli, mi nem módosíthatjuk.

### “Nullértékek nem engedélyezettek a(z) ‘…’ mezőben”

**Probléma:** Megpróbáltunk üresen hagyni egy kötelező mezőt (pl. Név).

**Megoldás:** Töltsük ki a mezőt! Ha valóban nem tudjuk az adatot, állítsuk át a mező tervezési nézetben, hogy ne legyen kötelező.

### “A begépelt érték nem megfelelő a mezőhöz”

**Probléma:** Rossz típusú adatot próbáltunk bevinni (pl. szöveget dátum mezőbe).

**Megoldás:**

- **RegDátum** mezőbe csak dátumot írjunk! Formátum: `YYYY-MM-DD` (pl. 2024-01-15)
- Ha nem biztos, hogy helyes formátumot adunk meg, használjunk dátumválasztót (kis naptár ikon 📅 a cellában)

### “Az Access nem talál olyan rekordot…”

**Probléma:** Töröltünk egy rekordot, és most hibaüzenetet kapunk.

**Megoldás:** Az Access néha “emlékszik” a törölt rekordokra. Zárjuk be és nyissuk meg újra a táblát (**Ctrl+W**, majd dupla kattintás a táblára).

## Gyakorlati feladatok

### Feladat 1: További kutatók felvétele

Vigyünk fel még legalább 5 kutatót! Variáljuk az intézményeket, és szerepeljen köztük:

- Legalább 1 független kutató (Intézmény üresen)
- Legalább 1 inaktív kutató (Aktív jelölőnégyzet nincs bepipálva)

### Feladat 2: Adatok módosítása

1. Válasszunk ki egy kutatót
2. Változtassuk meg az email címét
3. Állapítsuk meg az egyik kutatót inaktívvá

### Feladat 3: Navigáció gyakorlása

1. Ugorjunk az első rekordra (◀◀ gomb)
2. Lapozzunk végig egyesével (▶ gomb)
3. Ugorjunk az utolsó rekordra (▶▶)
4. Adjunk hozzá egy új rekordot (▶\* gomb)
