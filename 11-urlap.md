# Űrlap készítése adatbevitelhez

## Bevezetés

Az előző fejezetben létrehoztuk a `tbl_Kutatók` táblát, és adatokat vittünk fel **adatlap nézetben**. Ez működik, de van néhány hátránya:

Nem túl szép, professzionális  
Egyszerre sok oszlop látszik → nehéz átlátni  
Könnyen véletlenül módosíthatunk/törölhetünk adatot  
Nem testre szabható

A megoldás: **űrlap (form)** készítése!

## Mi az az űrlap?

Az **űrlap** egy felhasználóbarát felület, amely:

Szép, professzionális megjelenésű  
Egy rekordot mutat egyszerre (mint egy papíralapú űrlap)  
Testre szabható (színek, betűk, elrendezés)  
Védi az adatokat (el lehet rejteni bizonyos mezőket)  
Egyszerűbb használni (gombok, navigáció)

## Automatikus űrlap generálása

A leggyorsabb módszer: hagyjuk, hogy az Access automatikusan készítsen nekünk egy űrlapot!

### 1. lépés: Tábla kijelölése

1. Zárjuk be a `tbl_Kutatók` táblát, ha még nyitva van (jobb felső sarokban az ✕)
2. A bal oldali **Navigációs panelen** kattintsunk **egyszeri kattintással** a `tbl_Kutatók` táblára
   - **NE** dupla kattintás (az megnyitná a táblát)
   - Csak kattintsunk rá egyszer, hogy kijelöljük

A tábla neve kék háttérrel kiemelődik.

### 2. lépés: Űrlap varázsló indítása

Most, hogy a tábla ki van jelölve:

1. Kattintsunk a **Létrehozás** fülre (a menüszalagon)
2. Keressük meg az **Űrlap** gombot (nagy, zöld ikon, rajta egy formanyomtatvány)
3. Kattintsunk rá

**Varázslat! ✨** Az Access automatikusan létrehozott egy űrlapot!

### 3. lépés: Az űrlap megtekintése

Nézzük meg, mit kaptunk:

```
┌──────────────────────────────────────────┐
│  tbl_Kutatók                             │
├──────────────────────────────────────────┤
│  KutatóID        1                       │
│  Név             Kovács Anna             │
│  Email           kovacs.a@elte.hu        │
│  Intézmény       ELTE BTK                │
│  RegDátum        2024.01.15              │
│  Aktív           ☑                       │
│                                           │
│  ◀◀  ◀  Rekord: 1 / 10  ▶  ▶▶  ▶*       │
└──────────────────────────────────────────┘
```

**Figyeljük meg:**

- Minden mező **egymás alatt** van (nem egymás mellett, mint az adatlapon)
- Mindegyik mellette van a **címkéje** (mezőnév)
- **Csak egy rekord** látszik egyszerre (Kovács Anna)
- Alul **navigációs gombok** (ugyanazok, mint az adatlapon)

### 4. lépés: Navigáció az űrlapon

Próbáljuk ki a navigációs gombokat:

- **▶** (Következő rekord) → Nagy Péter
- **▶** → Szabó Mária
- **◀** (Előző rekord) → Nagy Péter
- **◀◀** (Első rekord) → Kovács Anna
- **▶▶** (Utolsó rekord) → Az utolsó felvett kutató
- **▶\*** (Új rekord) → Üres űrlap, új kutató hozzáadásához

### 5. lépés: Új rekord felvétele az űrlapon

Kattintsunk az **▶\*** gombra (új rekord).

Most egy üres űrlapot látunk:

```
┌──────────────────────────────────────────┐
│  tbl_Kutatók                             │
├──────────────────────────────────────────┤
│  KutatóID        (AutoNumber)            │
│  Név             _____________________   │
│  Email           _____________________   │
│  Intézmény       _____________________   │
│  RegDátum        (mai dátum)             │
│  Aktív           ☐                       │
└──────────────────────────────────────────┘
```

Vigyünk fel egy új kutatót:

1. Kattintsunk a **Név** mezőbe
2. Írjuk be: `Horváth István`
3. **Tab** → Email: `horvath.i@corvinus.hu`
4. **Tab** → Intézmény: `Corvinus Egyetem`
5. **Tab** → RegDátum: (hagyjuk a mai dátumot)
6. **Tab** → Aktív: ☑ (pipáljuk be)
7. **Tab** vagy **Enter**

Az Access automatikusan menti! Nem kell külön mentési gombra kattintanunk.

### 6. lépés: Űrlap mentése

Mentsük el az űrlapot:

1. Nyomjuk meg: **Ctrl+S** (vagy Fájl → Mentés)
2. Az Access megkérdezi a nevet
3. Írjuk be: `frm_Kutatók`
4. **OK**

> **Jó gyakorlat:** Az űrlapok nevét érdemes `frm_` előtaggal kezdeni (form = űrlap).

Most a bal oldali Navigációs panelen, az **Űrlapok** kategóriában látjuk a `frm_Kutatók` űrlapot.

## Az űrlap testre szabása

Az automatikusan generált űrlap jó, de testre szabhatjuk! Színeket változtathatunk, mezőket elrendezhetünk, elrejthetünk stb.

### 1. lépés: Tervezési nézetre váltás

Váltsu különböző módokon válthatunk:

**A módszer:**

1. Kattintsunk a **Nézet** gombra (Kezdőlap fül, bal oldalt)
2. Válasszuk: **Tervezési nézet**

**B módszer:**

- Jobb alsó sarokban három kis ikon: 📄 🖊️ 🎨
- Kattintsunk a jobb szélsőre (🎨 Tervezési nézet)

### 2. lépés: A tervezési nézet megismerése

Most egy teljesen más felületet látunk:

```
┌──────────────────────────────────────────┐
│ Űrlap fejléce                            │  ← Fejléc szakasz
├──────────────────────────────────────────┤
│ KutatóID címke     KutatóID szövegdoboz │  ← Részletek szakasz
│ Név címke          Név szövegdoboz      │
│ Email címke        Email szövegdoboz    │
│ ...                                      │
├──────────────────────────────────────────┤
│ Űrlap lábléce                            │  ← Lábléc szakasz
└──────────────────────────────────────────┘
```

**Szakaszok:**

- **Űrlap fejléce:** Ide kerül a cím, logó (egyszeri, minden rekordnál ugyanaz)
- **Részletek:** Itt vannak a mezők (ez ismétlődik rekordonként)
- **Űrlap lábléce:** Alul, gombok, megjegyzések

**Vezérlők (Controls):**

Minden elem az űrlapon egy **vezérlő**:

- **Címke (Label):** “Név”, “Email” – csak szöveg, nem módosítható
- **Szövegdoboz (Text Box):** Ide írjuk az adatokat
- **Jelölőnégyzet (Checkbox):** Az “Aktív” mező

### 3. lépés: Címkék átnevezése

A mezőnevek (pl. “KutatóID”, “RegDátum”) nem túl szépek. Nevezzük át őket!

#### KutatóID címke módosítása

1. Kattintsunk **egyszeri kattintással** a `KutatóID` címkére (bal oldalt)
   - A címke körül megjelennek kis négyzetek (kiválasztva)
2. Kattintsunk még egyszer (lassan, ne dupla kattintás!) → Szerkesztési mód
3. Töröljük ki, és írjuk be: **Azonosító**
4. Kattintsunk máshova (pl. szürke háttérre)

Vagy:

1. Dupla kattintás a címkére → Megnyílik a **Tulajdonságlap** (Property Sheet)
2. Keressük meg: **Felirat** (Caption) → Írjuk be: `Azonosító`
3. Zárjuk be a Tulajdonságlapot (✕)

> **Tipp:** Ha nem látjuk a Tulajdonságlapot, nyomjuk meg az **F4** billentyűt!

#### További címkék átnevezése

Ugyanígy nevezzük át:

- `Név` → Maradhat (már jó)
- `Email` → **E-mail cím**
- `Intézmény` → Maradhat
- `RegDátum` → **Regisztráció dátuma**
- `Aktív` → **Aktív kutató?**

### 4. lépés: KutatóID mező elrejtése

Az AutoNumber ID-t nem szükséges mutatni a felhasználónak. Rejtsük el!

#### Módszer 1: Láthatóság kikapcsolása

1. Kattintsunk a `KutatóID` **szövegdobozára** (jobb oldalt, nem a címkére!)
2. Nyomjuk meg az **F4**-et (Tulajdonságlap megnyitása)
3. Keressük meg a **Látható** (Visible) tulajdonságot
4. Válasszuk: **Nem** (No)

A KutatóID mező eltűnt! (A tervezési nézetben még látszik, de halványan.)

#### Módszer 2: A címke is elrejtése

Az “Azonosító” címke még látszik. Rejtsük el azt is:

1. Kattintsunk a `Azonosító` címkére
2. F4 → Tulajdonságlap
3. **Látható** → **Nem**

Most mindkettő eltűnt!

> **Vagy:** Törölhetjük is őket (kiválasztás → Delete), de jobb elrejteni, hátha később kelleni fog.

### 5. lépés: Címsor hozzáadása az űrlaphoz

Adjunk hozzá egy szép címsort a fejlécbe!

#### Fejléc szakasz nagyobbra húzása

Először is, csináljuk nagyobbra a fejléc szakaszt:

1. Vigyük az egeret a **“Részletek”** szöveg alatti vonalra (szakaszhatár)
2. Az egérkurzor ↕ alakra vált
3. Húzzuk lefelé kb. 2 cm-t

Most van hely a fejlécben!

#### Címke beszúrása

1. Kattintsunk a **Tervezés** fülre (ha nincs már ott)
2. Keressük meg a **Vezérlők** csoportot
3. Kattintsunk a **Aa címke** ikonra (Label)
4. Vigyük az egeret a fejléc területére
5. Rajzoljunk egy téglalapot (kattintás és húzás)
6. Írjuk be: **Kutatói Nyilvántartás**

#### Formázás

Tegyük széppé a címet:

1. A címke legyen kiválasztva
2. **Kezdőlap** fül → Formázás eszközök:
   - **Betűméret:** 18
   - **Félkövér:** B gomb
   - **Szöveg színe:** válasszunk valami szépet (pl. sötétkék)
   - **Igazítás:** középre (három vonal ikon)

### 6. lépés: Mezők elrendezése

Az űrlapon a mezők most elég kuszán helyezkednek el. Rendezzük őket!

#### Mezők igazítása balra

1. Tartsuk lenyomva a **Shift** billentyűt
2. Kattintsunk az összes **címkére** egymás után (Név, E-mail cím, Intézmény, stb.)
   - Mindegyik kijelölődik (kis négyzetek körülöttük)
3. **Rendezés** fül → **Balra igazítás** gomb

Most az összes címke egy függőleges vonalba került!

#### Szövegdobozok igazítása

Ugyanígy igazítsuk a szövegdobozokat is:

1. Shift + kattintások a szövegdobozokon
2. **Rendezés** fül → **Balra igazítás**

#### Egyenletes távolságok

Ha a mezők között egyenetlen távolságok vannak:

1. Jelöljük ki az összes vezérlőt (címkék + szövegdobozok)
2. **Rendezés** fül → **Egyenlő távolság függőlegesen**

### 7. lépés: Háttérszín változtatása

Tegyük színesebbé az űrlapot!

#### Fejléc háttérszíne

1. Kattintsunk a fejléc területére (üres helyre)
2. F4 → Tulajdonságlap
3. **Háttérszín** (Back Color) → Válasszunk egy világos színt (pl. világoskék)

**Vagy:**

1. Jobb egérgomb a fejléc területén
2. **Kitöltési szín** → Válasszunk színt

#### Részletek szakasz háttérszíne

Ugyanígy adjunk halvány háttérszínt a Részletek szakasznak is (pl. nagyon világos szürke vagy krém).

### 8. lépés: Űrlap nézetre váltás – tesztelés

Nézzük meg, hogy néz ki az űrlapunk!

1. **Nézet** gomb → **Űrlap nézet**

Most egy szép, professzionális űrlapot látunk! 🎉

```
┌──────────────────────────────────────────┐
│      Kutatói Nyilvántartás               │  (kék háttér)
├──────────────────────────────────────────┤
│  Név             Kovács Anna             │
│  E-mail cím      kovacs.a@elte.hu        │
│  Intézmény       ELTE BTK                │
│  Regisztráció    2024.01.15              │
│    dátuma                                 │
│  Aktív kutató?   ☑                       │
│                                           │
│  ◀◀  ◀  Rekord: 1 / 11  ▶  ▶▶  ▶*       │
└──────────────────────────────────────────┘
```

### 9. lépés: Mentés

Mentsük el a változtatásokat:

- **Ctrl+S**

## További testre szabási lehetőségek (opcionális)

### Mezők sorrendjének megváltoztatása (Tab Order)

Amikor **Tab** billentyűt nyomunk, az űrlap mezőről mezőre ugrik. Alapértelmezésben a létrehozási sorrend szerint. De mi változtathatjuk!

1. **Tervezési nézet**
2. Jobb egérgomb az űrlapon → **Tab-sorrend** (Tab Order)
3. Megjelenik egy ablak, ahol a mezők sorrendjét átrendezhetjük (húzással)
4. **OK**

**Tipp:** Logikus sorrend legyen: Név → Email → Intézmény → RegDátum → Aktív

### Mezők kötelező kitöltésének ellenőrzése

Ha szeretnénk, hogy bizonyos mezők kötelezőek legyenek:

1. **Tervezési nézet**
2. Kattintsunk a `Név` szövegdobozra
3. F4 → Tulajdonságlap → **Adatok** fül
4. **Kötelező** (Required) → **Igen**

Most ha valaki megpróbál üresen hagyni egy nevet, az Access hibaüzenetet ad.

> **Megjegyzés:** Ezt már beállítottuk a táblában, így duplikálás. De az űrlapon is beállíthatjuk extra biztonsági ellenőrzésnek.

### Egyéni szín a háttérnek (RGB kód)

Ha pontosan meghatározott színt szeretnénk:

1. Tulajdonságlap → **Háttérszín**
2. Kattintsunk a `...` gombra (Build button)
3. Adjuk meg az RGB kódot (pl. R: 220, G: 230, B: 255)

## Gyakorlati feladatok

### Feladat 1: Új rekordok felvétele az űrlapon

1. Nyissuk meg a `frm_Kutatók` űrlapot (dupla kattintás a Navigációs panelen)
2. Kattintsunk az **▶\*** gombra (új rekord)
3. Vigyünk fel 3 új kutatót!

**Példák:**

- **Tóth Katalin** | [toth.k@elte.hu](mailto:toth.k@elte.hu) | ELTE BTK | (mai dátum) | Aktív
- **Molnár Gábor** | [molnar.g@mta.hu](mailto:molnar.g@mta.hu) | MTA BTK | (mai dátum) | Aktív
- **Varga Éva** | (nincs email) | BFL | (mai dátum) | Inaktív

### Feladat 2: Adatok módosítása

1. Navigáljunk egy korábbi kutatóhoz (pl. Nagy Péter)
2. Változtassuk meg az email címét: `peter.nagy@newmail.com`
3. Tab vagy Enter → Az adat automatikusan mentődik
4. Ellenőrizzük: nyissuk meg a `tbl_Kutatók` táblát, és nézzük meg, hogy valóban módosult!

### Feladat 3: Keresés az űrlapon

Van egy hasznos funkció: **keresés**.

1. Nyissuk meg a `frm_Kutatók` űrlapot
2. **Kezdőlap** fül → **Keresés** gomb (🔍) vagy **Ctrl+F**
3. Megjelenik a “Keresés és csere” ablak
4. **Keresés:** Írjuk be: `ELTE`
5. **Következő keresése** gomb

Az Access megtalálja az első ELTE-s kutatót! A **Következő keresése** gombbal továbbléphetünk a következőre.

### Feladat 4: Tervezési módosítások

Próbáljuk ki a következőket tervezési nézetben:

1. Változtassuk meg a fejléc szövegének színét pirosra
2. Adjunk a fejléchez egy egyéni szöveget: “MLE Továbbképzés 2026”
3. Növeljük a `Név` mező szélességét (húzzuk szélesebbre)
4. Adjunk halvány sárga hátteret a `Részletek` szakasznak
