/* CodeSystem: CZ_AdministrativeGenderCS
Id: cz-administrative-gender-cs
Title: "AdministrativeGender"
Description: "The gender of a person used for administrative purposes."
* ^meta.lastUpdated = "2022-05-28T12:47:40.239+10:00"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pa
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #normative
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 5
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-normative-version"
* ^extension[=].valueCode = #4.0.0
* ^url = "http://hl7.org/fhir/administrative-gender"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.1.2"
* ^version = "4.3.0"
* ^status = #active
* ^experimental = false
* ^date = "2022-05-28T12:47:40+10:00"
* ^caseSensitive = true
* ^valueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
* ^content = #complete
* #male "Muž" "Muž."
* #male ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/codesystem-concept-comments"
* #male ^extension[=].valueString = "Muž"
* #male ^designation[0].language = #cs
* #male ^designation[=].value = "muž"
* #male ^designation[+].language = #en
* #male ^designation[=].value = "Male"

* #female "Žena" "Žena."
* #female ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/codesystem-concept-comments"
* #female ^extension[=].valueString = "Žena"
* #female ^designation[+].language = #cs
* #female ^designation[=].value = "Žena"
* #female ^designation[+].language = #en
* #female ^designation[=].value = "Female"

* #other "Jiné" "Jiné."
* #other ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/codesystem-concept-comments"
* #other ^extension[=].valueString = "The administrative gender is a value other than male/female/unknown. Where this value is selected, systems may often choose to include an extension with the localized more specific value."
* #other ^designation[+].language = #cs
* #other ^designation[=].value = "Jiné"
* #other ^designation[+].language = #en
* #other ^designation[=].value = "Other"

* #unknown "Neznámé" "Neznámé."
* #unknown ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/codesystem-concept-comments"
* #unknown ^extension[=].valueString = "A proper value is applicable, but not known.  Usage Notes: This means the actual value is not known. If the only thing that is unknown is how to properly express the value in the necessary constraints (value set, datatype, etc.), then the OTH or UNC flavor should be used. No properties should be included for a datatype with this property unless:  Those properties themselves directly translate to a semantic of \"unknown\". (E.g. a local code sent as a translation that conveys 'unknown') Those properties further qualify the nature of what is unknown. (E.g. specifying a use code of \"H\" and a URL prefix of \"tel:\" to convey that it is the home phone number that is unknown.)"
* #unknown ^designation[+].language = #cs
* #unknown ^designation[=].value = "Neznámé"
* #unknown ^designation[+].language = #en
* #unknown ^designation[=].value = "Unknown"
 */