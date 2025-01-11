Extension: AddressPointCz
Id:   address-point-cz
Title:  "Address location code according to the system RÚIAN (ČÚZK)"
Description: "This extension allows the entry of an address point according to the RÚIAN registry."
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* insert SetFmmandStatusRule ( 1, draft )
* insert ExtensionContext(Address)

//* ^url = "http://ncez.mzcr.cz/standards/fhir/StructureDefinition/address-point-cz"
* value[x] only Identifier
* value[x].system = "https://ncez.mzcr.cz/fhir/sid/ruian" (exactly)
