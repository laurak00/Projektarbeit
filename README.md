# Projektarbeit SS24

Diese Webanwendung ist in Rahmen der Projektarbeit zum Thema **Web-Entwicklung mit der Elixir-Programmiersprache und dem Phoenix-Framework** von Prof. Vogelsang an der Hochschule Karlsruhe in der Fakultät Informatik entstanden. 

## Thema der Webanwendung

Die Webanwendung orientiert sich an der Webseite der KiSiWo (Kinder-Sing-Woche). Weil ich nicht nur als Betreuerin bei dieser Kinder- und Jugendfreizeit mitwirke und mich im Trägerverein Moravia Cantat engagiere, sondern auch für die regelmäßige Aktualisierung der Webseite zuständig bin. <br>
Ich habe für diese Projektarbeit einen Laptop mit Fedora (Linux) verwendet. 

## Inhaltsverzeichnis

1. [Software Stack](#software-stack)
2. [Einrichten der Umgebung](#einrichten-der-umgebung)
3. [Erstellen eines neuen Projekts](#erstellen-eines-neuen-projekts)
4. [Datenbank einrichten](#datenbank-einrichten)
5. [Webanwendung starten](#webanwendung-starten)
6. [Implementierte Inhalte](#implementierte-inhalte)
7. [Erfahrungen](#meine-erfahrungen)
8. [Bekannte Herausforderungen](#schwierigkeiten)
9. [Informationsquellen](#informationsquellen)

## Software Stack

- Elixir
- Phoenix
- Ecto (ORM von Phoenix)
- Tailwind

## Einrichten der Umgebung

Um mit Elixir und Phoenix arbeiten zu können, müssen die folgenden Schritte durchgeführt werden:

1. **Erlang und Elixir installieren** <br>
Anleitung zur Installation: [hier](https://elixir-lang.org/install.html)
2. **IDE einrichten** <br>
Ich empfehle **Visual Studio Code**. Folgende Plug-ins sollten installiert werden:
    - "ElixirLS: Elixir support and debugger", 
    - "Elixir Formatter" und 
    - "Phoenix Framework"
3. **Hex installieren** <br>
Führe den folgenden Befehl im Terminal aus, um Hex zu installieren oder zu aktualisieren:
`mix local.hex` 
4. **Datenbank konfigurieren** <br>
Standardmäßig wird PostgreSQL verwendet, aber auch andere Datenbanken oder keine Datenbank sind möglich.  

## Erstellen eines neuen Projekts

Ein neues Phoenix-Projekt kann mit folgendem Befehl erstellt werden: `mix phx.new hello`

Dies generiert automatisch die erforderliche Ordnerstruktur und Dateien für das Projekt "hello". Während der Initialisierung wird man gefragt, ob alle Abhängigkeiten heruntergeladen werden sollen. Nach der Bestätigung wird die Installation abgeschlossen. <br>
Eine `.gitignore`-Datei wird ebenfalls automatisch erstellt. 

## Datenbank einrichten

Um die Datenbank für das Projekt zu konfigurieren, können die Verbindungsdaten in der Datei `config/dev.exs` eingetragen werden. Anschließend wird die Datenbank mit folgendem Befehl erstellt: `mix ecto.create` <br>
Mit dem Befehl `mix ecto.migrate` können zukünftige Änderungen an der Datenbankstruktur migriert werden. 

## Webanwendung starten

Die Webanwendung wird mit dem folgenden Befehl gestartet: `mix phx.server` <br>
Die Anwendung läuft nun unter `localhost:4000`. Änderungen am Code werden dank **Hot-Reload** automatisch nach dem Speichern übernommen. 

Um die Anwendung zu beenden, drücke zweimal `Strg+C`. 

## Implementierte Inhalte

Die Webanwendung orientiert sich stark am Vorbild der Orginalseite und umfasst folgende Seiten:
- Startseite: Willkommen, mit Links zu neuen Anmeldungen und allen weiteren Seiten
- Die KiSiWo: Erklärungsseite der KiSiWo
- Das Team: Vorstellung des Teams
- Kontakt: Kontaktinformationen
- Anmeldungen: Seite für neue Anmeldungen
- Teilnehmerübersicht: Tabellenansicht der angemeldeten Teilnehmer

## Meine Erfahrungen

### Positives

- Mit einem Befehl (`mix phx.new _name_`) kann ein neues Projekt mit vorkonfigurierten Ordnerstrukture und allen nötigen Dateien erstellt werden. 
- Mit `mix phx.gen.live _Kontext_ _Schema_ _tableOnTheDatabase_` kann eine neue Datenbanktabelle samt zugehöriger Seite erstellt werden. Die Automatisch generierten Befehle müssen nur noch in die Datei `router.ex` kopiert und die Datenbank migriert werden - und die Seite ist einsatzbereit. 
- erstellen von bestimmten HTML Inhalten ist einfach

### Schwierigkeiten

- Für mich war es teilweise herausfordernd, aktuelle Anleitung zu finden. Letztendlich hat sich die offizielle Dokumentation von Elixir und Phoenix als beste Einarbeitungsmöglichkeit erwiesen.
- Erlang und Elixir zu installieren und die IDE zum Laufen zu bekommen
- das Erlernen von Elixir und Phoenix hat viel Zeit gekostet 
- Einbindung des ORM ins Projekt


## Informationsquellen

1. Elixir Guides: https://hexdocs.pm/elixir/introduction.html
2. Elixir Schule: https://elixirschool.com/en
3. Phoenix Guides: https://hexdocs.pm/phoenix/overview.html
4. Ecto Guides: https://hexdocs.pm/ecto/Ecto.html

### Videos

1. Elixir Programming Introduction: https://www.youtube.com/watch?v=-lgtb-YSUWE
2. Simple Phoenix Web application: https://www.youtube.com/watch?v=e4JX2JAw4Ok