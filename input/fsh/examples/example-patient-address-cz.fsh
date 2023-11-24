Instance: cz-patient-addr-example-1
InstanceOf: CZ_Patient
Usage: #example
Description: "Pacient, adresa typu \"both\" (fyzická i doručovací)"
* identifier[+].system = "https://ncez.mzcr.cz/standards/fhir/sid/rid"
* identifier[=].value = "456789123"
* name.family = "Příklad"
* name.given = "Adam"

* address.use = #home
* address.type = #both
* address.text = "Malé náměstí 13a, 150 00, Praha 5"
* address.line[+] = "Malé náměstí 13a"
* address.line[=].extension[streetName].valueString = "Malé náměstí"
* address.line[=].extension[houseNumber].valueString = "13a"
* address.city = "Praha"
* address.postalCode = "15000"
* address.country = "CZ"

// Příklad adresy s P.O.Boxem
Instance: cz-patient-addr-example-2
InstanceOf: CZ_Patient
Usage: #example
Description: "Pacient, adresa s P.O.Boxem"

* identifier[+].system = "https://ncez.mzcr.cz/standards/fhir/sid/rid"
* identifier[=].value = "456789123"
* name.family = "Příklad"
* name.given = "Adam"

//* address[+].use = #home
* address[+].type = #postal
* address[=].text = "P.O.Box 123, 150 00, Praha 5"
* address[=].line[+] = "P.O.Box 123"
* address[=].line[=].extension[postBox].valueString = "123"
* address[=].city = "Praha"
* address[=].postalCode = "15000"
* address[=].country = "CZ"