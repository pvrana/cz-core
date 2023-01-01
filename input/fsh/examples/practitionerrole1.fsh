Instance: practitionerrole1
InstanceOf: CZ_PractitionerRole
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2019-07-01T13:30:55.864+00:00"
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "23"
* active = true
* period.start = "2022-08-01T00:00:00.000Z"
* period.end = "2022-12-31T00:00:00.000Z"
* practitioner = Reference(https://www.anotherfhirserver.cz/fhir/Practitioner/01) "MUDr. Josef Švejk"
* code = $drzar#320 "Samost. ordinace všeob. prakt. lékaře"
* specialty = $sct#419772000 "Family practice"
* availableTime[0].daysOfWeek[0] = #mon
* availableTime[=].daysOfWeek[+] = #tue
* availableTime[=].daysOfWeek[+] = #wed
* availableTime[=].availableStartTime = "09:00:00"
* availableTime[=].availableEndTime = "16:30:00"
* availableTime[+].daysOfWeek[0] = #thu
* availableTime[=].daysOfWeek[+] = #fri
* availableTime[=].availableStartTime = "09:00:00"
* availableTime[=].availableEndTime = "12:00:00"
* notAvailable.description = "Plánovaná dovolená"
* notAvailable.during.start = "2023-08-01T00:00:00.000Z"
* notAvailable.during.end = "2023-08-20T00:00:00.000Z"
* availabilityExceptions = "Státní  svátky"