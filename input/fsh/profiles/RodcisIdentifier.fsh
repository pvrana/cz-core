Profile: CZ_Rodcis_Identifier
Parent: Identifier
Id: cz-rodcis-identifier
Title: "Rodné číslo / Czech national birth number"
Description: "Tato struktura obsahuje český identifikátor osoby (rodné číslo)"
* insert SetFmmandStatusRule(1, draft)
* use = #official (exactly)
* system 1..1
* system = "https://ncez.mzcr.cz/fhir/sid/rcis" (exactly)
* value 1..1
  * obeys rc
  * ^maxLength = 10
  * ^mustSupport = false


Invariant: rc
Description: "Pravidlo pro rodná čísla"
Severity: #error
Expression: "matches('[0-9]{2}(?:[0257][1-9]|[1368][0-2])(?:0[1-9]|[12][0-9]|3[01])[0-9]{3,4}')"
* requirements = "Pravidlo pro české rodné číslo / Czech national personal ID rules."
