Instance: cz-administrative-gender-vs
InstanceOf: ValueSet
Usage: #definition
* url = "https://ncez.mzcr.cz/fhir/ValueSet/cz-administrative-gender-vs"
* version = "1.0.0"
* status = #active
* date = "2022-12-26"
* publisher = "NCEZ"
* name = "AdministrativeGender"
* title = "Administrative Gender"
* description = "Gender for administrative purposes"
* experimental = false
* compose.include[0].system = "http://hl7.org/fhir/administrative-gender"
* compose.include[=].concept[0].code = #male
* compose.include[=].concept[=].designation[0].language = #en
* compose.include[=].concept[=].designation[=].value = "Male"
* compose.include[=].concept[=].designation[+].language = #cs
* compose.include[=].concept[=].designation[=].value = "Muž"
* compose.include[=].concept[+].code = #female
* compose.include[=].concept[=].designation[0].language = #en
* compose.include[=].concept[=].designation[=].value = "Female"
* compose.include[=].concept[=].designation[+].language = #cs
* compose.include[=].concept[=].designation[=].value = "Žena"
* compose.include[=].concept[+].code = #other
* compose.include[=].concept[=].designation[0].language = #en
* compose.include[=].concept[=].designation[=].value = "Other"
* compose.include[=].concept[=].designation[+].language = #cs
* compose.include[=].concept[=].designation[=].value = "Jiné"
* compose.include[=].concept[+].code = #unknown
* compose.include[=].concept[=].designation[0].language = #en
* compose.include[=].concept[=].designation[=].value = "Unknown"
* compose.include[=].concept[=].designation[+].language = #cs
* compose.include[=].concept[=].designation[=].value = "Neznámé"