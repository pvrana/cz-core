Profile: CZ_Rodcis_Identifier
Parent: Identifier
Id: cz-rodcis-identifier
Title: "Czech national birth number"
Description: "This structure contains the Czech identifier of a person (personal identification number)"
* insert SetFmmandStatusRule(1, draft)
* use = #official (exactly)
* system 1..1
* system = "https://ncez.mzcr.cz/fhir/sid/rcis" (exactly)
* value 1..1
  * obeys rc
  * ^maxLength = 10
  * ^mustSupport = false


Invariant: rc
Description: "Czech national personal ID rule"
Severity: #error
Expression: "matches('[0-9]{2}(?:[0257][1-9]|[1368][0-2])(?:0[1-9]|[12][0-9]|3[01])[0-9]{3,4}')"
* requirements = "Czech national personal ID rules."
