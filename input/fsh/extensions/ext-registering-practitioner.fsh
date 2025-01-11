Extension: RegisteringProviderCz
Id:   registering-provider-cz
Title:  "Registering provider"
Description: "This extension allows the registration of the registering healthcare provider and its category/specialty (general practitioner for children and youth, general practitioner for adults, dentist, gynecologist)."
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* insert ExtensionContext(Patient)
* insert SetFmmandStatusRule(1, draft)
* . ^short = "Registering healthcare provider"
* . ^definition = "This extension allows the entry of information on the registering provider and their category/specialty of care (general practice, paediatric and adolescent practice, dentistry or gynaecology and obstetrics) who has admitted the patient for primary outpatient care."

* extension contains
    value 1..1 and
    category 1..1

* extension[value] only Extension
* extension[value] ^short = "Registering healthcare provider"
* extension[value] ^definition = "Reference to the registering provider. The type of registering provider is specified in the category element."
* extension[value] ^comment = "At any given time, a patient may have no more than one registering provider in general practice or pediatric practice and one registering provider in dentistry. Patients may also have a maximum of one registered provider in the field of gynecology and obstetrics."
* extension[value].url only uri
* extension[value].value[x] 1..1
* extension[value].value[x] only Reference(CZ_OrganizationCore or CZ_PractitionerRoleCore)

* extension[category] only Extension
* extension[category] ^short = "Type of registering healthcare provider"
* extension[category] ^definition = "Type of registering healthcare provider: registering general practitioner, general practitioner for children and adolescents, registering gynecologist or registering dentist."
* extension[category] ^comment = ""
* extension[category].url only uri
* extension[category].value[x] 1..1
* extension[category].value[x] only CodeableConcept
* extension[category].value[x] from typ-registrujiciho-lekare-vs