/* ValueSet: CZ_AdministrativegenderVS
Id: cz-administrative-gender-vs
Title: "AdministrativeGender (CZ)"
Description: "Pohlaví pro úřední účely"
* ^language = #cs
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.1"
* ^version = "5.0.0"
* ^status = #active
* ^date = "2022-12-26"
* ^publisher = "NCEZ"
//* include codes from system CZ_AdministrativeGenderCS
* compose.include[0].system = "http://hl7.org/fhir/administrative-gender"
* compose.include[=].concept[0].code = #male
* compose.include[=].concept[=].designation[0].language = #en
* compose.include[=].concept[=].designation[=].value = "Male"
* compose.include[=].concept[=].designation[+].language = #cz-CZ
* compose.include[=].concept[=].designation[=].value = "Muž"
* compose.include[=].concept[+].code = #female
* compose.include[=].concept[=].designation[0].language = #en
* compose.include[=].concept[=].designation[=].value = "Female"
* compose.include[=].concept[=].designation[+].language = #cz-CZ
* compose.include[=].concept[=].designation[=].value = "Žena"
* compose.include[=].concept[+].code = #other
* compose.include[=].concept[=].designation[0].language = #en
* compose.include[=].concept[=].designation[=].value = "Other"
* compose.include[=].concept[=].designation[+].language = #cz-CZ
* compose.include[=].concept[=].designation[=].value = "Jiné"
* compose.include[=].concept[+].code = #unknown
* compose.include[=].concept[=].designation[0].language = #en
* compose.include[=].concept[=].designation[=].value = "Unknown"
* compose.include[=].concept[=].designation[+].language = #cz-CZ
* compose.include[=].concept[=].designation[=].value = "Neznámé" */