# ============================================================
# AVV KI-Redaktionshelfer — Git Setup & Push
# Einmalig ausfuehren: Rechtsklick -> "Mit PowerShell ausfuehren"
# ============================================================

$ErrorActionPreference = "Stop"

# Zielordner fuer das geklonte Repo
$repoUrl   = "https://github.com/MrDino83/AVV.git"
$repoDir   = "C:\Repos\AVV"
$sourceDir = "C:\Users\mmatt\Astronomische Vereinigung Vulkaneifel am Hohen List e.V\Öffentlichkeitsarbeit - Dokumente\Content und Social Media\KI-Redaktionshelfer"

Write-Host ""
Write-Host "AVV Git Setup" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

# 1. Git pruefen
Write-Host "`n[1/5] Pruefe Git..." -ForegroundColor Yellow
try {
    $gitVersion = git --version
    Write-Host "     OK: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "     FEHLER: Git nicht gefunden." -ForegroundColor Red
    Write-Host "     Bitte installieren: https://git-scm.com/download/win" -ForegroundColor Red
    Write-Host "     Danach dieses Skript erneut ausfuehren." -ForegroundColor Red
    Read-Host "`nDruecke Enter zum Beenden"
    exit 1
}

# 2. Repo klonen oder aktualisieren
Write-Host "`n[2/5] Repo vorbereiten..." -ForegroundColor Yellow
if (Test-Path "$repoDir\.git") {
    Write-Host "     Repo existiert bereits — fuehre git pull aus..." -ForegroundColor Gray
    Set-Location $repoDir
    git pull
} else {
    Write-Host "     Klone Repo nach $repoDir ..." -ForegroundColor Gray
    New-Item -ItemType Directory -Path $repoDir -Force | Out-Null
    git clone $repoUrl $repoDir
    Set-Location $repoDir
}
Write-Host "     OK" -ForegroundColor Green

# 3. Zielstruktur anlegen
Write-Host "`n[3/5] Erstelle Zielstruktur im Repo..." -ForegroundColor Yellow
$targetRoot  = "$repoDir\KI-Redaktionshelfer"
$targetTrain = "$repoDir\KI-Redaktionshelfer\trainingsdateien"

New-Item -ItemType Directory -Path $targetRoot  -Force | Out-Null
New-Item -ItemType Directory -Path $targetTrain -Force | Out-Null
Write-Host "     OK: KI-Redaktionshelfer/" -ForegroundColor Green
Write-Host "     OK: KI-Redaktionshelfer/trainingsdateien/" -ForegroundColor Green

# 4. Dateien kopieren
Write-Host "`n[4/5] Kopiere Dateien..." -ForegroundColor Yellow

# index.html -> KI-Redaktionshelfer/index.html
$indexSrc = "$sourceDir\index.html"
if (Test-Path $indexSrc) {
    Copy-Item $indexSrc "$targetRoot\index.html" -Force
    Write-Host "     OK: index.html" -ForegroundColor Green
} else {
    Write-Host "     WARNUNG: index.html nicht gefunden" -ForegroundColor DarkYellow
}

# README.md -> KI-Redaktionshelfer/README.md
$readmeSrc = "$sourceDir\README.md"
if (Test-Path $readmeSrc) {
    Copy-Item $readmeSrc "$targetRoot\README.md" -Force
    Write-Host "     OK: README.md" -ForegroundColor Green
}

# Alle .md Trainingsdateien -> KI-Redaktionshelfer/trainingsdateien/
$mdFiles = @(
    "AVV_Beitragscheck_Sprachstil.md",
    "AVV_Beitragscheck_MenschlicheSprache.md",
    "AVV_Beitragscheck_TagTaxonomie.md",
    "AVV_Beitragscheck_Instagram.md",
    "AVV_Beitragscheck_Facebook.md",
    "AVV_Beitragscheck_Bluesky.md",
    "AVV_Beitragscheck_Mastodon.md",
    "AVV_Beitragscheck_Pressemitteilung.md"
)

foreach ($file in $mdFiles) {
    $src = "$sourceDir\$file"
    if (Test-Path $src) {
        Copy-Item $src "$targetTrain\$file" -Force
        Write-Host "     OK: trainingsdateien/$file" -ForegroundColor Green
    } else {
        Write-Host "     WARNUNG: $file nicht gefunden" -ForegroundColor DarkYellow
    }
}

# 5. Git commit & push
Write-Host "`n[5/5] Git commit & push..." -ForegroundColor Yellow
Set-Location $repoDir

git add "KI-Redaktionshelfer/"

$status = git status --porcelain
if ($status) {
    git commit -m "KI-Redaktionshelfer: index.html + 8 Trainingsdateien (Wizard v2.0)"
    git push
    Write-Host "     OK: Gepusht zu GitHub" -ForegroundColor Green
} else {
    Write-Host "     Keine Aenderungen — nichts zu pushen." -ForegroundColor Gray
}

# Ergebnis
Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "Fertig! Repo-Struktur:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  C:\Repos\AVV\" -ForegroundColor White
Write-Host "  └── KI-Redaktionshelfer\" -ForegroundColor White
Write-Host "      ├── index.html" -ForegroundColor White
Write-Host "      ├── README.md" -ForegroundColor White
Write-Host "      └── trainingsdateien\" -ForegroundColor White
Write-Host "          ├── AVV_Beitragscheck_Sprachstil.md" -ForegroundColor White
Write-Host "          ├── AVV_Beitragscheck_MenschlicheSprache.md" -ForegroundColor White
Write-Host "          ├── AVV_Beitragscheck_TagTaxonomie.md" -ForegroundColor White
Write-Host "          ├── AVV_Beitragscheck_Instagram.md" -ForegroundColor White
Write-Host "          ├── AVV_Beitragscheck_Facebook.md" -ForegroundColor White
Write-Host "          ├── AVV_Beitragscheck_Bluesky.md" -ForegroundColor White
Write-Host "          ├── AVV_Beitragscheck_Mastodon.md" -ForegroundColor White
Write-Host "          └── AVV_Beitragscheck_Pressemitteilung.md" -ForegroundColor White
Write-Host ""
Write-Host "GitHub Pages: https://mrdino83.github.io/AVV/KI-Redaktionshelfer/" -ForegroundColor Cyan
Write-Host ""

Read-Host "Druecke Enter zum Beenden"
