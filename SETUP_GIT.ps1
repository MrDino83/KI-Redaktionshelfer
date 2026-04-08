# ============================================================
# AVV KI-Redaktionshelfer — Git Sync & Push
# Ausfuehren: Rechtsklick -> "Mit PowerShell ausfuehren"
# Version: 2.1 — Stand: April 2026
# ============================================================

$ErrorActionPreference = "Stop"

# Pfade — automatisch aus dem Speicherort dieser Datei ermittelt
$repoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoUrl = "https://github.com/MrDino83/KI-Redaktionshelfer.git"

Write-Host ""
Write-Host "AVV KI-Redaktionshelfer — Git Sync v2.1" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "Repo-Pfad: $repoDir" -ForegroundColor Gray

# ── 1. Git pruefen ────────────────────────────────────────────
Write-Host "`n[1/4] Pruefe Git..." -ForegroundColor Yellow
try {
    $gitVersion = git --version
    Write-Host "     OK: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "     FEHLER: Git nicht gefunden." -ForegroundColor Red
    Write-Host "     Bitte installieren: https://git-scm.com/download/win" -ForegroundColor Red
    Read-Host "`nDruecke Enter zum Beenden"
    exit 1
}

# ── 2. Repo pruefen ───────────────────────────────────────────
Write-Host "`n[2/4] Pruefe Repo..." -ForegroundColor Yellow
Set-Location $repoDir

if (-not (Test-Path "$repoDir\.git")) {
    Write-Host "     Kein Git-Repo gefunden — initialisiere..." -ForegroundColor DarkYellow
    git init
    git remote add origin $repoUrl
    Write-Host "     OK: Repo initialisiert und Remote gesetzt" -ForegroundColor Green
} else {
    Write-Host "     OK: Git-Repo vorhanden" -ForegroundColor Green
    Write-Host "     Fuhre git pull aus..." -ForegroundColor Gray
    git pull origin master 2>&1 | Write-Host
}

# ── 3. Dateistruktur validieren ───────────────────────────────
Write-Host "`n[3/4] Validiere Dateistruktur..." -ForegroundColor Yellow

$erwarteteOrdner = @(
    "Training",
    "Training\Content",
    "Training\Content\Social-Media",
    "Training\Content\Social-Media\Instagram",
    "Training\Content\Social-Media\Facebook",
    "Training\Content\Social-Media\Mastodon",
    "Training\Content\Social-Media\Bluesky",
    "Training\Content\Website",
    "redaktionshelfer"
)

$erwarteteKernDateien = @(
    "README.md",
    "index.html",
    ".gitignore",
    "Training\INDEX.md",
    "Training\AVV_Brand_Voice.md",
    "Training\AVV_Satzung_LLM_Knowledge_Structured.json",
    "Training\AVV_Mitgliederbefragung_2024_strukturiert.json",
    "Training\AVV_Ideenpool_Mattlener_strukturiert.json",
    "Training\Content\AVV_Training_Sprachstil.md",
    "Training\Content\AVV_Training_MenschlicheSprache.md",
    "Training\Content\AVV_Training_TagTaxonomie.md",
    "Training\Content\Social-Media\AVV_Content_Pillars_Themenideen.md",
    "Training\Content\Social-Media\AVV_Caption_Generator.md",
    "Training\Content\Social-Media\AVV_Carousel_Blueprint.md",
    "Training\Content\Social-Media\AVV_Master_Prompt.md",
    "Training\Content\Social-Media\AVV_SPEZIAL_Astrofoto_Post.md",
    "Training\Content\Social-Media\AVV_SPEZIAL_Veranstaltungsankuendigung.md",
    "Training\Content\Social-Media\Instagram\AVV_Training_Instagram.md",
    "Training\Content\Social-Media\Facebook\AVV_Training_Facebook.md",
    "Training\Content\Social-Media\Mastodon\AVV_Training_Mastodon.md",
    "Training\Content\Social-Media\Bluesky\AVV_Training_Bluesky.md",
    "Training\Content\Website\AVV_Training_Pressemitteilung.md"
)

$fehler = 0

foreach ($ordner in $erwarteteOrdner) {
    $pfad = Join-Path $repoDir $ordner
    if (Test-Path $pfad) {
        Write-Host "     OK:  $ordner\" -ForegroundColor Green
    } else {
        Write-Host "     FEHLT: $ordner\" -ForegroundColor Red
        $fehler++
    }
}

foreach ($datei in $erwarteteKernDateien) {
    $pfad = Join-Path $repoDir $datei
    if (Test-Path $pfad) {
        Write-Host "     OK:  $datei" -ForegroundColor Green
    } else {
        Write-Host "     FEHLT: $datei" -ForegroundColor Red
        $fehler++
    }
}

if ($fehler -gt 0) {
    Write-Host "`n     $fehler Datei(en)/Ordner fehlen." -ForegroundColor Red
    Write-Host "     Bitte Struktur pruefen bevor gepusht wird." -ForegroundColor Red
    Read-Host "`nDruecke Enter zum Beenden"
    exit 1
}

Write-Host "`n     Alle $($erwarteteKernDateien.Count) Kerndateien vorhanden." -ForegroundColor Green

# ── 4. Git commit & push ──────────────────────────────────────
Write-Host "`n[4/4] Git commit & push..." -ForegroundColor Yellow

# Rohdaten explizit aus dem Index entfernen (zusaetzlich zu .gitignore)
git rm -r --cached "Training/Rohdaten/" 2>$null

git add .

$status = git status --porcelain
if ($status) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    $commitMsg = "Training v3.0: Neue Dateistruktur, Brand Voice, Social-Media-Prompts [$timestamp]"
    git commit -m $commitMsg
    git push origin master
    Write-Host "     OK: Erfolgreich gepusht zu GitHub" -ForegroundColor Green
    Write-Host "     Commit: $commitMsg" -ForegroundColor Gray
} else {
    Write-Host "     Keine Aenderungen — nichts zu pushen." -ForegroundColor Gray
}

# ── Ergebnis ──────────────────────────────────────────────────
Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "Fertig! Repo-Struktur (v3.0):" -ForegroundColor Cyan
Write-Host ""
Write-Host "  KI-Redaktionshelfer\"                                      -ForegroundColor White
Write-Host "  ├── README.md"                                              -ForegroundColor White
Write-Host "  ├── index.html                    (Wizard v3.0)"           -ForegroundColor White
Write-Host "  ├── .gitignore"                                             -ForegroundColor White
Write-Host "  ├── Training\"                                               -ForegroundColor White
Write-Host "  │   ├── INDEX.md                  <- Einstieg fuer KI"     -ForegroundColor White
Write-Host "  │   ├── AVV_Brand_Voice.md        <- immer laden"          -ForegroundColor White
Write-Host "  │   ├── AVV_Satzung_*.json"                                 -ForegroundColor White
Write-Host "  │   ├── AVV_Mitgliederbefragung_*.json"                     -ForegroundColor White
Write-Host "  │   ├── AVV_Ideenpool_*.json"                               -ForegroundColor White
Write-Host "  │   ├── Rohdaten\               <- kein Git-Push"          -ForegroundColor DarkGray
Write-Host "  │   └── Content\"                                            -ForegroundColor White
Write-Host "  │       ├── AVV_Training_Sprachstil.md"                     -ForegroundColor White
Write-Host "  │       ├── AVV_Training_MenschlicheSprache.md"             -ForegroundColor White
Write-Host "  │       ├── AVV_Training_TagTaxonomie.md"                   -ForegroundColor White
Write-Host "  │       ├── Social-Media\"                                   -ForegroundColor White
Write-Host "  │       │   ├── [6 Prompt-Dateien]"                        -ForegroundColor White
Write-Host "  │       │   ├── Instagram\AVV_Training_Instagram.md"        -ForegroundColor White
Write-Host "  │       │   ├── Facebook\AVV_Training_Facebook.md"          -ForegroundColor White
Write-Host "  │       │   ├── Mastodon\AVV_Training_Mastodon.md"          -ForegroundColor White
Write-Host "  │       │   └── Bluesky\AVV_Training_Bluesky.md"            -ForegroundColor White
Write-Host "  │       └── Website\"                                        -ForegroundColor White
Write-Host "  │           └── AVV_Training_Pressemitteilung.md"           -ForegroundColor White
Write-Host "  └── redaktionshelfer\"                                       -ForegroundColor White
Write-Host "      └── index.html"                                         -ForegroundColor White
Write-Host ""
Write-Host "GitHub: https://github.com/MrDino83/KI-Redaktionshelfer"     -ForegroundColor Cyan
Write-Host ""

Read-Host "Druecke Enter zum Beenden"
