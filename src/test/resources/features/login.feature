Feature: Login

  Scenario: Stammdaten abfragen für einfachen Benutzer
    Given TGR setze globale Variable "insurant.telematikId" auf "meine-super-telematik-id"
    And TGR setze den default header "Authorization" auf den Wert "Bearer !{file('poppTokenTemplate.json')}"
    When TGR sende eine leere GET Anfrage an "http://localhost:${ports.vsdmServer}/vsdm"
    Then TGR finde die erste Anfrage mit Pfad ".*/vsdm"
    And TGR gebe aktuelle Request als Rbel-Tree aus
    And TGR gebe aktuelle Response als Rbel-Tree aus
    And TGR prüfe aktuelle Antwort stimmt im Knoten "$.body.Bundle..Patient.name.family.value" überein mit "Meier"
    And TGR prüfe aktuelle Antwort stimmt im Knoten "$.body.Bundle..Patient.name.given.value" überein mit "Ludger"
