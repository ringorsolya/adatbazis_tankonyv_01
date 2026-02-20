# Bookdown HTML könyv fordítása
# Ez a szkript lefordítja az Rmd fájlokat HTML könyv formátumba

# Szükséges csomagok telepítése (ha még nincsenek)
if (!requireNamespace("bookdown", quietly = TRUE)) {
  install.packages("bookdown")
}

if (!requireNamespace("knitr", quietly = TRUE)) {
  install.packages("knitr")
}

# Könyvtár beállítása
setwd("/home/claude/adatbazis_konyv")

# HTML könyv renderelése
bookdown::render_book("index.Rmd", "bookdown::gitbook")

cat("\n✓ HTML könyv elkészült!\n")
cat("  Hely: /home/claude/adatbazis_konyv/_book/\n")
cat("  Megnyitás: _book/index.html\n")
