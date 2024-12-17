Profile: CZ_CodeableConcept
Parent: CodeableConcept
Id: cz-codeable-concept
Title: "Codeable Concept (CZ)"
Description: "This profile represents the constraint applied to the CodeableConcept data type by the Czech national FHIR Core Implementation Guide to use the CZ_Coding data type profile."
//* ^publisher = "HL7 CZ"
* insert SetFmmandStatusRule(1, draft)
* coding only CZ_Coding
* coding MS
* text MS
* text ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* text ^extension.valueBoolean = true