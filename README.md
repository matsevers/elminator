# Spiel starten
# [Spiel starten](https://matskockmeyer.github.io/elminator/src/)
# Allgemein

In diesem Projekt wurde ein Rennspiel mit Elm realisiert. Hierbei wurde Elm in der Version 0.19 verwendet. Die Darstellung des Spiels erfolgt mittels PNG Grafiken und SVG Elementen, die in einem festgelegtem Intervall aktualisiert werden.

Auf Grund von Verwendung der Elm Ports, muss eine angepasste `index.html` verwendet werden. Bei Änderungen kann daher nicht mehr der `elm reactor` verwendet werden. Das Erzeugen der neuen Version erfolgt mir dem Befehl  `elm make src/main.elm --output src/js/elm.js`

Die Darstellung ist für die Browser Chrome optimiert.

## Verwendete Techniken
Auf Grund des Projektumfangs wurde die gesamte Applikation in Untermodule unterteilt, die durch einen Router in der `Main.elm` die entsprechenden Messages erhalten um darauf zu reagieren.

### WebSockets
Der Multiplayer wurde mit WebSockets realisiert. Hierfür existiert jedoch kein natives Modul von Elm, weswegen auf ein Community Package zurückgegriffen werden musste (billstclair/elm-websocket-client). Hierbei wird ein `Elm Port` verwendet, um die WebSocket Verbindung über JavaScript anzusprechen. 

### JSON Encoding/Decoding
Über den WebSocket werden lediglich Strings versendet, weswegen die einzelnen Nachrichten zunächst enkodiert/dekodiert werden müssen. Elm bietet prinzipiell die Möglichkeit Nachrichten zu einem JSON zu verarbeiten. Das Handling ist jedoch bei größere Objekten unkomfortabel, weswegen wir uns für die Verwendung des Pakets `elm-community/json-extra` entschieden haben, welches es ermöglicht verschiedene Decoder zu pipen.

Des Weiteren wurde ein Schema eingeführt, welches aus dem umfangreichen GameObjects des Spielers nur die relevanten Informationen nutzt und diese über den WebSocket zu versenden.

### Commands, Subscriptions
Die Commands wurden eingesetzt um Nachrichten an den WebSocket zu senden. Subscriptions kamen für die KeyBoard Inputs sowie die intervallbasierten Aktualisierungen zum Einsatz.

### Generator
Um Lobbies sowie Spieler eindeutig identifizieren zu können, wurde das Paket `TSFoster/elm-uuid` eingeführt, welches u.A. zufällige UUID erzeugen kann. Dieses Paket stellt entsprechende Generatoren bereit, welche im Programm direkt verwendet werden können.

## Inhaltliche Herausforderungen
Es wurde auf fertige Pakete bzgl. der "Game-Engine" komplett verzichtet. Insbesondere die Umsetzung der `Collision Detection` und der `Physikalischen Einflüsse` erforderten viel Aufmerksamkeit. Die Collision Detection wurde zum aktuellen Stand aus Zeitgründen mit Axis Aligned Bounding Boxen realisiert. 

Das Programm sieht schon jetzt geometrischen Collider Formen vor, die von den typischen Rechteck abweichen können. Die Verwendeung dieser wäre in Verbindung mit dem `Seperated Axis Theorem` (https://www.metanetsoftware.com/technique/tutorialA.html) möglich.

## Performance Anmerkungen
Bei paralleler Ausführung mehrere Elminator Instanzen verringert sich die FPS Anzahl (geräte abhängig). Es wäre genauer zu Untersuchen, ob SVG performant in den Browser ausgeführt werden kann oder dieses Anwendungsszenario eine andere Technologie, wie z.B. WebGL benötigt wird.

# Abgrenzungen
Die Grafiken, welche in dieser Arbeit zu sehen sind, entstammen (mit Ausnahme des Logos) nicht unserer Arbeit, sondern wurden aus fremden Quellen verwendet.

# Credits
- Car Sprites: http://unluckystudio.com/game-art-giveaway-7-top-down-vehicles-sprites-pack/
- Track Sprites: https://free-game-assets.itch.io/free-race-track-tile-set , https://craftpix.net/freebies/free-race-track-2d-game-tile-set/
