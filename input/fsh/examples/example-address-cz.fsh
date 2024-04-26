Instance: cz-patient-addr-example-1
InstanceOf: CZ_Patient
Usage: #example
Description: "Adresa typu \"both\" (fyzická i doručovací)"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
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
Description: "Adresa s P.O.Boxem"

* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
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

Instance: cz-patient-addr-example-3
InstanceOf: CZ_Patient
Usage: #example
Description: "Adresa trvalého pobytu"

* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
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
* address.extension[AddresaTrvalehoPobytuCz].valueBoolean = true

Instance: cz-patient-addr-example-4
InstanceOf: CZ_Patient
Usage: #example
Description: "Adresa trvalého pobytu mimo ČR"

* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
* identifier[=].value = "456789123"
* name.family = "Příklad"
* name.given = "Adam"

* address.use = #home
* address.type = #both
* address.text = "Malé námestie 13a, 150 00, Žilina"
* address.line[+] = "Malé námestie 13a"
* address.line[=].extension[streetName].valueString = "Malé námestie"
* address.line[=].extension[houseNumber].valueString = "13a"
* address.city = "Žilina"
* address.country = "SK"
* address.extension[AddresaTrvalehoPobytuCz].valueCodeableConcept.coding.system = "urn:iso:std:iso:3166"
* address.extension[AddresaTrvalehoPobytuCz].valueCodeableConcept.coding.code = #SK

Instance: cz-patient-addr-example-5
InstanceOf: CZ_Patient
Usage: #example
Description: "Adresa s uvedením adresního místa dle RUIAN"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
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
//* address.extension[addressPoint].valueIdentifier.system = "https://ncez.mzcr.cz/fhir/sid/ruian"
* address.extension[addressPoint].valueIdentifier.value = "27318508"


