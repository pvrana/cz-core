Instance: cz-patient-addr-example-1
InstanceOf: CZ_Patient
Usage: #example
* identifier[+].system = "https://ncez.mzcr.cz/standards/fhir/sid/rid"
* identifier[=].value = "456789123"
* name.family = "Příklad"
* name.given = "Adam"

* address.use = #home
* address.type = #physical
* address.text = "Malé náměstí 13a, 150 00, Praha 5"
* address.line[+] = "Malé náměstí 13a"
* address.line[=].extension[streetName].valueString = "Malé náměstí"
* address.line[+].extension[houseNumber].valueString = "13a"
* address.city = "Praha 5"
* address.postalCode = "15000"
* address.country = "CZ"

// Příklad pro otestování business pravidel
Instance: cz-patient-addr-example-2
InstanceOf: CZ_Patient
Usage: #example
* identifier[+].system = "https://ncez.mzcr.cz/standards/fhir/sid/rid"
* identifier[=].value = "456789123"
* name.family = "Příklad"
* name.given = "Adam"

* address[+].use = #home
* address[=].type = #physical
* address[=].text = "Malé náměstí 13a, 150 00, Praha 5"
* address[=].line[+] = "Malé náměstí 13a"
* address[=].line[=].extension[streetName].valueString = "Malé náměstí"
* address[=].line[+].extension[houseNumber].valueString = "13a"
//* address[=].city = "Praha 5"
* address[=].postalCode = "15000"
* address[=].country = "CZ"

Instance: cz-patient-addr-example-3
InstanceOf: CZ_Patient
Usage: #example
* identifier[+].system = "https://ncez.mzcr.cz/standards/fhir/sid/rid"
* identifier[=].value = "456789123"
* name.family = "Příklad"
* name.given = "Adam"
* address[+].use = #home
//* address[=].type = #physical
* address[=].text = "Malé náměstí 13a, 150 00, Praha 5"
//* address[=].line[+] = "Malé náměstí 13a"
//* address[=].line[=].extension[streetName].valueString = "Malé náměstí"
//* address[=].line[+].extension[houseNumber].valueString = "13a"
//* city = "Praha 5"
//* address[=].postalCode = "15000"
//* address[=].country = "CZ"
