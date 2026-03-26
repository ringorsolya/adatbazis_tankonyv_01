# Összefoglalás

## Mit tanultunk?

### 1. alkalom

**Excel vs Access döntés**
- Mikor használjunk Excelt, mikor Access-t
- Döntési fa a megfelelő program kiválasztásához
- Levéltári példák mindkét programra

**Access alapfogalmak**
- Tábla, mező, rekord, elsődleges kulcs
- Adattípusok (Short Text, Number, Date/Time, Yes/No, AutoNumber)
- Az Access felülete (menüszalag, navigációs panel, munkaterület)

**Első tábla létrehozása**
- `tbl_Kutatók` tábla megtervezése és létrehozása
- Mezők definiálása tervezési nézetben
- Elsődleges kulcs beállítása
- Adatok bevitele adatlap nézetben

**Űrlap készítése**
- Automatikus űrlap generálása
- Űrlap testre szabása (címkék, színek, elrendezés)
- Mezők elrejtése
- Adatbevitel és navigáció űrlapon

### 2. alkalom

**Kapcsolatok és második tábla**
- Egy-a-többhöz kapcsolat fogalma
- `tbl_Látogatások` tábla létrehozása
- Idegen kulcs (Foreign Key) használata
- Referenciális integritás beállítása
- Kombinált lista (Combo Box) készítése

**Lekérdezések**
- Lekérdezések alapjai (szűrés, rendezés)
- Feltételek megadása (dátum, szöveg)
- ÉS (AND) és VAGY (OR) feltételek
- Helyettesítő karakterek (\*, ?)
- Számított mezők
- Csoportosítás és összesítő függvények

**Jelentések**
- Egyszerű jelentés készítése
- Nyomtatási kép előnézet
- Jelentés testre szabása (cím, dátum, oldalszám)
- Csoportosított jelentések
- Összesítések jelentésekben
- Exportálás (PDF, Word, Excel)

## Gyakorlás – Önálló feladatok

A tanultak elmélyítésére próbáljuk ki ezeket a feladatokat!

### Feladat 1: Bővítsük a rendszert

Adjunk hozzá egy új mezőt a Kutatók táblához:

- **Telefonszám** (Short Text, 20 karakter)

**Lépések:**

1. `tbl_Kutatók` megnyitása tervezési nézetben
2. Új mező hozzáadása: Telefonszám, Short Text
3. Mentés
4. `frm_Kutatók` űrlap tervezési nézetében adjuk hozzá a mezőt

### Feladat 2: Új lekérdezés

Készítsünk lekérdezést:

**Cél:** Mely kutatók NEM jártak még 2024 márciusa óta?

**Tipp:** Használjunk külső illesztést (Left Join) és NULL feltételt.

### Feladat 3: Jelentés logo-val

Adjunk hozzá egy képet (pl. levéltár logója) a jelentés fejlécéhez!

**Lépések:**

1. `rpt_Kutatok_lista` tervezési nézet
2. Tervezés → Beillesztés → Kép
3. Válasszunk egy képfájlt
4. Helyezzük el a jelentés fejlécében

### Feladat 4: Új tábla – Kutatási kérelmek

Hozzunk létre egy harmadik táblát:

**tbl\_Kerelmek**

- KérelmID (AutoNumber, PK)
- KutatóID (Number, FK)
- KérelmDátum (Date/Time)
- IratLeírás (Long Text) – mit szeretne a kutató látni
- Státusz (Short Text) – “Függőben”, “Jóváhagyva”, “Elutasítva”

Kapcsoljuk össze a Kutatók táblával!

## További tanulási lehetőségek

### Haladó Access tanfolyam

Ha tovább szeretnénk lépni, a **haladó kurzuson** a következőket tanuljuk:

- Többtáblás szerkezetek (fondok → állagok → iratok)
- Hierarchikus űrlapok alűrlapokkal
- Haladó lekérdezések (paraméterek, műveleti lekérdezések, kereszttáblák)
- Makrók és automatizálás
- Adatimportálás és exportálás
- Adatbázis optimalizálás

### Online források

**Microsoft hivatalos dokumentáció:**
- <https://support.microsoft.com/access>

**Videók (YouTube):**
- Keressünk rá: “Access alapok magyarul”
- Angol nyelvű tutorialok: “Access for beginners”

**Fórumok:**
- <https://answers.microsoft.com> (angol)
- Magyar Access fórumok

### Könyvek

- **“Access 2019 Bible”** – Michael Alexander, Richard Kusleika (angol, részletes)
- **“Microsoft Access lépésről lépésre”** – Joyce Cox, Joan Lambert (magyar fordítás, ha elérhető)

## Jó gyakorlatok és tippek

### Adatbázis karbantartás

**Rendszeres mentés:**
- Hetente készítsünk biztonsági mentést (másolás)
- Tároljuk külön helyen (pl. cloud, pendrive)

**Tömörítés és javítás:**
- Fájl → Információ → Tömörítés és javítás
- Csökkenti a fájlméretet, javít hibákat

**Verziózás:**
- Fontos változtatások előtt mentsünk új verzióként
- Pl. `Kutatoi_nyilvantartas_v1.accdb`, `..._v2.accdb`

### Elnevezési konvenciók

**Használjunk előtagokat:**
- Táblák: `tbl_` (pl. `tbl_Kutatók`)
- Lekérdezések: `qry_` (pl. `qry_Marciusi_latogatasok`)
- Űrlapok: `frm_` (pl. `frm_Kutatók`)
- Jelentések: `rpt_` (pl. `rpt_Kutatok_lista`)

**Magyar névkonvenció:**
- Használjunk érthető, magyar neveket
- Kerüljük a szóközöket (használjunk aláhúzást: `_`)
- Pl. `tbl_Kutatok` ✅, ne `Table1` ❌

### Adatminőség

**Ellenőrzési szabályok:**
- Használjunk ellenőrzési szabályokat a hibák elkerülésére
- Pl. email tartalmaz `@` jelet

**Kötelező mezők:**
- Fontos mezőket tegyünk kötelezővé
- Pl. név, email

**Kombinált listák:**
- Ahol lehet, használjunk legördülő listákat
- Csökkenti az elgépeléseket

## Gyakori hibák és megoldások

### “A fájl nem nyitható meg”

**Probléma:** Az adatbázis sérült vagy nem kompatibilis verzió.

**Megoldás:**
1. Fájl → Információ → Tömörítés és javítás
2. Ha ez sem segít: Új adatbázis, táblák importálása

---

### “Nincs elég memória”

**Probléma:** Túl nagy az adatbázis, vagy túl sok lekérdezés fut.

**Megoldás:**
1. Zárjuk be a nem használt objektumokat
2. Tömörítsük az adatbázist
3. Osszuk fel kisebb adatbázisokra

---

### “Referenciális integritás sérült”

**Probléma:** Léteznek olyan látogatások, amelyek nem létező kutatóra hivatkoznak.

**Megoldás:**
1. Keressük meg az “árva” rekordokat (lekérdezéssel)
2. Töröljük vagy javítsuk őket
3. Utána állítsuk be a referenciális integritást

---

### “Lassú a lekérdezés”

**Probléma:** Sok adat, nincs indexelés.

**Megoldás:**
1. Indexeljük a gyakran keresett mezőket (haladó)
2. Optimalizáljuk a lekérdezéseket
3. Csak a szükséges mezőket kérdezzük le

## Hasznos billentyűparancsok

| Parancs | Funkció |
| --- | --- |
| **Ctrl+S** | Mentés |
| **Ctrl+Z** | Visszavonás |
| **Ctrl+F** | Keresés |
| **Ctrl+N** | Új rekord |
| **F4** | Tulajdonságlap megnyitása |
| **F5** | Lekérdezés futtatása |
| **F11** | Navigációs panel megjelenítése/elrejtése |
| **Shift+F2** | Zoom ablak (hosszú szöveghez) |
| **Tab** | Következő mező |
| **Shift+Tab** | Előző mező |
| **Esc** | Módosítás visszavonása (adatlapon) |
