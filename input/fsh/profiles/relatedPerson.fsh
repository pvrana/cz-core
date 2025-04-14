//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_RelatedPersonBase
Parent:     RelatedPerson
Id:         cz-relatedPerson-base
Title:      "Related person (CZ base)"
Description: "Czech national profile for a related person. Contains an information about a person that is involved in the care for a patient, 
but who is not the target of healthcare, nor has a formal responsibility in the care process."
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* ^experimental = false

* identifier 0..* //MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "Patient identifier.\r\n\r\nWhen available, one of the national identifiers (patient number from the national patient register, birth number (RC), insurance number) is usually used. Organisations may also provide a local identifier using their own identification system. If necessary, the type of identifier can also be added."
* identifier contains RC 0..1 //MS
* identifier[RC]
  * ^short = "Personal Number"
  * ^definition = "Patient identifier assigned under the Czech Population Registration Act."
* identifier[RC] only CZ_Rodcis_Identifier
//* identifier[RC].system = "https://ncez.mzcr.cz/fhir/sid/rcis" (exactly)  // could be also "urn:oid:2.16.840.1.113883.2.40.1"
//* identifier[RC].value 1..1
* identifier contains CPOJ 0..1 //MS
* identifier[CPOJ]
  * ^short = "Health Insurance Number"
  * ^definition = "An unique patient identifier (číslo pojištěnce) according to the National Health Insurance Register"
* identifier[CPOJ].system = "https://ncez.mzcr.cz/fhir/sid/cpoj" (exactly)
* identifier[CPOJ].value 1..1
* identifier contains PAS 0..* //MS
* identifier[PAS]
  * ^short = "Passport Number"
  * ^definition = "An unique patient identifier (Passport Number)"
* identifier[PAS].system from PassportNSVS
  * ^short = "Name space according to the passport issuer. FHIR records namespaces for passports in the format - http://hl7.org/fhir/sid/passport-XXX, where XXX is the three-letter country code according to ISO 3166"
* identifier[PAS].use = #official
* identifier[PAS].type = $v2-0203#PPN
* identifier[PAS].value 1..1

* relationship 0..* //MS
//* relationship contains $PersonalRelationshipCzVS

* name 0..1 //MS
* name only HumanNameEu

* address only CZ_Address

* patient only Reference(CZ_PatientCore)

* gender from $CZ_AdministrativegenderVS (required)

* birthDate 0..1 //MS
* birthDate ^definition = "The date of birth for the related person.It is RECOMMENDED to give the birthdate when available."
