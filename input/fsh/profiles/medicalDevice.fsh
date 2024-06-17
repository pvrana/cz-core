Profile: CZ_MedicalDevice
Parent: Device
Id: cz-medical-device
Title: "Medical device (CZ)"
Description: """Tento profil představuje požadavky na Device v rámci českého národního projektu interoperability.

This profile represents the constraints applied to the Device resource by the Czech national interoperability project."""
//* ^status = #active
* ^experimental = false
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* ^purpose = "Tento profil vymezuje reprezentaci zdravotnického prostředku, který je používán pacientem nebo je pacientovi implantován. / This profile constrains the representation of a medical device used by or impanted on the patient."
* . ^comment = "Tento profil aplikuje pravidla definovaná NCEZ pro reprezentaci UDI ve standardu FHIR dokumentem \"HL7 IG: UDI Pattern R2\". / This profile applies the rules defined by NCEZ for representing the UDI in the FHIR standard, by the document \"HL7 IG: UDI Pattern R2\""
* insert SetFmmandStatusRule ( 1, draft )

* type 0..1 MS
* type only CZ_CodeableConcept
* type from $MedicalDevicesSnomedAbsentUnknownUvIps (preferred)
* type ^short = "Typ zdravotnického prostředku.\r\nPřednostně se uvádí pomocí kódu SNOMED CT. \r\nAbsence informací nebo nepřítomnost zdravotnického prostředku se výslovně uvede pomocí kódů z číselníku absent-or-unknown-devices-uv-ips. / Type of device.\r\nPreferably valued by using SNOMED CT.\r\nThe absence of information, or absence of devices, shall be explicitly stated by using the codes included in the absent-or-unknown-devices-uv-ips value set."
* type ^binding.extension[0].extension[0].url = "purpose"
* type ^binding.extension[=].extension[=].valueCode = #candidate
* type ^binding.extension[=].extension[+].url = "valueSet"
* type ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/medical-devices-snomed-ct-ips-free-set"
* type ^binding.extension[=].extension[+].url = "documentation"
* type ^binding.extension[=].extension[=].valueMarkdown = "Kód zdravotnického prostředku z číselníku SNOMED IPS Free Set / Codes for medical devices in SNOMED IPS Free Set"
* type ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* type ^binding.extension[+].extension[0].url = "purpose"
* type ^binding.extension[=].extension[=].valueCode = #candidate
* type ^binding.extension[=].extension[+].url = "valueSet"
* type ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/absent-or-unknown-devices-uv-ips"
* type ^binding.extension[=].extension[+].url = "documentation"
* type ^binding.extension[=].extension[=].valueMarkdown = "Kódy pro chybějící nebo neznámé zdravotnické prostředky. / Codes for absent or unknown medical devices"
* type ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* type ^binding.description = "Typ zdravotnického prostředku nebo kód vyjadřující, že zdravotnický prostředek není přítomen, nebo není znám. / The type of device or a code for absent/unknown device"
* patient 1.. MS
* patient only Reference(CZ_Patient)
* patient.reference 1.. MS