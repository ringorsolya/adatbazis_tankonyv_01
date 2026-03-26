# (PART) Access alapok levéltárosoknak {-}

# Excel vagy Access? Mikor melyiket használjuk?

## Bevezetés

Mielőtt nekikezdenénk az Access használatának, fontos megértenünk: **mikor érdemes Access-t használni, és mikor maradjunk az Excelnél?** Mindkét programnak megvan a maga helye a levéltári munkában, és nem egymás helyettesítői, hanem kiegészítői.

## Az Excel előnyei és hátrányai

### Mikor válasszuk az Excelt?

Az **Excel** táblázatkezelő program, amely kiválóan alkalmas:

- **Egyszerű listák, táblázatok** kezelésére
- **Számítások, statisztikák** készítésére
- **Gyors elemzésekre** (pl. pivot táblák)
- **Grafikonok, diagramok** készítésére
- **Egyszerű adatbevitelre**, ahol nincs sok ismétlődő adat
- **Egyszeri feladatokra** (pl. éves statisztika, egyszeri leltár)

### Példák levéltári munkában:

- Éves látogatottsági statisztika
- Digitalizálási költségvetés számítása
- Gyors összesítések (pl. hányan látogattak februárban?)
- Munkatervek, időbeosztások
- Egyszerű kutatói listák

### Az Excel korlátai

Az Excel **nem igazán alkalmas**, ha:

- Több ezer sornyi adatot kezelünk
- Több táblázat között van kapcsolat (pl. kutatók és látogatásaik)
- Ugyanaz az adat több helyen ismétlődik
- Több ember egyszerre dolgozik ugyanazokon az adatokon
- Bonyolult lekérdezésekre van szükség
- Adatintegritást (hibamentes adatbevitelt) szeretnénk garantálni

## Az Access előnyei és hátrányai

### Mikor válasszuk az Access-t?

Az **Access** relációs adatbázis-kezelő, amely ideális:

- **Több összekapcsolódó tábla** kezeléséhez
- **Nagy adatmennyiség** (több ezer-tízezer rekord) tárolására
- **Ismétlődő adatok hatékony kezelésére** (pl. intézménynevek, kutatónevek)
- **Összetett lekérdezésekre** (pl. “Ki járt nálunk tavaly novemberben az ELTE-ről?”)
- **Adatintegritás biztosítására** (nem lehet rossz adatot bevinni)
- **Többfelhasználós környezetben** (hálózaton több ember dolgozhat egyszerre)

### Példák levéltári munkában:

- Kutatói nyilvántartás + látogatások + kutatási kérelmek
- Nyilvántartás (fondok → állagok → iratok)
- Kölcsönzési rendszer
- Digitalizálási munkafolyamat-követés
- Raktári helyek és iratok kapcsolata

### Az Access korlátai

Az Access **nem igazán alkalmas**, ha:

- Gyors, egyszeri számításokra van szükség
- Grafikonokat, diagrammokat szeretnénk készíteni
- Egyszerű, néhány soros listát kezelünk
- Nincs időnk megtanulni a használatát

## Összehasonlító táblázat

| Szempont | Excel | Access |
| --- | --- | --- |
| **Adatszerkezet** | Egyszerű, egyetlen táblázat | Több összekapcsolt tábla |
| **Adatmennyiség** | Néhány száz-ezer sor | Több tízezer-millió rekord |
| **Kapcsolatok** | Nehezen kezelhető | Könnyű és hatékony |
| **Statisztika, számítás** | Kiváló | Korlátozott |
| **Grafikonok** | Kiváló | Korlátozott |
| **Lekérdezések** | Korlátozott | Kiváló |
| **Adatintegritás** | Könnyen elrontható | Garantálható |
| **Többfelhasználós** | Problémás | Támogatott |
| **Tanulási görbe** | Könnyű | Meredekebb |

## Gyakorlati döntési fa

Amikor eldöntjük, melyik programot használjuk, kövessük ezt a döntési fát:

```
Kérdés 1: Van több, egymáshoz kapcsolódó táblánk?
  │
  ├─ IGEN → ACCESS
  │
  └─ NEM → Kérdés 2: Ezer sornál több adatunk lesz?
           │
           ├─ IGEN → ACCESS
           │
           └─ NEM → Kérdés 3: Többen egyszerre dolgoznak rajta?
                    │
                    ├─ IGEN → ACCESS
                    │
                    └─ NEM → Kérdés 4: Számításokat, grafikonokat készítünk?
                             │
                             ├─ IGEN → EXCEL
                             │
                             └─ NEM → EXCEL vagy ACCESS
```

## Konkrét levéltári példák

### 1. példa: Éves látogatási statisztika

**Feladat:** Összesíteni, hogy havonta hányan látogatták a levéltárat 2024-ben.

**Megoldás:** **EXCEL**

**Indoklás:** Egyszerű összesítés, egy táblázat, grafikonok kellenek. Az Excel pivot táblája erre tökéletes.

### 2. példa: Kutatói nyilvántartó rendszer

**Feladat:** Nyilvántartani a kutatókat, látogatásaikat, kutatási kérelmeiket, és azt, hogy melyik kutatóanyagot kiknek szolgáltattuk ki.

**Megoldás:** **ADATBÁZIS** (**ACCESS)**

**Indoklás:**

- Több tábla szükséges:
  - Kutatók (név, email, intézmény)
  - Látogatások (ki, mikor jött)
  - Kutatási kérelmek (ki, mit kért)
  - Iratanyagok (mit szolgáltattunk ki)
- Kapcsolatok: egy kutatónak több látogatása, több kérelme lehet
- Lekérdezések: “Ki kutatott az elmúlt hónapban?”

### 3. példa: Digitalizálási költségvetés

**Feladat:** Ki kell számolni, hogy mennyi egy digitalizálási projekt költsége (iratok száma × egységár, különböző kategóriákban).

**Megoldás:** **EXCEL**

**Indoklás:** Számítások, összegzések, esetleg grafikon. Egyszerű táblázat, nincs kapcsolat más táblákkal.

### 4. példa: Állomány-nyilvántartó rendszer

**Feladat:** Nyilvántartani a levéltár teljes állományát: fondok → állagok → sorozatok → iratok, valamint hozzájuk kapcsolva a digitalizálás státuszát, raktári helyüket.

**Megoldás:** **ADATBÁZIS** (**ACCESS)**

**Indoklás:**

- Hierarchikus struktúra (fond tartalmaz állagokat, állag tartalmaz iratokat)
- Minden szinten más-más metaadatok (fond leírása, állag keletkezési évei, irat címe)

## Együttműködés: Excel és Access

> **Fontos:** Az Excel és az Access **nem** ellenségek! Gyakran együtt használjuk őket:

- Az Access-ben **tároljuk** az adatokat (kutatók, látogatások stb.)
- Az Excelbe **exportáljuk** őket elemzéshez, grafikonokhoz
- Az Excelben előkészített adatokat **importáljuk** Access-be

**Példa munkafolyamat:**

1. Kutatói adatokat vezetjük Access-ben (sok kutató, több látogatás)
2. Lekérdezést készítünk: “2024-es látogatások havi bontásban”
3. Exportáljuk Excelbe
4. Excelben készítünk grafikont az éves jelentéshez
