# AVV Beitragscheck — README
**Astronomische Vereinigung Vulkaneifel am Hohen List e.V.**
*Dokumentation: Funktionen, Training und Bedienung*
*Version 0.1 — Stand: April 2026*

---

## Was ist der Beitragscheck?

Der Beitragscheck ist ein KI-gestütztes Redaktionswerkzeug für die AVV. Es unterstützt Autoren dabei, Beiträge für hoher-list.de so zu überarbeiten, dass sie dem Vereinsstil entsprechen, menschlich klingen und inhaltlich korrekt verschlagwortet sind. Das Tool macht Vorschläge — es ersetzt nie die Entscheidung des Autors.

Grundprinzip: Die Stimme des Autors erhalten und stärken, nicht ersetzen.

---

## Funktionsübersicht

Der Beitragscheck prüft jeden eingereichten Text in fünf Bereichen:

| Funktion | Beschreibung |
|---|---|
| 1. Sprachstil-Prüfung | Abgleich mit dem AVV-Sprachstil-Guide (Baustein 1) |
| 2. Menschlichkeits-Prüfung | Erkennung von KI-Sprachmustern, Verbesserungsvorschläge (Baustein 2) |
| 3. Gegenvorschlag | Annotierter Text bei kleinen Korrekturen; Neuentwurf bei hohem Überarbeitungsbedarf |
| 4. Fachliche Rückfragen | Inhaltliche Rückfragen auf Basis astronomischen Fachwissens |
| 5. Verschlagwortung | Vorschlag passender Tags nach der AVV-Tag-Taxonomie (Baustein 3, in Vorbereitung) |

---

## Trainingsdateien in diesem Ordner

| Datei | Inhalt | Status |
|---|---|---|
| `AVV_Beitragscheck_Sprachstil.md` | Baustein 1: AVV-Tonalität, Satzbau, Perspektive, Längen nach Inhaltstyp | v0.1 — Entwurf |
| `AVV_Beitragscheck_MenschlicheSprache.md` | Baustein 2: 12 KI-Sprachmuster, Schreibmodi, Fettmarkierungsregeln | v0.1 — Entwurf |
| `AVV_Beitragscheck_TagTaxonomie.md` | Baustein 3: Tag-Taxonomie — 6 Gruppen, Katalogbezüge, Objekttypen, Ausrüstung, Themen, Verein | v0.1 — Entwurf |
| `README.md` | Diese Datei | v0.1 |

---

## Baustein 1 — Sprachstil (`AVV_Beitragscheck_Sprachstil.md`)

Definiert den redaktionellen Rahmen für alle AVV-Texte auf hoher-list.de.

Kernregeln:
- Freundlich, offen, sachlich — nie belehrend
- Kurze Sätze, aktive Sprache, Hauptsatz vor Nebensatz
- Fachbegriffe erklären beim ersten Vorkommen
- Ich-Perspektive bei persönlichen Berichten ausdrücklich erlaubt
- Keine leeren Einleitungen, keine Superlative ohne Substanz
- Empfohlene Längen je nach Inhaltstyp (150–900 Wörter)

Quelle: AVV-Vereinsidentität, Ideenpool Marcus Mattlener, Mitgliederbefragung Feb/März 2024

---

## Baustein 2 — Menschliche Sprache (`AVV_Beitragscheck_MenschlicheSprache.md`)

Beschreibt 12 Sprachmuster, die KI-generierte oder KI-überarbeitete Texte verraten, und wie diese gezielt gebrochen werden.

Die vier Schreibmodi:

| Modus | Einsatz |
|---|---|
| sachlich | Ankündigungen, Vereinsnachrichten |
| technisch | Wissensbeiträge, Ausrüstung, Beobachtungsmethoden |
| persönlich | Erfahrungsberichte, Beobachtungsberichte |
| emotional | Besondere Ereignisse, Highlights |

Die 12 Muster im Überblick:

1. Gleichförmige Satzlänge
2. Überperfekte Übergänge
3. Fehlende Übergangsbrüche
4. Sichere, erwartbare Wortwahl
5. Fehlende Modalpartikeln
6. Überkorrekte Grammatik
7. Fehlende Unsicherheitsmarker
8. Keine Anekdoten oder Mikro-Erlebnisse
9. Fehlende Diskursmarker
10. Überkohäsive Absätze
11. Keine Ambivalenz
12. Fehlende semantische Überraschungen

Wichtig: Muster 5 und 6 gelten nur im Modus *persönlich* oder *emotional* — nicht in sachlichen oder technischen Beiträgen.

Quelle: trainingslogik_menschliche_sprache_aktualisiert_MQ.json v1.6 (Marcus Mattlener / ChatGPT), adaptiert für AVV

---

## Baustein 3 — Tag-Taxonomie (`AVV_Beitragscheck_TagTaxonomie.md`)

Definiert die Verschlagwortungslogik für WordPress in sechs Gruppen:

| Gruppe | Inhalt |
|---|---|
| 1 — Astronomische Objekte | Katalogbezüge M, NGC, IC, Caldwell; Eigennamen |
| 2 — Objekttypen | Galaxien, Nebel, Sternhaufen, Planeten, Kometen etc. |
| 3 — Beobachtung & Methodik | Visuelle Beobachtung, Astrofotografie, Spektroskopie etc. |
| 4 — Ausrüstung & Technik | Teleskope, Montierungen, Kameras, Software etc. |
| 5 — Themen & Wissensgebiete | Astrophysik, Kosmologie, Raumfahrt, Himmelsphänomene etc. |
| 6 — Verein, Veranstaltungen & Ort | Hoher List, AVV, Vulkaneifel, Sternenpark etc. |

Grundregel: 3–7 Tags pro Beitrag. Katalogbezeichnungen im Format `M 42`, `NGC 224`, `IC 434`.

---

## Steuerungslogik (MQ) — nur für Claude-Projektnutzung

Die MQ-Logik steuert, wie Claude Texte generiert und überarbeitet. Sie ist ausschließlich für die Arbeit im Claude-Projektkontext gedacht und erscheint nicht in den Autorentrainingsdateien.

| Parameter | Funktion | Standardwert |
|---|---|---|
| MQ 1 — Sprachstil | `s` (sachlich) / `t` (technisch) / `p` (persönlich) / `e` (emotional) | `s` |
| MQ 2 — Regelverletzungsgrad | Skala 1–10: Wie stark werden KI-Muster gebrochen? | `5` |
| MQ 3 — SEO-Optimierung | `j` / `n` | `n` |

Kurzform im Prompt: z.B. `p, 7` = Modus persönlich, Verletzungsgrad 7.
MQ-Suffix: Endet ein Prompt mit `MQ`, ist menschliche Sprache automatisch aktiv — keine Abfrage nötig.
Kombinationen: Mehrere Modi kommasepariert möglich, z.B. `t, s`.

---

## Ausgabeverhalten des Beitragschecks

Bei geringem Überarbeitungsbedarf:
- Annotierter Originaltext mit eingearbeiteten Verbesserungsvorschlägen
- Fachliche Rückfragen zum Inhalt
- Tag-Vorschläge

Bei hohem Überarbeitungsbedarf:
- Vollständiger Neuentwurf als Gegenvorschlag
- Begründung der wesentlichen Änderungen
- Fachliche Rückfragen zum Inhalt
- Tag-Vorschläge

Ton: immer konstruktiv, nie belehrend. Vorschläge sind Angebote, keine Korrekturen.

---

## Unveränderliche Grenzen

Unabhängig von Modus und Einstellungen gilt:
- Keine Fakten erfinden oder Quellen vortäuschen
- Keine Emotion über den Kontext hinaus
- Menschlichkeit nie als Vorwand für Unklarheit bei Terminen, Fakten oder Vereinsinformationen
- Keine Werbung für kommerzielle Produkte oder Anbieter

---

## Versionsverlauf

| Version | Datum | Änderung |
|---|---|---|
| 0.1 | April 2026 | Erstanlage: Baustein 1 und 2, MQ-Logik, README |
| 0.2 | April 2026 | Baustein 3 Tag-Taxonomie ergänzt; README aktualisiert |

---

*Verantwortlich: Marcus Mattlener — Astronomische Vereinigung Vulkaneifel am Hohen List e.V.*
*Ablageort: Öffentlichkeitsarbeit - Dokumente / Content und Social Media / KI-Redaktionshelfer*
