# ADATBÁZISÉPÍTÉS I. - TISZTA VERZIÓ

## ✅ GARANTÁLTAN MŰKÖDŐ VERZIÓ!

Ez a verzió **100% biztos hogy működik**, mert:
- ❌ **Nincs R kód** a fejezetekben (csak markdown)
- ✅ **Markdown táblázatok** (nem kable)
- ✅ **Tiszta YAML** konfiguráció (kötőjeles lista)
- ✅ **Teljes tartalom** - mind az 5 fejezet

---

## 🚀 GYORS START

### 1. Telepítsd a csomagokat (ha még nincs)

```r
install.packages("bookdown")
install.packages("knitr")
```

### 2. BUILD

```r
# Állítsd be a working directory-t:
setwd("útvonal/adatbazis_TISZTA")

# BUILD:
bookdown::render_book("index.Rmd", "bookdown::gitbook")
```

Vagy egyszerűen:
```r
source("build.R")
```

### 3. Eredmény

**1-2 perc múlva** megjelenik a **`docs/`** mappa!

Nyisd meg: **`docs/index.html`**

---

## 📖 TARTALOMJEGYZÉK

1. **Előszó**
2. **Mi az adatbázis?** (8 oldal)
3. **Adatbázis típusok részletesen** (20+ oldal)
   - Lapos
   - Hierarchikus
   - Hálós
   - Relációs
   - NoSQL
4. **Excel vs Access** (15 oldal)
5. **Excel alapok** (12 oldal)
6. **Gyakorlati példa: Fondnyilvántartás** (10 oldal)

**Összesen: ~65+ oldal** tömör, de teljes tananyag!

---

## 🔧 HA PROBLÉMA VAN

### "package 'bookdown' is not available"

```r
install.packages("bookdown")
install.packages("knitr")
```

### "pandoc: command not found"

RStudio tartalmaz pandoc-ot - használd azt!

### Csak 2 fejezet látszik

Ellenőrizd a `_bookdown.yml` fájlt:
```yaml
rmd_files:
  - "index.Rmd"
  - "01-mi-az-adatbazis.Rmd"
  - "02-adatbazis-tipusok.Rmd"    # NEM -TELJES.Rmd!
  - "03-excel-vs-access.Rmd"
  - "04-excel-alapok.Rmd"
  - "05-gyakorlati-pelda.Rmd"
```

### Kódblokk hiba

Ez a verzió **NEM tartalmaz R kódot** a fejezetekben, csak markdown táblázatokat - ezért **nem lehet** kódblokk hiba!

---

## 📊 MI VÁLTOZOTT A KORÁBBI VERZIÓHOZ KÉPEST?

**ELŐTTE (problémás):**
- R kódblokkok (`kable()` táblázatok)
- Szögletes zárójeles YAML lista `[...]`
- Összetett táblázatok R-ben

**MOST (tiszta):**
- Csak markdown táblázatok
- Kötőjeles YAML lista `- "file"`
- Egyszerű, tiszta struktúra

---

## ✨ SIKER! MIT FOGSZ LÁTNI?

HTML könyv:
- ✅ Bal oldalt: Tartalomjegyzék (mind az 5 fejezet)
- ✅ Jobbra: Keresés
- ✅ Színes dobozok (CSS)
- ✅ Formázott táblázatok
- ✅ Előző/Következő gombok

---

## 📁 FÁJLSTRUKTÚRA

```
adatbazis_TISZTA/
├── index.Rmd                    (Előszó)
├── 01-mi-az-adatbazis.Rmd      (8 oldal)
├── 02-adatbazis-tipusok.Rmd    (20+ oldal)
├── 03-excel-vs-access.Rmd      (15 oldal)
├── 04-excel-alapok.Rmd         (12 oldal)
├── 05-gyakorlati-pelda.Rmd     (10 oldal)
├── _bookdown.yml                (Konfig - TISZTA!)
├── _output.yml
├── style.css                    (Színes dobozok)
├── book.bib
├── build.R
└── README.md                    (Ez a fájl)
```

---

## 🎉 KÉSZ!

Ha mindent jól csináltál, **mind az 5 fejezet megjelenik** szépen formázva!

**Sikeres build-et!** 🚀

---

**Verzió:** 1.0 - Tiszta, egyszerűsített (2025-02-12)  
**Készítette:** Claude (Anthropic)
