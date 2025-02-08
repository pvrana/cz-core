CodeSystem: ContactRoleSupplement
Id: contact-role-supplement
Description: "CodeSystem Supplement for code system ContactRole"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "https://ncez.mzcr.cz/fhir/CodeSystem/contact-role-supplement"
* ^title = "Code system of patient contact person types"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2024-01-01"
* ^publisher = "NCEZ"
* ^content = #supplement
* ^supplements = "http://terminology.hl7.org/CodeSystem/v2-0131"
* insert SetFmmandStatusRule(2, trial-use)


* #C
* #C ^designation.language = #cs
* #C ^designation.value = "Emergentní kontakt"
* #E
* #E ^designation.language = #cs
* #E ^designation.value = "Zaměstnavatel"
* #F
* #F ^designation.language = #cs
* #F ^designation.value = "Federální instituce"
* #I
* #I ^designation.language = #cs
* #I ^designation.value = "Zdravotní pojišťovna"
* #N
* #N ^designation.language = #cs
* #N ^designation.value = "Příbuzný"
* #S
* #S ^designation.language = #cs
* #S ^designation.value = "Státní instituce"
* #O
* #O ^designation.language = #cs
* #O ^designation.value = "Ostatní"
* #U
* #U ^designation.language = #cs
* #U ^designation.value = "Neznámý"


