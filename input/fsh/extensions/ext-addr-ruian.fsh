Extension: AddressPointCz
Id:   address-point-cz
Title:  "Adresní bod dle systému RÚIAN (ČÚZK)"
Description: "Tato extenze umožňuje zápis adresního bodu dle registru RÚIAN. / This extension allows the entry of an address point according to the RÚIAN registry."
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* ^context[+].type = #element
* ^context[=].expression = "CZ_Address"

//* ^url = "http://ncez.mzcr.cz/standards/fhir/StructureDefinition/address-point-cz"
* value[x] only Identifier
* value[x].system = "https://ncez.mzcr.cz/standards/fhir/sid/ruian" (exactly)