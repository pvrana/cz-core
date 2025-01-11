Profile: CZ_Coding
Parent: CodingIPS
Id: cz-coding
Title: "Coding data type"
//Description: "This profile adds must-support constraints to the coding data type."
Description: "This profile extends the capabilities of the coding data type to support multi-language designations (display).
It relies on the Translation extension."
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* insert SetFmmandStatusRule(1, draft)
* system MS
* code MS
* display MS

// from IPS
/*
* display.extension ^slicing.discriminator.type = #value
* display.extension ^slicing.discriminator.path = "url"
* display.extension ^slicing.rules = #open
* display.extension[translation] only Translation
* display.extension[translation] ^sliceName = "translation"
* display.extension[translation] ^short = "Language Translation (Localization)"
*/

// Prodiskutovat, zda chceme implicitně umožnit překlady kódů do jiných jazykových mutací
/*
* display.extension ^slicing.discriminator.type = #value
* display.extension ^slicing.discriminator.path = "url"
* display.extension ^slicing.rules = #open
* display.extension contains http://hl7.org/fhir/StructureDefinition/translation named translation 0..
* display.extension[translation]
  * ^sliceName = "translation"
  * ^short = "Language Translation (Localization)"
*/