Profile: CZ_MedicalDevice
Parent: Device
Id: cz-medical-device
Title: "Medical device (CZ)"
Description: "This profile represents the constraints applied to the Device resource by the Czech national interoperability project."
//* ^status = #active
* ^experimental = false
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* ^purpose = "This profile constrains the representation of a medical device used by or implanted on the patient."
* . ^comment = "This profile applies the rules defined by NCEZ for representing the UDI in the FHIR standard, by the document \"HL7 IG: UDI Pattern R2\""
* insert SetFmmandStatusRule ( 1, draft )

* type 0..1 MS
* type only CZ_CodeableConcept
* type from $MedicalDevicesSnomedAbsentUnknownUvIps (preferred)
* type ^short = "Type of device.\r\nPreferably valued by using SNOMED CT.\r\nThe absence of information, or absence of devices, shall be explicitly stated by using the codes included in the absent-or-unknown-devices-uv-ips value set."
* type ^binding.extension[0].extension[0].url = "purpose"
* type ^binding.extension[=].extension[=].valueCode = #candidate
* type ^binding.extension[=].extension[+].url = "valueSet"
* type ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/medical-devices-snomed-ct-ips-free-set"
* type ^binding.extension[=].extension[+].url = "documentation"
* type ^binding.extension[=].extension[=].valueMarkdown = "Codes for medical devices in SNOMED IPS Free Set"
* type ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* type ^binding.extension[+].extension[0].url = "purpose"
* type ^binding.extension[=].extension[=].valueCode = #candidate
* type ^binding.extension[=].extension[+].url = "valueSet"
* type ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/absent-or-unknown-devices-uv-ips"
* type ^binding.extension[=].extension[+].url = "documentation"
* type ^binding.extension[=].extension[=].valueMarkdown = "Codes for absent or unknown medical devices"
* type ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* type ^binding.description = "The type of device or a code for absent/unknown device"
* patient 1.. MS
* patient only Reference(CZ_PatientCore)
* patient.reference 1.. MS