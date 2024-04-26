ValueSet: CZ_TypRegistrujicihoLekareVS
Id: typ-registrujiciho-lekare-vs
Title: "Typ registrujícího lékaře / Type of registering physician"
Description: "Číselník typů registrujících lékařů"
* ^language = #cs
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.203.24341.11.1.10"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2024-01-23"
* ^publisher = "NCEZ"
* ^experimental = false
* ^url = "https://ncez.mzcr.cz/fhir/ValueSet/typ-registrujiciho-lekare-vs"
* insert SetFmmandStatusRule(1, draft)

//* include codes from system snomed-supplement-service-type
//* include codes from system snomed-supplement-service-type--1.0.0
//* cz-tab-ta#4 "registrující lékař"
//* cz-tab-ta#G "registrující gynekolog"
//* cz-tab-ta#M "registrující stomatolog"
* $sct#700232004 "Všeobecné lékařské služby"
* $sct#310060005 "Gynekologické a porodnické služby"
* $sct#722176000 "Stomatologické služby"

