//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CZ_PatientCore
Parent:   CZ_PatientBase
Id:       cz-patient-core
Title:    "Patient (CZ core)"
Description: "This profile sets minimum expectations for the Patient resource common to most of the use cases. It is based on EU Patient Core."

* ^description = "This profile sets minimum expectations for the Patient resource common to most of the use cases. It is based on EU Patient Core."
* ^publisher = "HL7 CZ"
//* ^status = #active
* ^experimental = false
* insert SetFmmandStatusRule ( 1, draft )
* insert ImposeProfile($Patient-eu-core, 0)

//* language = urn:ietf:bcp:47#cs
* extension contains
  $registering-provider named registeringProvider 0..

* extension[registeringProvider]
  * ^short = "Registering primary outpatient healthcare provider"
  * ^definition = "A registering provider means an ambulatory care provider in the field of general practice medicine, in the field of practice medicine for children and adolescents, in the field of dentistry or in the field of gynecology and obstetrics, who accepted a patient for the purpose of providing primary ambulatory care."
  * ^comment = "At any one time, a patient may have no more than one general practitioner or paediatric and adolescent practitioner and one dental registrar. Female patients may also have no more than one registered provider in gynaecology and obstetrics."
* obeys(cz-pat-2)

* name 1..* //MS  // patient name element must be provided
* name obeys cz-pat-1

/*
* name ^definition = "A name associated with the individual. \n\nIt is RECOMMENDED to give at least one family name and at least one given name when possible and define an 'official' use. When names are given, a consumer SHALL NOT ignore it."
* name ^requirements = "A patient may be known by several different names. An example is an official name and a nickname or pseudonym.\r\nIn all cases, the alphabetical representation of the name is always used."
* name.text MS
* name.text ^definition = "Text representation of the full name. Due to the cultural variance around the world a consuming system may not know how to present the name correctly; moreover not all the parts of the name go in given or family. Creators are therefore strongly encouraged to provide through this element a presented version of the name. Future versions of this guide may require this element"
* name.text ^min = 0
* name.family 0..1 MS
* name.given MS
*/
* name.given ^min = 1