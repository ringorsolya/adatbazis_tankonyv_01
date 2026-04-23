# Történeti adatbázis – saját eszköz prozopográfiához

Ebben a fejezetben egy **böngészőben futó saját fejlesztésű eszközt** mutatunk be, amelyet kifejezetten levéltári és történeti kutatásra terveztünk. Az eszköz neve *Történeti Adatbázis* (a fájl neve: `torteneti_adatbazis.html`), és az Access-ben megismert relációs logikát egyszerűsített formában, sablonokra és EAV-modellre építve teszi elérhetővé.

## Miért egy újabb eszköz?

Az Access tanulságai – elsődleges kulcs, idegen kulcs, kapcsolatok, referenciális integritás – **változatlanul fontosak**. A Történeti Adatbázis ugyanezt a logikát követi, de két olyan problémára ad választ, amellyel a hallgatók az előző fejezetekben találkoztak:

**1. Telepítés nélkül, bárhol futtatható.** Az Access csak Windows rendszeren, saját licenccel érhető el. Az eszköz egyetlen HTML-fájl, amelyet a saját gépünkön (vagy akár pendrive-on) megnyitva bármelyik böngésző elindít. Nincs telepítés, nincs licencdíj, nem kell rendszergazda.

**2. Levéltári és történeti forrásokra szabott sémák.** Az eszköz négy kész sablont kínál (prozopográfia, levelezés, intézmény, anyakönyv), amelyek a leggyakoribb forrástípusok modellezését készen hozzák. Az Access-ben minden táblát és mezőt magunknak kell megterveznünk; itt el lehet indulni egy működő sémából, és azon finomítani.

A fejezet második felében egy konkrét gyakorlaton – az **MTA alapítói és első nemzedéke (1825–1850)** adatsor betöltésén – vesszük végig az eszköz használatát.

## Az eszköz és a gyakorló fájlok letöltése

A fejezet két fájlja letöltésre kattintható formában:

- [torteneti_adatbazis.html](torteneti_adatbazis.html) – a Történeti Adatbázis eszköz (kb. 140 kB, egyetlen HTML-fájl)
- [MTA_alapitok_es_elso_nemzedek_1825-1850.xlsx](MTA_alapitok_es_elso_nemzedek_1825-1850.xlsx) – 50 rekordos demonstrációs adatsor prozopográfiai mintaként (az MTA alapítói és első nemzedéke)

**A letöltéshez:** jobb kattintás a linken → „Hivatkozás mentése másként” (Chrome / Firefox / Edge). A HTML-fájlt célszerű egy dedikált mappába tenni – a böngésző helyben fogja tárolni az adatainkat ehhez a fájlhoz.

**Indítás:** kettős kattintás a `torteneti_adatbazis.html` fájlra, vagy húzzuk be egy megnyitott böngészőablakba. Nincs szükség internetkapcsolatra a működéshez (kivéve a térképes vizualizációt).

## Az eszköz felépítése

Az eszköz a fejléc alatt **hat nézetre** tagolódik (felső fülek):

- **Rekordok** – kártyás lista az entitásokkal, keresővel. Itt tekintjük meg és szerkesztjük a rekordjainkat.
- **Adatbevitel** – egyszerre egy új rekord felvitele űrlapon keresztül, vagy több rekord **CSV/Excel-importálása** varázslóval.
- **Harmonizálás** – a nyers (pl. Excelből érkezett) értékek egységesítése. Pl. „r.k.”, „rk.”, „római katolikus” mind → „Római katolikus”.
- **Kapcsolatok** – két rekord közötti viszony rögzítése (kolléga, tanítvány, házastárs, szülő-gyerek stb.).
- **Vizualizáció** – négy típus: idővonal, hálózat, statisztika és térkép.
- **Súgó** – 11 fejezetes, kereshető beépített súgó.

### Séma, entitás, attribútum, kapcsolat

Az eszköz egyszerűsített **EAV-modellt** (Entity-Attribute-Value) használ. Ebben a modellben:

- Minden **rekord** egy entitás (pl. egy személy, egy levél, egy intézmény). A rekordnak van néhány kötött, séma által meghatározott mezője (név, születési év, halálozási év, nem, forrás, megjegyzés).
- Minden entitás mellé **tetszőleges számú attribútum** felvehető kulcs–érték párként. Pl. Foglalkozás = „ügyvéd”, Vallás = „református”, Lakóhely = „Debrecen”. Az attribútum-típusok listája a beállításokban bővíthető.
- A **kapcsolatok** két entitás közötti élek, típusmegjelöléssel és forrás-hivatkozással.

Ez az Access-ben megismert három-táblás logika, csak összevonva: a kötött séma az Access fő tábláját helyettesíti, az attribútumok egy generikus kulcs-érték tábla, a kapcsolatok pedig egy önmagára hivatkozó kapcsolati tábla.

### Sablonok

A Beállítások ▸ Séma ablakban négy kész sablon választható:

| Sablon | Mit tart nyilván? | Mezők |
| --- | --- | --- |
| **Prozopográfia** | személyeket | név, születési év, halálozási év, nem, forrás, megjegyzés |
| **Levelezés** | leveleket | cím, dátum, feladó, címzett, forrás, megjegyzés |
| **Intézmény** | intézményeket | név, alapítás éve, megszűnés éve, típus, forrás, megjegyzés |
| **Anyakönyv** | keresztelési / házassági / halotti bejegyzéseket | név, esemény dátuma, esemény típusa, hely, forrás, megjegyzés |

A sablon csak a kiindulópont – minden mezőt lehet átnevezni, új mezőt hozzáadni vagy elhagyni a Beállítások ablakban, még az első rekord felvitele előtt.

## Gyakorlat: az MTA alapítóinak adatsora

A következő lépéseket az `MTA_alapitok_es_elso_nemzedek_1825-1850.xlsx` fájlon demonstráljuk. Ez egy 50 rekordos prozopográfiai adatsor: 4 alapító, 4 kezdeti tisztségviselő, az 1831-ben választott első 23 rendes tag és a további 19 fő, akiket 1831 és 1850 között választottak meg az akadémia tagjává.

### 0. lépés: az eszköz megnyitása

1. Kattintsunk kétszer a letöltött `torteneti_adatbazis.html` fájlra – megnyílik a böngészőben.
2. Első indításkor egy üdvözlő képernyő fogad – válasszuk a **Prozopográfia** sablont.
3. A Beállítások gombra kattintva ellenőrizhetjük a séma mezőit. Ezeket most nem kell módosítani.

### 1. lépés: az Excel betöltése CSV-importtal

1. Az **Adatbevitel** fülön kattintsunk a **CSV/Excel import** gombra.
2. Tallózzuk ki az `MTA_alapitok_es_elso_nemzedek_1825-1850.xlsx` fájlt.
3. A varázsló **első lépésében** megjelenik az oszlopok előnézete. Ellenőrizzük, hogy az ékezetek helyesek (ha kérdőjelek jelennek meg, az Excel mentésénél válasszuk „CSV UTF-8” formátumot).
4. A **második lépésben** az eszköz automatikusan (az `autoMap` funkcióval) megpróbálja összerendelni az Excel-oszlopokat a séma mezőivel és az attribútum-típusokkal. A demonstrációs fájl oszlopnevei pontosan egyeznek a séma mezőinek nevével, így **minden hozzárendelés automatikusan helyes lesz**:
    - „Teljes név” → névmező
    - „Születési év” → születési év mező
    - „Halálozási év” → halálozási év mező
    - „Nem” → nem mező
    - „Forrás” → forrás mező
    - „Megjegyzés” → megjegyzés mező
    - A többi oszlop (Születési hely, Foglalkozás, Vallás, MTA szerep, MTA osztály, Választás éve) **attribútum-típusként** kerül be.
5. A **harmadik lépésben** kattintsunk az **Importálás** gombra. A Rekordok fülre lépve az 50 akadémikus kártyái jelennek meg.

### 2. lépés: mentés (fontos!)

Kattintsunk a fejléc **Mentés ▸ JSON** gombjára, és mentsük le a fájlt pl. `mta_munkamenet_1.json` néven. Ez a biztonsági hálónk: ha bezárjuk a böngészőt, kitöröljük a sütiket, vagy másik gépen szeretnénk folytatni, ebből a fájlból a **Betöltés** gombbal bármikor visszatölthető minden rekord. **Az eszköz a böngésző localStorage-ába ment – egy felületes süti-takarítás minden adatunkat törli, ezért JSON-mentés nélkül nem szabad kilépni.**

### 3. lépés: harmonizálás

A **Harmonizálás** fülre lépve látjuk, hogy a Vallás attribútum-típus alatt **10 különböző írásmód** szerepel ugyanarra a három felekezetre: „r.k.”, „r.kat.”, „rk”, „r. kat.”, „római katolikus”, „katolikus”, „ref.”, „református”, „ev.”, „evangélikus”. Ez szándékos: egy valódi történeti adatsorban ez a normál helyzet.

1. Kattintsunk az **Automatikus kitöltés (autoFill)** gombra: minden nyers érték harmonizált mezője feltöltődik önmagával.
2. Most egyesítsük a variánsokat: írjuk át pl. az „r.k.”, „r.kat.”, „rk”, „r. kat.”, „katolikus” harmonizált értékét **egységesen** „Római katolikus”-ra. Ugyanígy a két református és a két evangélikus variánst.
3. Mentsünk JSON-t (Mentés ▸ JSON).

Ugyanezt a lépést érdemes a Foglalkozás attribútum-típusra is elvégezni (az adatsorban 26 különböző foglalkozás-leírás szerepel – ezeket célszerű néhány fő kategóriára redukálni: politikus, irodalmár, tudós, egyházi, orvos, jogász, főnemes). Figyeljünk arra, hogy egyes esetekben ugyanaz a foglalkozás különböző írásmódokkal jelenik meg (pl. „politikus” / „pol.”, „költő” / „poéta”, „nyelvész” / „philologus”) – ezeket is egységesíteni kell.

### 4. lépés: kapcsolatok felvétele

A **Kapcsolatok** fülön vegyünk fel néhány ismert, forrásokkal alátámasztott kapcsolatot. Néhány javaslat:

- **Kazinczy Ferenc** → *Tanítvány* → **Kölcsey Ferenc** (forrás: Kazinczy-levelezés)
- **Kazinczy Ferenc** → *Tanítvány* → **Toldy Ferenc**
- **Vörösmarty Mihály** ↔ *Kolléga* ↔ **Bajza József** (forrás: Athenaeum triumvirátus)
- **Kisfaludy Sándor** ↔ *Szülő/gyerek vagy testvér* ↔ **Kisfaludy Károly** (testvérek)
- **Eötvös József** ↔ *Kolléga* ↔ **Szalay László** (forrás: Centralisták)

Minden kapcsolatnál adjuk meg a forrás mezőt is – ez az, ami a mi adatbázisunkat szakmailag használhatóvá teszi.

### 5. lépés: vizualizáció

A **Vizualizáció** fülön négy nézet közül választhatunk:

- **Idővonal** (D3) – az egyes akadémikusok életútja időrendben.
- **Hálózat** (D3 force-directed gráf) – a bevitt kapcsolatok hálózati megjelenítése.
- **Statisztika** – a harmonizált attribútumok eloszlása (pl. vallási megoszlás, foglalkozási megoszlás).
- **Térkép** (Leaflet + beépített helynév-szótár) – a születési/lakó helyek térképre vetítve. Az eszköz egy beépített történelmi magyar/Kárpát-medencei helynév-szótárral dolgozik (ékezet-független egyezéssel), valamint elfogadja a `47.49, 19.04` formátumú közvetlen koordinátákat is. Az alaptérkép-csempék betöltéséhez internetkapcsolat szükséges; ha egy helynév nincs a szótárban, a térkép alatti figyelmeztetésben felsorolódik.

### 6. lépés: publikálás

Ha az adatbázis készen van, a fejléc **Publikálás** gombjával véglegesíthetjük. A modálban meg kell adni a készítő nevét és intézményét. A publikált állapot **nem feloldható** – ha később javítani szeretnénk, az utolsó JSON-mentést kell újra betöltenünk egy friss példányba, ott javítani, majd újra publikálni.

## Mikor használjuk az eszközt, és mikor mást?

```
                   KEZELHETŐ-E EXCELBEN?
                            |
             +--------------+--------------+
             |                             |
            IGEN                           NEM (entitások közötti
             |                             hálózatot szeretnénk,
       Excel elég                          vagy attribútum-értékek
                                           harmonizálására van szükség)
                                                    |
                                +-------------------+-------------------+
                                |                                       |
              KIS PROJEKT, LEVÉLTÁRI JELLEG            NAGY KORPUSZ, TÖBB FELHASZNÁLÓ,
              PROZOPOGRÁFIA, KUTATÁSTÖRTÉNET           SZIGORÚ SZERVEREKKEL
                                |                                       |
                    TÖRTÉNETI ADATBÁZIS                          ACCESS VAGY SQL
                    (EZ AZ ESZKÖZ)
```

Egyszerű ökölszabály:

- **Excel**: egyszerű tabuláris adat, képletek, gyors áttekintés.
- **Történeti Adatbázis (ez a HTML-eszköz)**: egyéni prozopográfiai kutatás, kapcsolati és földrajzi vizualizáció, harmonizálás, publikálható eredmény.
- **Access**: intézményi környezetben, több felhasználóval közösen karbantartott nyilvántartások, összetett lekérdezések.
- **SQL-alapú szerver** (MySQL, PostgreSQL): nagy adatmennyiség, webes kereső, többen írnak ugyanabba az adatbázisba.

Mindhárom eszköz ugyanazt az adatmodellezési logikát követi – a különbség a **méret, a megoszthatóság és a lekérdezési erő**, nem pedig az elvekben.

## Önálló feladatok

### Feladat 1: saját prozopográfiai adatbázis

Válasszunk egy 20-30 fős kört a saját szakterületünkről (pl. a szakdolgozat-témánkhoz kapcsolódó hivatalnokok, egy település tanítói egy adott évtizedben, egy tudóskör tagjai), és építsük fel a Történeti Adatbázisban. Minimum 4 attribútum-típus, minimum 5 kapcsolat.

### Feladat 2: harmonizálási gyakorlat

A letöltött MTA-adatsor Foglalkozás attribútum-típusában a 26 nyers érték redukálása 6–8 kanonikus kategóriára. Indokoljuk, hogy mely döntések voltak nehezek (pl. jogász-politikus határeset, vagy hogy a „drámaíró” és „regényíró” egybevonható-e az „irodalmár” kategóriába).

### Feladat 3: forráskritika kapcsolatoknál

A Kapcsolatok fülön vegyünk fel 10 új kapcsolatot – mindegyiknél **pontos forráshivatkozással** (akadémikus életrajz, levelezéskötet, szakirodalom). Reflektáljunk: mely kapcsolatokat tudtunk egyértelműen alátámasztani, melyeknél csak „valószínű”?

### Feladat 4: vizualizáció-kritika

Nézzük meg ugyanazt az adathalmazt mind a négy vizualizációban. Melyik mit mutat meg jól, és mit rejt el? Egy 1 oldalas rövid reflexió.

## Gyakori hibák és megoldások

### „Az adataim eltűntek”

**Ok:** a böngésző localStorage-ából mindent töröl a sütik/előzmények tisztítása, vagy másik böngészőben nyitottuk meg a HTML-t.

**Megoldás:** **mindig** mentsünk JSON-t óra végén, és nyissuk meg a fájlt mindig ugyanabban a böngészőben. Elveszett adatok esetén a legutóbbi JSON-mentést a Betöltés gombbal kell visszatölteni.

### „Ugyanazt a rekordot kétszer importálom”

**Ok:** a CSV-import nem vizsgál duplikátumot, az autoMap megbízik a fejlécekben.

**Megoldás:** új importálás előtt ürítsük ki a Rekordok listát (Beállítások ▸ Rekordok törlése), vagy kezeljük két külön projektként és utólag tisztítsuk a listát.

### „Két HTML-fájlt is megnyitottam ugyanabban a böngészőben, és felülírták egymást”

**Ok:** a Történeti Adatbázis és a hasonló nevű `prozopograf.html` **ugyanazt a localStorage-kulcsot használja** (`rekordtar_v1`). Ha mindkettővel dolgozunk ugyanabban a böngészőben, felülírhatják egymás adatait.

**Megoldás:** egy projektet egyféle eszközben tartsunk, vagy használjunk külön böngészőt (pl. egyik munkához Chrome, másikhoz Firefox).

### „Nem találom a Publikálás gombot”

**Ok:** az adatbázis jelenleg Zárolva van (csak olvasható állapot).

**Megoldás:** nyomjuk meg a **Szerkesztés** gombot a zárolás feloldására. A véglegesen publikált állapotot viszont **nem lehet** feloldani – ilyenkor új példányt kell nyitni az utolsó JSON-mentésből.

### „A térkép üres”

**Ok:** a leggyakoribb eset, hogy a helyadat-mező dropdown egy olyan mezőre / attribútumra mutat, amiben egyetlen rekordban sincs érték (pl. alapértelmezésben a Lakóhely attribútumra áll, de a CSV-importból csak a Születési hely oszlop került be). Ritkábban: az adatok megvannak, de a helynevek nincsenek a beépített szótárban.

**Megoldás:** a dropdown most már mutatja az egyes mezők kitöltöttségét („· 48 érték" vagy „· üres"), így egy pillantás alatt kiderül, melyiket érdemes választani. A térkép alatt megjelenő narancssárga figyelmeztetés szintén javaslatot ad. A nem azonosított helyekhez a cellába koordinátát is be lehet írni `47.49, 19.04` formátumban.

## A fejezet letölthető anyagai – összefoglaló

- [torteneti_adatbazis.html](torteneti_adatbazis.html) – maga az eszköz
- [MTA_alapitok_es_elso_nemzedek_1825-1850.xlsx](MTA_alapitok_es_elso_nemzedek_1825-1850.xlsx) – demonstrációs Excel-adatsor
