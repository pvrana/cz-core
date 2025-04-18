//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_OrganizationBase
Parent:     OrganizationEu
Id:         cz-organization-base
Title:      "Organization (CZ base)"
Description: "Czech national profile for an organization."
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
//* ^status = #active
* ^experimental = false
* insert SetFmmandStatusRule ( 1, draft )
* ^purpose = "This profile specifies how the HL7 FHIR Organization resource should be used for conveying commonly used concepts in the Czech national context."

//* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "Identifier for the organization that is used to identify the organization across multiple disparate systems. \r\nTypically, an KRPZS value and/or IČO or IČZ/IČP value are given. Other systems are allowed, however use of KRPZS Id is preferred. Flows in organizations will most likely want to also include a local identifier, using its own identification system. A type can be added if needed. When it is given, a consumer SHALL NOT ignore it."
* identifier contains
    KRPZS 0..1 and
    ICO 0..1 and
    ICZ 0..1 and
    ICP 0..1 and
    KP 0..1
* identifier[KRPZS].system = "https://ncez.mzcr.cz/fhir/sid/krpzs" (exactly)
* identifier[KRPZS].value 1..
* identifier[ICO].system = "https://ncez.mzcr.cz/fhir/sid/ico" (exactly)
* identifier[ICO].value 1..
* identifier[ICZ].system = "https://ncez.mzcr.cz/fhir/sid/icz" (exactly)
* identifier[ICZ].value 1..
* identifier[ICP].system = "https://ncez.mzcr.cz/fhir/sid/icp" (exactly)
* identifier[ICP].value 1..
* identifier[KP].system = "https://www.dastacr.cz/dasta/nclp_data/ds_UZIS/ZdravotniPojistovna.xml" (exactly)
* identifier[KP].value 1..

* active ^definition = "Whether the organization's record is still in active use."

//* name MS

* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "coding.system"
* type ^slicing.rules = #open
* type ^definition = "The kind(s) of organization that this is.\r\n\r\n. Type should be taken from DRZAR value set."
//* type only CZ_CodeableConcept
* type contains DRZAR 0..*
* type[DRZAR].coding.system = $drzar (exactly)
* type[DRZAR].coding.code 1..
* type[DRZAR] from DrzarVS (required)

//* telecom ^definition = "A contact detail for the organization.\r\n\r\nIt is RECOMMENDED to at least add one phone or email address."

* address only CZ_Address
//* address ^definition = "An address for the organization.\r\n\r\nIt is RECOMMENDED to include this when available"