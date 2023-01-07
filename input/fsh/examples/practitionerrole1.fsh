Instance: practitionerrole1
InstanceOf: CZ_PractitionerRole
Usage: #example
Description: "Ordinace praktického lékaře"
* meta.versionId = "1"
* meta.lastUpdated = "2019-07-01T13:30:55.864+00:00"
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "23"
* active = true
* period.start = "2022-08-01T00:00:00.000Z"
* period.end = "2022-12-31T00:00:00.000Z"
* practitioner = Reference(Practitioner/Practitioner-2) "MUDr. Stanislava Kubšová"
* organization = Reference(Organization/Organization-2) "MUDr. Stanislava Kubšová"
* code = $drzar#320 "Samost. ordinace všeob. prakt. lékaře"

* specialty = $sct#419772000 "Family practice"
* availableTime[0].daysOfWeek[0] = #mon
* availableTime[=].daysOfWeek[+] = #wed
* availableTime[=].availableStartTime = "12:30:00"
* availableTime[=].availableEndTime = "18:30:00"
* availableTime[=].daysOfWeek[0] = #tue
* availableTime[+].daysOfWeek[+] = #thu
* availableTime[=].daysOfWeek[+] = #fri
* availableTime[=].availableStartTime = "07:00:00"
* availableTime[=].availableEndTime = "13:00:00"
* notAvailable.description = "Plánovaná dovolená"
* notAvailable.during.start = "2023-08-01T00:00:00.000Z"
* notAvailable.during.end = "2023-08-20T00:00:00.000Z"
* availabilityExceptions = "Státní svátky"