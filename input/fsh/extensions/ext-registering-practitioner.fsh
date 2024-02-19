Extension: RegisteringProviderCz
Id:   registering-provider-cz
Title:  "Registrující poskytovatel"
Description: "Tato extenze umožňuje zápis registrujícího poskytovatele a jeho kategorii./n/nThis extension allows the registration of the registering healthcare provider and its category/specialty (general practitioner for children and youth, general practitioner for adults, dentist, gynecologist)."
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* insert ExtensionContext(Patient)
* insert SetFmmandStatusRule(1, draft)
* . ^short = "Registrující poskytovatel / Registering healthcare provider"
* . ^definition = "Toto rozšíření umožňuje zápis informace o registrujícím poskytovateli a jeho kategorii/oboru poskytované péče (všeobecné praktické lékařství, praktické lékařství pro děti a dorost, zubní lékařství nebo gynekologie a porodnictví), který přijal pacienta do péče za účelem poskytnutí primární ambulantní péče./n/nThis extension allows the entry of information on the registering provider and their category/specialty of care (general practice, paediatric and adolescent practice, dentistry or gynaecology and obstetrics) who has admitted the patient for primary outpatient care."

* extension contains
    value 1..1 and
    category 1..1

* extension[value] only Extension
* extension[value] ^short = "Registrující poskytovatel / Registering healthcare provider"
* extension[value] ^definition = "Reference na registrujícího poskytovatele. Typ registrujícího poskytovatele je uveden v elementu category."
* extension[value] ^comment = "V každém okamžiku může mít pacient nejvýše jednoho registrujícího poskytovatele v oboru všeobecné praktické lékařství nebo v oboru praktické lékařství pro děti a dorost a jednoho registrujícího poskytovatele v oboru zubní lékařství. Pacientky mohou mít také nejvýše jednoho registrujícího poskytovatele v oboru gynekologie a porodnictví."
* extension[value].url only uri
* extension[value].value[x] 1..1
* extension[value].value[x] only Reference(CZ_Organization or CZ_PractitionerRole)

* extension[category] only Extension
* extension[category] ^short = "Typ registrujícího lékaře"
* extension[category] ^definition = "Typ registrujícího lékaře: registrující praktický lékař, praktický lékař pro děti a dorost, registrující gynekolog či registrující zubař."
* extension[category] ^comment = ""
* extension[category].url only uri
* extension[category].value[x] 1..1
* extension[category].value[x] only CodeableConcept
* extension[category].value[x] from typ-registrujiciho-lekare-vs