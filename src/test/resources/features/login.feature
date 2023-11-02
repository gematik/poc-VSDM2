Feature: Login

  Scenario: Stammdaten abfragen für einfachen Benutzer
    Given TGR set global variable "insurant.telematikId" to "meine-super-telematik-id"
    And TGR setze den default header "Authorization" auf den Wert "Bearer !{file('poppTokenTemplate.json')}"
    When TGR sende eine leere GET Anfrage an "http://localhost:${ports.vsdmServer}/vsdm"
    Then TGR find request to path ".*/vsdm"
    And TGR current response at "$.body.Bundle..Patient.name.family.value" matches "Meier"
    And TGR current response at "$.body.Bundle..Patient.name.given.value" matches "Ludger"
