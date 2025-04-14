Instance: cz-patient-addr-example-1
InstanceOf: cz-patient-core
Usage: #example
Description: "Address of both typu (physical and delivery)"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
* identifier[=].value = "4567891237"
* name.family = "Příklad"
* name.given = "Adam"
* birthDate = "1971-11-26"

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
InstanceOf: cz-patient-core
Usage: #example
Description: "Address of P.O.Boxem"

* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
* identifier[=].value = "4567891237"
* name.family = "Příklad"
* name.given = "Adam"
* birthDate = "1971-11-26"

//* address[+].use = #home
* address[+].type = #postal
* address[=].text = "P.O.Box 123, 150 00, Praha 5"
* address[=].line[+] = "P.O.Box 123"
* address[=].line[=].extension[postBox].valueString = "123"
* address[=].city = "Praha"
* address[=].postalCode = "15000"
* address[=].country = "CZ"

Instance: cz-patient-addr-example-3
InstanceOf: cz-patient-core
Usage: #example
Description: "Address of permanent residence"

* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
* identifier[=].value = "4567891237"
* name.family = "Příklad"
* name.given = "Adam"
* birthDate = "1971-11-26"

* address.use = #home
* address.type = #both
* address.text = "Malé náměstí 13a, 150 00, Praha 5"
* address.line[+] = "Malé náměstí 13a"
* address.line[=].extension[streetName].valueString = "Malé náměstí"
* address.line[=].extension[houseNumber].valueString = "13a"
* address.city = "Praha"
* address.postalCode = "15000"
* address.country = "CZ"
* address.extension[PermanentResidenceAddressCz].valueBoolean = true

Instance: cz-patient-addr-example-4
InstanceOf: cz-patient-core
Usage: #example
Description: "Address of permanent residence outside the Czech Republic"

* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
* identifier[=].value = "4567891237"
* name.family = "Příklad"
* name.given = "Adam"
* birthDate = "1971-11-26"

* address.use = #home
* address.type = #both
* address.text = "Malé námestie 13a, 150 00, Žilina"
* address.line[+] = "Malé námestie 13a"
* address.line[=].extension[streetName].valueString = "Malé námestie"
* address.line[=].extension[houseNumber].valueString = "13a"
* address.city = "Žilina"
* address.country = "SK"
* address.extension[PermanentResidenceAddressCz].valueCodeableConcept.coding.system = "urn:iso:std:iso:3166"
* address.extension[PermanentResidenceAddressCz].valueCodeableConcept.coding.code = #SK

Instance: cz-patient-addr-example-5
InstanceOf: cz-patient-core
Usage: #example
Description: "Address indicating the place of address according to RUIAN"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/rid"
* identifier[=].value = "4567891237"
* name.family = "Příklad"
* name.given = "Adam"
* birthDate = "1971-11-26"

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


