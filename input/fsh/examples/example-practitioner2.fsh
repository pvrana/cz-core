Instance: Practitioner-2
InstanceOf: CZ_PractitionerCore
Usage: #example
Description: "Practitioner id(KRZP)=987654321"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/krzp"
* identifier[=].value = "987654321"
//* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/clk"
//* identifier[=].value = "4567891230"
* name.use = #usual
* name.prefix = "MUDr."
* name.family = "Kubšová"
* name.given = "Stanislava"

* gender = #female
* communication[+] = urn:ietf:bcp:47#cs
* communication[+] = urn:ietf:bcp:47#en
