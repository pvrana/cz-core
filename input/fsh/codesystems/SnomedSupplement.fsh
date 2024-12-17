CodeSystem: SnomedCtSupplementServiceType
Id: snomed-supplement-service-type
Description: "CodeSystem Supplement for the Snomed CT code system"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "https://ncez.mzcr.cz/fhir/CodeSystem/snomed-supplement-service-type"
* ^title = "SNOMED CT Supplement type for registering provider"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2023-01-08"
* ^publisher = "NCEZ"
* ^content = #supplement
* ^supplements = $sct
* insert SetFmmandStatusRule(2, trial-use)

* #700232004
* #700232004 ^designation[+].language = #cs
* #700232004 ^designation[=].value = "Všeobecné lékařské služby"
* #310060005
* #310060005 ^designation.language = #cs
* #310060005 ^designation.value = "Gynekologické a porodnické služby"
* #722176000
* #722176000 ^designation.language = #cs
* #722176000 ^designation.value = "Stomatologické služby"