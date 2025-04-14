//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_AllergyIntolerance
Parent:     AllergyIntolerance
Id:         cz-allergyIntolerance
Title:      "AllergyIntolerance"
Description: "Czech national profile for an Allergy Intolerance"
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* ^experimental = false

* identifier 1..
* patient MS
* patient only Reference(CZ_PatientCore)
* clinicalStatus 1..
* clinicalStatus from $hl7AllergyintoleranceClinical
* type MS
* type from $hl7AllergyintoleranceType
* category MS
* category from $hl7AllergyintoleranceCategory
* code MS
* note MS