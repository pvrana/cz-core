Profile: CZ_PatientAnimal
Parent: Patient
Id: cz-patient-animal
Title:    "Pacient: Zvíře / Patient: Animal"
Description: """Tento profil definuje, jak reprezentovat zvíře jako pacienta v systému FHIR.
Používá se k identifikaci druhu zvířete, když je zvířeti odebrán vzorek.\n\nThis profile defines how to represent an Animal as subject of care in FHIR for the purpose of this guide.
This is used to identify the species when a specimen is collected from an animal"""
// * ^publisher = "HL7 CZ"
// * ^copyright = "HL7 CZ"
* insert SetFmmandStatusRule ( 1, draft )
* extension contains $patient-animal named patient-animal 1..1
* extension[patient-animal].extension[species]
* extension contains $recordedSexOrGender named recordedSexOrGender 0..1
* extension[recordedSexOrGender]

* telecom ..0
  * ^short = "Pužití: contact.telecom"
  * ^comment = "Zvířata nemají telefony, ale kontaktní osoby ano. Je třeba použít Contact.telecom.\n\nAnimals do not have phones, their contacts do. Contact.telecom should be used."
* maritalStatus ..0
