Invariant: cz-pat-1
Description: "Patient.name.given, Patient.name.family, Patient.name.text nebo data-absent-reason MUSÍ být uveden"
Severity: #error
Expression: "family.exists() or given.exists() or text.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"

Invariant: cz-pat-2
Description: "Pacient může mít pouze jednoho registrujícího lékaře daného typu"
Severity: #error
Expression: "extension('$registering-provider').extension('category').isDistinct()"
