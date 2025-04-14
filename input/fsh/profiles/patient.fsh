//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CZ_PatientBase
Parent:   PatientEu
Id:       cz-patient-base
Title:    "Patient (CZ base)"
Description: """This profile specifies how the HL7 FHIR Patient resource should be used to convey commonly used concepts in context of the Czech national interoperability standards."""

* ^description = "This profile defines how to represent Patient in FHIR for the purpose of the Czech national interoperability standards."
* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
//* ^status = #active
* ^experimental = false
* insert SetFmmandStatusRule ( 1, draft )

//* language = urn:ietf:bcp:47#cs  -- todo EJAZYK

* identifier //MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "Patient identifier.\r\n\r\nWhen available, one of the national identifiers (patient number from the national patient register, birth number (RC), insurance number) is usually used. Organisations may also provide a local identifier using their own identification system. If necessary, the type of identifier can also be added."
* identifier contains RC 0..1 //MS
* identifier[RC]
  * ^short = "Personal Number"
  * ^definition = "Patient identifier assigned under the Czech Population Registration Act."
* identifier[RC] only CZ_Rodcis_Identifier
* identifier[RC].system = "https://ncez.mzcr.cz/fhir/sid/rcis" (exactly)  // could be also "urn:oid:2.16.840.1.113883.2.40.1"
* identifier[RC].value 1..1
* identifier contains RID 0..1 //MS
* identifier[RID]
  * ^short = "National Health Identifier"
  * ^definition = "An unique patient identifier (resortní identifikátor) according to the National Patient Register"
* identifier[RID] only CZ_RID_Identifier
* identifier[RID].system = "https://ncez.mzcr.cz/fhir/sid/rid" (exactly)
* identifier[RID].value 1..1
* identifier contains CPOJ 0..1 //MS
* identifier[CPOJ]
  * ^short = "Health Insurance Number"
  * ^definition = "An unique patient identifier (číslo pojištěnce) according to the National Health Insurance Register"
* identifier[CPOJ].system = "https://ncez.mzcr.cz/fhir/sid/cpoj" (exactly)
* identifier[CPOJ].value 1..1
* identifier contains OP 0..1 //MS
* identifier[OP]
  * ^short = "National Identity Card Number"
  * ^definition = "An unique patient identifier (National ID Card Number) issued by the ministry of interior"
* identifier[OP].system = "https://ncez.mzcr.cz/fhir/sid/op" (exactly)
* identifier[OP].value 1..1
* identifier contains PAS 0..* //MS
* identifier[PAS]
  * ^short = "Passport Number"
  * ^definition = "An unique patient identifier (Passport Number)"
* identifier[PAS].system from PassportNSVS
  * ^short = "Name space according to the passport issuer. FHIR records namespaces for passports in the format - http://hl7.org/fhir/sid/passport-XXX, where XXX is the three-letter country code according to ISO 3166"
* identifier[PAS].use = #official
* identifier[PAS].type = $v2-0203#PPN
* identifier[PAS].value 1..1


* name 1..* MS  // patient name element must be provided
* name only HumanNameEu
* name obeys cz-pat-1
* name ^definition = "A name associated with the individual. \n\nIt is RECOMMENDED to give at least one family name and at least one given name when possible and define an 'official' use. When names are given, a consumer SHALL NOT ignore it."
* name ^requirements = "A patient may be known by several different names. An example is an official name and a nickname or pseudonym.\r\nIn all cases, the alphabetical representation of the name is always used."
* name.text MS
* name.text ^definition = "Text representation of the full name. Due to the cultural variance around the world a consuming system may not know how to present the name correctly; moreover not all the parts of the name go in given or family. Creators are therefore strongly encouraged to provide through this element a presented version of the name. Future versions of this guide may require this element"
* name.text ^min = 0
* name.family 0..1 MS
* name.given MS
* name.given ^min = 1


* telecom MS
* telecom
  * ^short = "A contact detail for the individual"
  * ^definition = "A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.\n\nIt is RECOMMENDED to at least add one phone or email address with clear indication using the .use element whether it is home use, work use, etc."

* gender MS  // gender must be supported
  * ^definition = "Gender for official purposes"

* gender from $CZ_AdministrativegenderVS (required)

* birthDate 1..1 //MS
* birthDate ^definition = "The date of birth for the patient.\n\nIt is RECOMMENDED to give the birthdate when available."

* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension contains $patient-birthTime named birthTime 0..1
* birthDate.extension[birthTime].value[x] only dateTime

* deceased[x] //MS
  * ^short = "Death information either by symptom or date of death"
  * ^definition = "Death information either by symptom or date of death \n\nIt is RECOMMENDED to include death information in all relevant cases."
/*
* deceasedBoolean
  * ^short = "Indikace úmrtí - příznak"
  * ^definition = "Logický příznak úmrtí pacienta"
* deceasedDateTime
  * ^short = "Datum úmrtí pacienta"
  * ^definition = "Datum a případně také čas úmrtí pacienta"
*/
//* address MS
* address only CZ_Address
  * ^definition = "An address for the individual. \n\nIt is RECOMMENDED to include an address when available."
  * obeys cnt-2-char

* generalPractitioner // MS  // general practicioner must be supported
  * ^short = "A physician or provider nominated by the patient"
  * ^definition = "Patient's nominated care provider.\n\nTake note this does not automatically imply any legal form of therapeutic link or consent relationship with this GP. It is RECOMMENDED to include this when available if the flow is in any way medical. Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this GP can be found. Alternatively, there is only an internal reference and the GP is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
  * ^comment = "This may be a primary or specialist outpatient care provider, or it may be a patient-designated carer in a community or disability setting, or an organisation that provides people to act as care providers. If it is a registering provider, the reference will also be included in the \"registeringProvider\" extension. This element should not be used to register care teams, these should be in the CareTeam resource, which can be linked to the CarePlan or EpisodeOfCare resources. \n Multiple providers may be recorded for a patient for different reasons, for example a student who has their GP listed alongside their GP at the university, or a worker who has a GP listed alongside their GP at the workplace to keep them informed of health issues."
* generalPractitioner only Reference(CZ_OrganizationBase or CZ_PractitionerBase or CZ_PractitionerRoleBase)

* managingOrganization only Reference(CZ_OrganizationBase)
  * ^short = "Organization that is the custodian of the patient record"
  * ^definition = "Organization that is the custodian of the patient record.\n\nThis SHOULD be included when available. Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this Organization can be found. Alternatively, there is only an internal reference and the Organization is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
  * ^comment = "There is only one managing organization for a specific patient record. Other organizations will have their own Patient record, and may use the Link property to join the records together (or a Person resource which can include confidence ratings for the association)."

* contact ^definition = "A contact party (e.g. guardian, partner, friend) for the patient.\n\nIt is RECOMMENDED to include this when available and considered relevant for the patientcare. (e.g. a parent of a young patient)"
* contact ^comment = "Contact covers all kinds of contact parties: family members, business contacts, guardians, caregivers. Not applicable to register pedigree and family ties beyond use of having contact."
//* contact.relationship only CZ_CodeableConcept
* contact.relationship from $PersonalRelationshipCzVS
/* * contact.relationship ^slicing.discriminator.type = #value
* contact.relationship ^slicing.discriminator.path = "system"
* contact.relationship ^slicing.rules = #open
* contact.relationship contains CONTACT_TYPE 0..1 MS
* contact.relationship[CONTACT_TYPE] from $v2-0131 (extensible)
* contact.relationship contains C_REL 0..1 MS
* contact.relationship[C_REL] from CZ_ContactPersonRelationVS (extensible)
 */
* contact.address only CZ_Address
* contact.organization only Reference(CZ_OrganizationBase)
* contact.gender from $CZ_AdministrativegenderVS

// zvážit zda přidat:
// - národnost (česká, moravská ...)
// - zaměstnání
// - vzdělání
//