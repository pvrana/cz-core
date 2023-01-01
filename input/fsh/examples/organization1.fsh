Instance: Organization-1
InstanceOf: CZ_Organization
Usage: #example
* identifier[+].system = "https://ncez.mzcr.cz/standards/fhir/sid/ico"
* identifier[=].value = "27520536"
//* identifier[+].system = "https://ncez.mzcr.cz/standards/fhir/sid/clk"
//* identifier[=].value = "4567891230"
* type[+] = $drzar#102 "Nemocnice"
* name = "Nemocnice Chrudim"
* telecom.system = #phone
* telecom.value = "+420 603 853 227"
* telecom.use = #work

* address[+].use = #work
* address[=].type = #both
* address[=].text = "Václavská 570, 537 01, Chrudim"
* address[=].line[+] = "Václavská 570"
* address[=].line[=].extension[Streetname].valueString = "Václavská"
* address[=].line[+].extension[Housenumber].valueString = "570"
* address[=].city = "Chrudim"
* address[=].postalCode = "537 01"
* address[=].country = "CZ"
