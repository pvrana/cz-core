//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: CZ_Organization
Parent: Organization
Id: cz-organization
Title: "Organization (CZ)"
Description: "Czech national profile for an organization."
//-------------------------------------------------------------------------------------------
* ^version = "1.0.0"
* ^status = #active
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "Identifier for the organization that is used to identify the organization across multiple disparate systems. \r\nTypically, an NRPZS value and/or IČO or IČZ/IČP value are given. Other systems are allowed, however use of NRPZS Id is preferred. Flows in organizations will most likely want to also include a local identifier, using its own identification system. A type can be added if needed. When it is given, a consumer SHALL NOT ignore it."
* identifier contains
    NRPZS 0..1 and
    ICO 0..1 and
    ICZ 0..1 and
    ICP 0..1
* identifier[NRPZS].system = "https://ncez.mzcr.cz/standards/fhir/sid/nrpzs" (exactly)
* identifier[NRPZS].value 1..
* identifier[ICO].system = "https://ncez.mzcr.cz/standards/fhir/sid/ico" (exactly)
* identifier[ICO].value 1..
* identifier[ICZ].system = "https://ncez.mzcr.cz/standards/fhir/sid/icz" (exactly)
* identifier[ICZ].value 1..
* identifier[ICP].system = "https://ncez.mzcr.cz/standards/fhir/sid/icp" (exactly)
* identifier[ICP].value 1..
* active ^definition = "Whether the organization's record is still in active use."
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "coding.system"
* type ^slicing.rules = #open
* type ^definition = "The kind(s) of organization that this is.\r\n\r\nProposed use of CD-HCPARTY to type the organisation using dept... or org... codes. Other systems remain allowed.\r\nIn typical use, RECOMMENDED to type the organization.\r\nIn the future, specific other systems might also be proposed from a federal level to better type an organization."
* type contains CD-HCPARTY 0..*
* type[CD-HCPARTY].coding.system = "https://www.ehealth.fgov.be/standards/fhir/core/CodeSystem/cd-hcparty" (exactly)
* type[CD-HCPARTY].coding.code 1..1
* telecom ^definition = "A contact detail for the organization.\r\n\r\nIt is RECOMMENDED to at least add one phone or email address."
* address only CZ_Address
* address ^definition = "An address for the organization.\r\n\r\nIt is RECOMMENDED to include this when available"