Profile: BodyStructureCz
Parent: BodyStructure
Id: BodyStructure-cz
Title: "Body structure: Czech profile"
Description: """This profile defines how to represent Body Structure in HL7 FHIR for the purpose of this guide."""
* extension contains $bodyStructure-laterality-r5 named laterality 0..1
* extension[laterality].valueCodeableConcept from LateralityCzVs (preferred)
* morphology from $hl7BodyStructure (preferred)
* location from $hl7BodySite (preferred)
* locationQualifier from SiteQualifierCzVs (preferred)
* image 0..0