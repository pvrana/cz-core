//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_Specimen
Parent:     Specimen
Id:         cz-specimen
Title:      "Specimen"
Description: "Czech national profile for a specimen"
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* ^experimental = false

* text.status = #empty
* identifier MS
* identifier ^definition = "Business identifier for specimen is RECOMMENDED to include when available."
* status MS
* type MS
* type ^definition = "The kind of material that forms the specimen. RECOMMENDED to include."
//* type from CZ_MikrobiologickeVzorkyDASTAVS (preferred)
* subject only Reference(Group or Device or CZ_MedicalDevice or Substance or Location or CZ_PatientCore)
* subject MS
* subject ^short = "In the initial iteration of the Czech interoperability project, this is CZ_PatientCore."
* receivedTime MS
* parent only Reference(CZ_Specimen)
* parent MS
* request MS
* collection
  * bodySite from $hl7BodySite (preferred)
    * ^comment = "If the specimen.type conveys information about the site the specimen has been collected from, then, if the bodySite is present, it shall be coherent with the type"
  * extension contains $bodySite-reference named bodySite 0..1
  * extension[bodySite].valueReference only Reference(BodyStructureCz)
* processing.additive only Reference(Substance or SpecimenAdditiveSubstance)
* container
  * type from SpecimenContainerCz (preferred)
  * additive[x] 0..0
  * extension contains $specimen-container-device-r5 named device 0..1
  * extension[device].valueReference only Reference(Device)
* processing ^short = "Processing and processing step details to include when not implicit from specimen."
* condition MS
* note MS

// ----------------------------------------

Profile: SpecimenAdditiveSubstance
Parent: Substance
Id: Substance-additive-cz
Title: "Substance: Specimen Additive Substance"
Description: """This profile defines how to represent Specimen Additive Substances in HL7 FHIR for the purpose of this guide."""
* code from SpecimenAdditiveCz (preferred)
