Instance: Practitioner-2
InstanceOf: CZ_Practitioner
Usage: #example
Description: "Zdravotnický pracovník id(NRZP)=987654321"
* identifier[+].system = "https://ncez.mzcr.cz/standards/fhir/sid/nrzp"
* identifier[=].value = "987654321"
//* identifier[+].system = "https://ncez.mzcr.cz/standards/fhir/sid/clk"
//* identifier[=].value = "4567891230"
* name.use = #usual
* name.prefix = "MUDr."
* name.family = "Kubšová"
* name.given = "Stanislava"

* gender = #female
* communication[+] = urn:ietf:bcp:47#cs
* communication[+] = urn:ietf:bcp:47#en
