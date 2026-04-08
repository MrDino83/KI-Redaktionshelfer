# AVV KI-Redaktionshelfer
**Astronomische Vereinigung Vulkaneifel am Hohen List e.V.**
*Version 1.0 — Stand: April 2026*

---

## Was ist der KI-Redaktionshelfer?

Der KI-Redaktionshelfer ist ein KI-gestütztes Redaktionswerkzeug für die AVV. Er unterstützt bei der Erstellung und Prüfung von Texten für hoher-list.de, Social Media und Pressemitteilungen — so dass sie dem Vereinsstil entsprechen, menschlich klingen und inhaltlich korrekt sind.

**Grundprinzip:** Die Stimme des Autors erhalten und stärken, nicht ersetzen.

---

## Projektstruktur

```
KI-Redaktionshelfer/
│
├── README.md                          ← diese Datei
├── SETUP_GIT.ps1                      ← Git-Setup für Windows
├── index.html                         ← Web-UI (Startseite)
│
├── Training/                          ← alle KI-Trainingsdaten
│   ├── INDEX.md                       ← Strukturreferenz für KI-Tools (hier starten!)
│   ├── AVV_Brand_Voice.md             ← globale Markenbasis (immer laden)
│   ├── AVV_Satzung_LLM_Knowledge_Structured.json
│   ├── AVV_Mitgliederbefragung_2024_strukturiert.json
│   ├── AVV_Ideenpool_Mattlener_strukturiert.json
│   │
│   ├── Rohdaten/                      ← Quelldokumente, kein Git-Push
│   │
│   └── Content/
│       ├── AVV_Training_Sprachstil.md
│       ├── AVV_Training_MenschlicheSprache.md
│       ├── AVV_Training_TagTaxonomie.md
│       │
│       ├── Social-Media/
│       │   ├── AVV_Content_Pillars_Themenideen.md
│       │   ├── AVV_Caption_Generator.md
│       │   ├── AVV_Carousel_Blueprint.md
│       │   ├── AVV_Master_Prompt.md
│       │   ├── AVV_SPEZIAL_Astrofoto_Post.md
│       │   ├── AVV_SPEZIAL_Veranstaltungsankuendigung.md
│       │   ├── Instagram/AVV_Training_Instagram.md
│       │   ├── Facebook/AVV_Training_Facebook.md
│       │   ├── Mastodon/AVV_Training_Mastodon.md
│       │   └── Bluesky/AVV_Training_Bluesky.md
│       │
│       └── Website/
│           └── AVV_Training_Pressemitteilung.md
│
└── redaktionshelfer/
    └── index.html                     ← Web-UI Komponenten
```

> **Für KI-Tools:** Einstieg immer über `Training/INDEX.md` — dort ist die vollständige Ladelogik beschrieben.

---

## Schnelleinstieg nach Anwendungsfall

| Ich möchte… | Diese Dateien laden |
|---|---|
| Einen Instagram-Post schreiben | `AVV_Brand_Voice.md` + `AVV_Training_Sprachstil.md` + `AVV_Training_Instagram.md` + `AVV_Caption_Generator.md` |
| Einen Facebook-Post schreiben | `AVV_Brand_Voice.md` + `AVV_Training_Sprachstil.md` + `AVV_Training_Facebook.md` + `AVV_Caption_Generator.md` |
| Ein Astrofoto begleiten | `AVV_Brand_Voice.md` + `AVV_SPEZIAL_Astrofoto_Post.md` + Kanal-Datei |
| Eine Veranstaltung ankündigen | `AVV_Brand_Voice.md` + `AVV_SPEZIAL_Veranstaltungsankuendigung.md` + Kanal-Datei |
| Einen Text prüfen / überarbeiten | `AVV_Training_Sprachstil.md` + `AVV_Training_MenschlicheSprache.md` |
| WordPress-Tags vergeben | `AVV_Training_TagTaxonomie.md` |
| Eine Pressemitteilung schreiben | `AVV_Brand_Voice.md` + `AVV_Training_Pressemitteilung.md` |

Die vollständige Ladelogik für alle Anwendungsfälle: **`Training/INDEX.md`**

---

## Trainingsdateien — Übersicht

| Datei | Inhalt | Version |
|---|---|---|
| `Training/AVV_Brand_Voice.md` | Markenstimme, Positionierung, Zielgruppen, Do/Don't | v1.0 |
| `Training/Content/AVV_Training_Sprachstil.md` | Tonalität, Satzbau, Perspektive, Längen | v0.1 |
| `Training/Content/AVV_Training_MenschlicheSprache.md` | 12 KI-Sprachmuster + Gegenmittel, 4 Schreibmodi | v0.1 |
| `Training/Content/AVV_Training_TagTaxonomie.md` | 8 Tag-Gruppen, Messier-Vollreferenz, NGC/IC | v0.3 |
| `Training/Content/Social-Media/AVV_Training_Instagram.md` | Kanal-Regeln Instagram | v0.1 |
| `Training/Content/Social-Media/Facebook/AVV_Training_Facebook.md` | Kanal-Regeln Facebook | v0.1 |
| `Training/Content/Social-Media/Mastodon/AVV_Training_Mastodon.md` | Kanal-Regeln Mastodon | v0.1 |
| `Training/Content/Social-Media/Bluesky/AVV_Training_Bluesky.md` | Kanal-Regeln Bluesky | v0.1 |
| `Training/Content/Website/AVV_Training_Pressemitteilung.md` | Pressemitteilung: Struktur, Boilerplate | v0.1 |

---

## Unveränderliche Grenzen (für alle KI-Tools)

Unabhängig vom Anwendungsfall gilt immer:
- Keine Fakten erfinden oder Quellen vortäuschen
- Keine Emotion über den Kontext hinaus
- Keine Werbung für kommerzielle Produkte oder Anbieter
- Keine politischen Aussagen oder Pseudowissenschaft (Astrologie etc.)
- Menschlichkeit nie als Vorwand für Unklarheit bei Terminen oder Vereinsinformationen

---

## Versionsverlauf

| Version | Datum | Änderung |
|---|---|---|
| 0.1 | April 2026 | Erstanlage: Beitragscheck Baustein 1 und 2 |
| 0.2 | April 2026 | Baustein 3 Tag-Taxonomie; Kanal-Trainings |
| 0.3 | April 2026 | MQ-Steuerungslogik entfernt; UI übernimmt Steuerung |
| 1.0 | April 2026 | Komplette Neustrukturierung: Training/-Ordner, INDEX.md, Social-Media-Prompts integriert, Brand Voice als zentrale Referenz |

---

*Verantwortlich: Marcus Mattlener — Astronomische Vereinigung Vulkaneifel am Hohen List e.V.*
