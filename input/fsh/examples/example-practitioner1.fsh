Instance: Practitioner-123456789
InstanceOf: CZ_PractitionerCore
Usage: #example
Description: "Practitioner id(KRZP)=123456789"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/krzp"
* identifier[=].value = "123456789"
//* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/clk"
//* identifier[=].value = "4567891230"
* name.use = #usual
* name.prefix = "MUDr."
* name.family = "Josef"
* name.given = "Švejk"
* name.suffix = "PhD."
* gender = #male
* telecom.system = #phone
* telecom.value = "+420 603 853 227"
* telecom.use = #home
* birthDate = "1965-05-11"
* address[+].use = #work
* address[=].type = #both
* address[=].text = "Rovná 11, 160 00, Praha 6"
* address[=].line[+] = "Rovná 12"
* address[=].line[=].extension[streetName].valueString = "Rovná"
* address[=].line[+].extension[houseNumber].valueString = "11"
* address[=].city = "Praha 6"
* address[=].postalCode = "16000"
* address[=].country = "CZ"
* communication = urn:ietf:bcp:47#cs
