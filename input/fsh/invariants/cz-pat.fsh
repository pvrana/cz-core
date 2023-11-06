Invariant: cz-pat-1
Description: "Patient.name.given, Patient.name.family, Patient.name.text nebo data-absent-reason MUSÍ být uveden"
Severity: #error
Expression: "family.exists() or given.exists() or text.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"