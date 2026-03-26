# Második tábla létrehozása

Most létrehozzuk a második táblánkat: a **Látogatások** táblát. Ez rögzíti, hogy melyik kutató mikor járt nálunk.

## Miért kell második tábla?

**Probléma egyetlen táblával:**

Ha minden látogatást a Kutatók táblában tárolnánk: - Kovács Anna adatai többször ismétlődnének - Nehéz lenne karbantartani

**Megoldás: Két tábla!**

```
tbl_Kutatók (KutatóID, Név, Email...)
  └── kapcsolat
      tbl_Látogatások (LátogatásID, KutatóID, Dátum, KértAnyag)
```

## Látogatások tábla létrehozása

**Létrehozás → Táblatervezés**

**Mezők:**

| Mező | Adattípus | Leírás |
| --- | --- | --- |
| LátogatásID | AutoNumber | Elsődleges kulcs |
| KutatóID | Szám (Hosszú egész) | **Idegen kulcs** |
| LátogatásDátuma | Dátum/idő | Mikor járt nálunk |
| KértAnyag | Hosszú szöveg | Mit keresett |

**Mentés:** `tbl_Látogatások`

## Adatok rögzítése

Vigyünk fel néhány látogatást!

**1. látogatás** (Kovács Anna):

```
LátogatásID: (automatikus: 1)
KutatóID: 1
LátogatásDátuma: 15/01/2024
KértAnyag: Minisztertanácsi jegyzőkönyvek
```

**2. látogatás** (Nagy Péter):

```
KutatóID: 2
LátogatásDátuma: 20/01/2024  
KértAnyag: Nemzeti Színház iratai
```

**Fontos:** A KutatóID-nek léteznie kell a tbl\_Kutatók táblában! Később kapcsolatot hozunk létre, amely ezt ellenőrzi.
