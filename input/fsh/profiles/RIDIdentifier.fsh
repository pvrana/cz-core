Profile: CZ_RID_Identifier
Parent: Identifier
Id: cz-rid-identifier
Title: "Czech national health sector identifier"
Description: "This structure contains the Czech identifier of a person (personal identification number) in healthcare sector"
* insert SetFmmandStatusRule(1, draft)
* use = #official (exactly)
* system 1..1
* system = "https://ncez.mzcr.cz/fhir/sid/rid" (exactly)
* value 1..1
  * obeys rid-rule
  * ^maxLength = 10
//  * ^mustSupport = true

/*
Invariant: rid_rule
Description: "Czech national RID rule"
Severity: #error
Expression: "matches('D\d{9}|[1-9]\d{9}')"
* requirements = "Czech national RID rules."
*/


Invariant: rid-rule
Description: "Czech national personal ID rule"
Severity: #error
Expression: "matches('(D\\d{9}|[1-9]\\d{9})')"
* requirements = "Czech national personal ID rules."
