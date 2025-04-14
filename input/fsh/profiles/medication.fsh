//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_MedicationStatement
Parent:     MedicationStatement
Id:         cz-MedicationStatement
Title:      "Medication Statement"
Description: "Czech national profile for a medication statement"
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* ^experimental = false

* identifier 1..
* status MS
* status from $hl7MedicationStatementStatus
* medication[x]
* medication[x] only Reference(Medication) or CodeableConcept
//* medicationCodeableConcept from $SNOMEDCTMedicationCodes // doplnit DLP a ATC
* dosage 
* dosage only Dosage