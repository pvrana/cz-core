Invariant: cnt-2-char
Description: "The content of the country element (if present) SHALL be selected from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2."
Severity: #warning
Expression: "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2'))"
