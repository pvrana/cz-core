//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_Coverage
Parent:     Coverage
Id:         cz-coverage
Title:      "Coverage"
Description: "Czech national profile for a coverage"
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* ^experimental = false

* insert SetFmmandStatusRule ( 0, draft )

* type MS
* type.coding from $hl7CoverageType

* payor only Reference(CZ_PatientCore or CZ_OrganizationCore)