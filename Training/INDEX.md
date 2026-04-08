# Training INDEX — AVV KI-Redaktionshelfer
**Astronomische Vereinigung Vulkaneifel am Hohen List e.V.**
*Strukturreferenz für KI-Tools und LLMs*
*Version 1.0 — Stand: April 2026*

---

## Zweck dieser Datei

Diese Datei ist der Einstiegspunkt für jedes KI-Tool oder LLM, das mit den AVV-Trainingsdaten arbeitet. Sie erklärt die Dateistruktur, beschreibt den Inhalt jeder Datei und gibt vor, welche Dateien für welchen Anwendungsfall geladen werden müssen.

**Regel:** Nie alle Dateien auf einmal laden. Nur die für den jeweiligen Anwendungsfall relevanten Dateien einlesen. Diese INDEX-Datei genügt als erster Schritt.

---

## Dateistruktur (Übersicht)

```
Training/
├── INDEX.md                                    ← diese Datei
├── AVV_Brand_Voice.md                          ← IMMER laden (globale Basis)
├── AVV_Satzung_LLM_Knowledge_Structured.json   ← Vereinsstruktur, Zweck, Governance
├── AVV_Mitgliederbefragung_2024_strukturiert.json ← Mitgliederperspektiven, Wünsche
├── AVV_Ideenpool_Mattlener_strukturiert.json   ← Strategische Ideen, Partnerschaften
│
├── Rohdaten/                                   ← NICHT für LLM-Kontext laden
│   └── ...                                     ← Quelldokumente, noch nicht strukturiert
│
└── Content/
    ├── AVV_Training_Sprachstil.md              ← globaler Schreibstil (alle Kanäle)
    ├── AVV_Training_MenschlicheSprache.md      ← KI-Muster erkennen und vermeiden
    ├── AVV_Training_TagTaxonomie.md            ← WordPress-Verschlagwortung
    │
    ├── Social-Media/
    │   ├── AVV_Content_Pillars_Themenideen.md  ← Prompt: 30 Themenideen generieren
    │   ├── AVV_Caption_Generator.md            ← Prompt: 5 Caption-Varianten
    │   ├── AVV_Carousel_Blueprint.md           ← Prompt: 8-Slide Carousel
    │   ├── AVV_Master_Prompt.md                ← Prompt: vollständiges Content-Paket
    │   ├── AVV_SPEZIAL_Astrofoto_Post.md       ← Prompt: Astrofoto-Begleittext
    │   ├── AVV_SPEZIAL_Veranstaltungsankuendigung.md ← Prompt: Event-Ankündigung
    │   ├── Instagram/
    │   │   └── AVV_Training_Instagram.md       ← Kanal-Regeln Instagram
    │   ├── Facebook/
    │   │   └── AVV_Training_Facebook.md        ← Kanal-Regeln Facebook
    │   ├── Mastodon/
    │   │   └── AVV_Training_Mastodon.md        ← Kanal-Regeln Mastodon
    │   └── Bluesky/
    │       └── AVV_Training_Bluesky.md         ← Kanal-Regeln Bluesky
    │
    └── Website/
        └── AVV_Training_Pressemitteilung.md    ← Regeln für Pressemitteilungen
```

---

## Dateibeschreibungen

### Globale Ebene (Training/)

| Datei | Inhalt | Priorität |
|---|---|---|
| `AVV_Brand_Voice.md` | Markenstimme, Positionierung, Zielgruppen, Do/Don't, Content-Pillars, Plattform-Kurzregeln | **IMMER laden** |
| `AVV_Satzung_LLM_Knowledge_Structured.json` | Vereinszweck (§2), Governance, Mitgliedschaft, Organe — strukturiert für LLM-Nutzung | Bei Vereinsfragen |
| `AVV_Mitgliederbefragung_2024_strukturiert.json` | Anonymisierte Mitgliederbefragung Feb 2024 — Wünsche, Erwartungen, Kritik | Bei Zielgruppenanalyse |
| `AVV_Ideenpool_Mattlener_strukturiert.json` | Strategische Kommunikationsideen, Veranstaltungsformate, Partnerschaftspotenziale | Bei Strategiefragen |

### Content-Ebene — Globale Inhaltsregeln (Training/Content/)

| Datei | Inhalt | Wann laden |
|---|---|---|
| `AVV_Training_Sprachstil.md` | Tonalität, Satzbau, Perspektive, Längen nach Inhaltstyp, Dos & Don'ts | Immer bei Textgenerierung |
| `AVV_Training_MenschlicheSprache.md` | 12 KI-Sprachmuster + Gegenmittel, 4 Schreibmodi, Fettmarkierungsregeln | Bei Textprüfung / Überarbeitung |
| `AVV_Training_TagTaxonomie.md` | 8 Tag-Gruppen, Messier-Vollreferenz, NGC/IC-Auswahl, Verschlagwortungsregeln | Bei WordPress-Tagging |

### Content-Ebene — Social Media (Training/Content/Social-Media/)

| Datei | Typ | Inhalt | Wann laden |
|---|---|---|---|
| `AVV_Content_Pillars_Themenideen.md` | Prompt | 30 Themenideen auf Basis der 4 AVV-Pillars generieren | Redaktionsplanung |
| `AVV_Caption_Generator.md` | Prompt | 5 Caption-Varianten mit unterschiedlichen Hook-Mechaniken | Einzelne Posts |
| `AVV_Carousel_Blueprint.md` | Prompt | 8-Slide Carousel, Slide-für-Slide | Wissens-/Erklärformate |
| `AVV_Master_Prompt.md` | Prompt | Vollpaket: Hooks + Carousel + Captions + Community-Fragen | Kampagnenvorbereitung |
| `AVV_SPEZIAL_Astrofoto_Post.md` | Prompt | 3 Caption-Varianten zu einem Astrofoto (Woche/Monat/Jahr) | Astrofoto-Routine |
| `AVV_SPEZIAL_Veranstaltungsankuendigung.md` | Prompt | Ankündigung + Reminder für Veranstaltungen | Events |

### Content-Ebene — Kanal-Trainings (Training/Content/Social-Media/\<Kanal\>/)

| Datei | Kanal | Inhalt |
|---|---|---|
| `Instagram/AVV_Training_Instagram.md` | Instagram | Textstruktur, Längen, Hook-Logik, Hashtag-Strategie, Beispiele |
| `Facebook/AVV_Training_Facebook.md` | Facebook | Textstruktur, Community-Ton, Link-Logik, Hashtag-Strategie, Beispiele |
| `Mastodon/AVV_Training_Mastodon.md` | Mastodon | Zeichenlimit, Alt-Text-Pflicht, Fediverse-Besonderheiten, Hashtags |
| `Bluesky/AVV_Training_Bluesky.md` | Bluesky | 300-Zeichen-Logik, Thread-Struktur, Community-Ton, Hashtags |

### Content-Ebene — Website (Training/Content/Website/)

| Datei | Inhalt | Wann laden |
|---|---|---|
| `AVV_Training_Pressemitteilung.md` | Struktur, Pflichtbestandteile, Boilerplate, Verteiler | Bei Pressemitteilungen |

---

## Ladelogik nach Anwendungsfall

Nur die markierten Dateien einlesen — nie mehr als nötig.

| Anwendungsfall | Pflicht | Optional |
|---|---|---|
| **Instagram-Post schreiben** | `AVV_Brand_Voice.md` + `AVV_Training_Sprachstil.md` + `AVV_Training_Instagram.md` + `AVV_Caption_Generator.md` | `AVV_Training_MenschlicheSprache.md` |
| **Facebook-Post schreiben** | `AVV_Brand_Voice.md` + `AVV_Training_Sprachstil.md` + `AVV_Training_Facebook.md` + `AVV_Caption_Generator.md` | — |
| **Mastodon-Post schreiben** | `AVV_Brand_Voice.md` + `AVV_Training_Mastodon.md` + `AVV_Caption_Generator.md` | — |
| **Bluesky-Post schreiben** | `AVV_Brand_Voice.md` + `AVV_Training_Bluesky.md` + `AVV_Caption_Generator.md` | — |
| **Astrofoto-Post (alle Kanäle)** | `AVV_Brand_Voice.md` + `AVV_SPEZIAL_Astrofoto_Post.md` + Kanal-Datei des Zielkanals | — |
| **Veranstaltungsankündigung** | `AVV_Brand_Voice.md` + `AVV_SPEZIAL_Veranstaltungsankuendigung.md` + Kanal-Datei | — |
| **Carousel erstellen** | `AVV_Brand_Voice.md` + `AVV_Training_Sprachstil.md` + `AVV_Carousel_Blueprint.md` | Kanal-Datei |
| **Redaktionsplanung / Themen** | `AVV_Brand_Voice.md` + `AVV_Content_Pillars_Themenideen.md` | — |
| **Vollständiges Content-Paket** | `AVV_Brand_Voice.md` + `AVV_Training_Sprachstil.md` + `AVV_Master_Prompt.md` + Kanal-Datei | — |
| **Text prüfen / überarbeiten** | `AVV_Training_Sprachstil.md` + `AVV_Training_MenschlicheSprache.md` | `AVV_Brand_Voice.md` |
| **WordPress-Tagging** | `AVV_Training_TagTaxonomie.md` | — |
| **Pressemitteilung** | `AVV_Training_Pressemitteilung.md` + `AVV_Brand_Voice.md` | — |
| **Vereinsfragen / Kontext** | `AVV_Satzung_LLM_Knowledge_Structured.json` | `AVV_Mitgliederbefragung_2024_strukturiert.json` |
| **Strategiefragen** | `AVV_Brand_Voice.md` + `AVV_Ideenpool_Mattlener_strukturiert.json` | `AVV_Mitgliederbefragung_2024_strukturiert.json` |

---

## Konventionen für neue Dateien

Damit die Struktur konsistent bleibt, gelten folgende Regeln für neu hinzugefügte Dateien:

| Dateityp | Ablageort | Namensschema |
|---|---|---|
| Globale Trainingsdatei (strukturiert, für LLM) | `Training/` | `AVV_<Inhalt>_strukturiert.json` oder `AVV_<Inhalt>.md` |
| Nicht strukturierte Rohdaten / Quelldokumente | `Training/Rohdaten/` | Originalname behalten |
| Globale Inhaltsregel (gilt kanalübergreifend) | `Training/Content/` | `AVV_Training_<Thema>.md` |
| Social-Media-Prompt (kanalübergreifend) | `Training/Content/Social-Media/` | `AVV_<Funktion>.md` oder `AVV_SPEZIAL_<Thema>.md` |
| Kanalspezifisches Training | `Training/Content/Social-Media/<Kanal>/` | `AVV_Training_<Kanal>.md` |
| Website-/Presse-Training | `Training/Content/Website/` | `AVV_Training_<Format>.md` |

---

## Rohdaten — Nicht für LLM-Kontext laden

Der Ordner `Training/Rohdaten/` enthält Quelldokumente, die noch nicht vollständig für LLM-Nutzung aufbereitet wurden. Diese Dateien werden **nicht** in KI-Prompts eingelesen und **nicht** in Git versioniert (via `.gitignore`).

Aktueller Inhalt:
- `AVV_Satzung_OCR_semantic.json` — OCR-Rohextraktion der Satzung (Vorstufe zur strukturierten Version)
- `AVV_Social_Media_Leitlinien.md` — frühe Leitlinien-Rohdatei (in Brand Voice überführt)
- `AVV_ContentPillars_Vorlage_code78_VERALTET.md` — unbefüllte Originalvorlage, ersetzt durch AVV-Prompts

---

*Verantwortlich: Marcus Mattlener — Astronomische Vereinigung Vulkaneifel am Hohen List e.V.*
*Letzte Aktualisierung: April 2026*
