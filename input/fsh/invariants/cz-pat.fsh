Invariant: cz-pat-1
Description: "Patient.name.given, Patient.name.family, Patient.name.text or data-absent-reason MUST be filled"
Severity: #error
Expression: "family.exists() or given.exists() or text.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"

Invariant: cz-pat-2
Description: "A patient can have only one registering physician of a given type"
Severity: #error
Expression: "extension('$registering-provider').extension('category').isDistinct()"
