//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_RelatedPersonCore
Parent:     CZ_RelatedPersonBase
Id:         cz-relatedPerson-core
Title:      "Related person (CZ core)"
Description: "Czech national profile for a related person."
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* ^experimental = false

* ^description = "This profile sets minimum expectations for the Related Person resource common to most of the use cases."
* ^publisher = "HL7 CZ"
//* ^status = #active
* insert SetFmmandStatusRule ( 1, draft )
* insert ImposeProfile($RelatedPerson, 0)

* name 0..1 //MS  // name element must be provided
* name obeys cz-relPer-1
* name.given ^min = 1

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Invariant: cz-relPer-1
Description: "RelatedPerson.name.given, RelatedPerson.name.family, RelatedPerson.name.text or data-absent-reason MUST be filled"
Severity: #error
Expression: "family.exists() or given.exists() or text.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
