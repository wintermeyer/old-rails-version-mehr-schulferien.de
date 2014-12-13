Die Idee
========

Die Webseite [www.mehr-schulferien.de](http://www.mehr-schulferien.de) vereinfacht die Ferienplanung für Schüler, Lehrer und Eltern. Es werden nicht nur Ferien und Feiertage, sondern auch die [Beweglichen Ferientage](http://de.wikipedia.org/wiki/Bewegliche_Ferientage) der einzelnen Schulen beachtet und in der Ansicht gemerget.

Gleichzeitig bietet die Webseite aber auch eine Inverse-Variante für die optimale Ferienplanung von Nicht-Eltern an.

Entwickler
==========
Es handelt sich um ein Open-Source-Projekt das unter der MIT-Lizenz veröffentlicht wird.

Wer mitmachen will, der ist herzlich dazu eingeladen! Patches bitte per Pull-Request einstellen. Die initiale Datenbank kann wie folgt eingespielt werden:

```bash
rake db:migrate
rake db:seed
```

Damit hat man alle deutschen Bundesländer, viele Städte und die Ferien für 2014, 2015 und 2016.

Wer sich mit Ruby on Rails nicht auskennt, kann mal einen Blick in mein [Ruby on Rails Buch](http://ruby-auf-schienen.de) werfen.

Bei Fragen, Lob, Kritik oder Anregungen freue ich mich über eine E-Mail an
stefan.wintermeyer@amooma.de
