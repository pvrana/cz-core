//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_OrganizationCore
Parent:     CZ_OrganizationBase
Id:         cz-organization-core
Title:      "Organization (CZ core)"
Description: """Czech national profile for an organization. This profile sets minimum expectations for the Organization resource common to most of the use cases."""
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
//* ^status = #active
* ^experimental = false
* ^purpose = "This profile constrains the representation of organization in the context of the Czech national interoperability project."
* insert SetFmmandStatusRule ( 1, draft )
* insert ImposeProfile($Organization-eu-core, 0)

* name 0..1
* identifier 0..*
* partOf only Reference (CZ_OrganizationCore)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Invariant: cz-org-1
Description: "Organization.name or Identifier.value MUST be filled."
Severity: #error
Expression: "name.text.exists() or identifier.value.exists()"

