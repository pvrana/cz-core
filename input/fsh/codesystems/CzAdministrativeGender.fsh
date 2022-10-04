CodeSystem: CZ_AdministrativeGender
Id: cz-administrativeGender
Title: "AdministrativeGender (CZ)"
Description: "Czech national code system for the gender of a person used for adminstrative purposes (as opposed to clinical gender)."
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.203.24341.11.2.3"
* ^version = "1.0"
* ^status = #active
* ^date = "1980-01-01"
* ^experimental = false
* ^publisher = "DASTA"
* ^caseSensitive = true
* ^content = #complete
* ^url = "https://www.ncez.mzcr.cz/standards/CodeSystem/cz-administreativeGender"

* ^property[0].extension[0].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-symmetry"
* ^property[=].extension[=].valueCode = #antisymmetric
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-transitivity"
* ^property[=].extension[=].valueCode = #transitive
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-reflexivity"
* ^property[=].extension[=].valueCode = #irreflexive
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-isNavigable"
* ^property[=].extension[=].valueBoolean = true
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-relationshipKind"
* ^property[=].extension[=].valueCode = #Specializes
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-inverseName"
* ^property[=].extension[=].valueString = "Generalizes"
* ^property[=].code = #Specializes
* ^property[=].description = "The child code is a more narrow version of the concept represented by the parent code.  I.e. Every child concept is also a valid parent concept.  Used to allow determination of subsumption.  Must be transitive, irreflexive, antisymmetric."
* ^property[=].type = #Coding
* ^property[+].extension[0].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-symmetry"
* ^property[=].extension[=].valueCode = #antisymmetric
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-transitivity"
* ^property[=].extension[=].valueCode = #transitive
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-reflexivity"
* ^property[=].extension[=].valueCode = #irreflexive
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-isNavigable"
* ^property[=].extension[=].valueBoolean = true
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-relationshipKind"
* ^property[=].extension[=].valueCode = #Generalizes
* ^property[=].extension[+].url = "http://terminology.hl7.org/StructureDefinition/ext-mif-relationship-inverseName"
* ^property[=].extension[=].valueString = "Specializes"
* ^property[=].code = #Generalizes
* ^property[=].description = "Inverse of Specializes.  Only included as a derived relationship."
* ^property[=].type = #Coding
* ^property[+].code = #status
* ^property[=].uri = "http://hl7.org/fhir/concept-properties#status"
* ^property[=].description = "Designation of a concept's state. Normally is not populated unless the state is retired."
* ^property[=].type = #code


* #M "muž" "Muž"
* #M ^designation[0].language = #cs
* #M ^designation[=].value = "muž"
* #M ^designation[+].language = #en
* #M ^designation[=].value = "Male"
* #M ^property[+].code = #status
* #M ^property[=].valueCode = #active

* #F "žena" "Žena"
* #F ^designation[0].language = #cs
* #F ^designation[=].value = "žena"
* #F ^designation[+].language = #en
* #F ^designation[=].value = "Female"
* #F ^property[+].code = #status
* #F ^property[=].valueCode = #active

* #X "nerozlišeno" "Pohlaví osoby není možné jednoznačně rozlišit.\r\nZadává se administrativní údaj (neřeší se klinicky realizované změny pohlaví a jejich varianty). Údaj se může výjimečně v čase změnit."
* #X ^designation[0].language = #cs
* #X ^designation[=].value = "nerozlišeno"
* #X ^designation[+].language = #en
* #X ^designation[=].value = "Undifferentiated"
* #X ^property[+].code = #status
* #X ^property[=].valueCode = #active