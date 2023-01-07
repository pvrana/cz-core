Invariant: cz-pat-1
Description: "Patient.name.given, Patient.name.family nebo Patient.name.text MUSÍ být uveden"
Severity: #error
Expression: "family.exists() or given.exists() or text.exists()"
XPath: "f:given or f:family or f:text"