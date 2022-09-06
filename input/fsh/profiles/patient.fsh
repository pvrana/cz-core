//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CZ_Patient
Parent:   ips_Patient
Id:       cz-patient
Title:    "Patient (CZ)"
Description: "This profile defines how to represent Patient in FHIR for the purpose of the Czech national interoperability standards."

//-------------------------------------------------------------------------------------------
* ^description = "Information about an individual receiving health care services"
* ^version = "1.0.0"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open

/*
* extension[birthPlace] ^definition = "The birth place for a patient.\r\n\r\nThis extension SHALL be used when needed to express the place of birth of the patient."
* extension[birthPlace].value[x] only Address
*/

* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "An identifier for this patient.\r\n\r\nTypically, when National birth Id (RC) is available it is used. Organizations will most likely want to also include a local identifier, using its own system. A type can be added if needed."
* identifier contains RC 0..1
* identifier[RC] ^definition = "An identifier for this patient according to National Birth Registry\r\n\r\nWhen needed to express a RC, it SHALL be done according to these guidelines. Other ways to identify a patient using coding systems remain also possible."
* identifier[RC].system = "https://ncez.mzcr.cz/standards/fhir/sid/rcis" (exactly)  // could be also "urn:oid:2.16.840.1.113883.2.40.1"
* identifier[RC].value 1..1
* identifier contains RID 0..1   // DASTA zavedla zkratku RIP
* identifier[RID] ^definition = "An unique patient identifier (resortní identifikátor) according to the National Patient Register"
* identifier[RID].system = "https://ncez.mzcr.cz/standards/fhir/sid/rid" (exactly)
* identifier[RID].value 1..1

* name MS
* name ^definition = "A name associated with the individual. \n\nIt is RECOMMENDED to give at least one familyname and at least one given name when possible and define an 'official' use. When names are given, a consumer SHALL NOT ignore it."
* telecom ^definition = "A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.\n\nIt is RECOMMENDED to at least add one phone or email address with clear indication using the .use element whether it is home use, private use,..."

* gender 1.. MS  // gender must be supported
/* tuhle část musíme zvážit - pohlaví se v DASTA kóduje mírně odlišně, proto jsem vytvořil extenzi. Nicméně z hlediska mezinárodní (EU) interoperability bude asi lepší použí původní sadu kódů z FHIR
* gender.extension contains CZ_AdministrativeGenderExtension named administrativeGender 1..
*/

* birthDate ^definition = "The date of birth for the individual.\n\nIt is RECOMMENDED to give the birthdate when available."
* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension contains $patient-birthTime named birthTime 0..1
* birthDate.extension[birthTime].value[x] only dateTime
* deceased[x] ^definition = "Indicates if the individual is deceased or not.\n\nIt is RECOMMENDED to include deceased information when applicable"
* address only CZ_Address
* address ^definition = "An address for the individual. \n\nIt is RECOMMENDED to include an address when available. When needed to express the availablity of a Patient at home (e.g. only Wednesdays), another solution will be defined."


/* from FHIR Patient
* gender 0..1 SU code "male | female | other | unknown" "Administrative Gender - the gender that the patient is considered to have for administration\n       and record keeping purposes."
* gender from http://hl7.org/fhir/ValueSet/administrative-gender|4.3.0 (required)
* gender ^comment = "The gender might not match the biological sex as determined by genetics or the individual's\n       preferred identification. Note that for both humans and particularly animals, there are\n       other legitimate possibilities than male and female, though the vast majority of systems\n       and contexts only support male and female.  Systems providing decision support or enforcing\n       business rules should ideally do this on the basis of Observations dealing with the specific\n       sex or gender aspect of interest (anatomical, chromosomal, social, etc.)  However, because\n       these observations are infrequently recorded, defaulting to the administrative gender\n       is common practice.  Where such defaulting occurs, rule enforcement should allow for the\n       variation between administrative and biological, chromosomal and other gender aspects.\n        For example, an alert about a hysterectomy on a male should be handled as a warning or\n       overridable error, not a \"hard\" error.  See the Patient Gender and Sex section\n       for additional information about communicating patient gender and sex."
* gender ^requirements = "Needed for identification of the individual, in combination with (at least) name and birth\n       date."
* gender ^mustSupport = false
* gender ^isModifier = false
* gender ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* gender ^binding.extension[=].valueString = "AdministrativeGender"
* gender ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* gender ^binding.extension[=].valueBoolean = true
* gender ^binding.description = "The gender of a person used for administrative purposes."
*/



/*
* maritalStatus from $be-civilstate (required)
* maritalStatus ^definition = "This field contains a patient's most recent marital (civil) status.\n\nIt is RECOMMENDED to include this when available. In a Belgian context, the concept ‘civil state’ , Dutch ‘burgerlijke stand’, French ‘état civil’ is more typically used and this might imply a more neutral concept to the reader. In HL7 semantics however this concept is described as ‘marital status’ and it SHALL be understood as the same concept."
* multipleBirth[x] ^definition = "Indicates whether the patient is part of a multiple (boolean) or indicates the actual birth order (integer). Care SHOULD be given when exchanging Patient instances in a purely administrative flow."
* contact ^definition = "A contact party (e.g. guardian, partner, friend) for the patient.\n\nIt is RECOMMENDED to include this when available and considered relevant for the patientcare. (e.g. a parent of a young patient)"
* contact ^comment = "Contact covers all kinds of contact parties: family members, business contacts, guardians, caregivers. Not applicable to register pedigree and family ties beyond use of having contact.\n\nSpecial remarks for KMEHR users:\n\nA contact person for the patient is not part of the 'patient' element itself in KMEHR. As such, the base resource of this is considered sufficient here. The KMEHR standard defines a contact as a separate element using a value from the KMEHR CD-ITEM table and an appropriate value from CD-CONTACT-PERSON to describe the relation to the patient in the KMEHR message. When needed, using FHIR, the contactperson is included in the FHIR resource Patient. Use cases implementing this contact SHALL be aware not all information of CD-CONTACT-PERSON is covered by the base valueset. The codesystem ‘https://www.ehealth.fgov.be/standards/fhir/core/CodeSystem/CD-CONTACT-PERSON’ SHALL be used to refer to any codes previously used in a KMEHR context that cannot be covered by the base HL7 valueset."
* contact.relationship from $be-contactperson (extensible)
* communication ^definition = "A language which may be used to communicate with the patient about his or her health.\n\nIt is RECOMMENDED to include this when available."
* communication ^comment = "If no language is specified, this *implies* that the default local language is spoken.  If you need to convey proficiency for multiple modes, then you need multiple Patient.Communication associations.   For animals, language is not a relevant field, and should be absent from the instance. If the Patient does not speak the default local language, then the Interpreter Required Standard can be used to explicitly declare that an interpreter is required.\n\nSpecial remarks for KMEHR users:\n\nThe 'usuallanguage' element in a KMEHR message only refers to the use of W3C language codes. As such, the language codes as proposed in the FHIR standard should not present any interoperability issue. Note the KMEHR element implies it is the language usally used by the patient. As such, when this element from KMEHR would be mapped to a FHIR resource, the communication.preferred Boolean SHOULD be used."
* generalPractitioner only Reference(BeOrganization or BePractitioner or BePractitionerRole)
* generalPractitioner ^definition = "Patient's nominated care provider.\n\nTake note this does not automatically imply any legal form of therapeutic link or consent relationship with this GP. It is RECOMMENDED to include this when available if the flow is in any way medical. Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this GP can be found. Alternatively, there is only an internal reference and the GP is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
* generalPractitioner ^comment = "This may be the primary care provider (in a GP context), or it may be a patient nominated care manager in a community/disability setting, or even organization that will provide people to perform the care provider roles.  It is not to be used to record Care Teams, these should be in a CareTeam resource that may be linked to the CarePlan or EpisodeOfCare resources.\nMultiple GPs may be recorded against the patient for various reasons, such as a student that has his home GP listed along with the GP at university during the school semesters, or a \"fly-in/fly-out\" worker that has the onsite GP also included with his home GP to remain aware of medical issues.\n\nJurisdictions may decide that they can profile this down to 1 if desired, or 1 per type.\n\nSpecial remarks for KMEHR users:\n\nThe general practioner is in many KMEHR use cases known by being the author or sender of the message. This is however a functionally different concept from the generalPractioner as it is defined in the FHIR resource. (Consult the published definition on the HL7 webpage) It is also possible in KMEHR to add a general practioner via an item and using the correct value from CD-ITEM. That way is functionally closer to the general practioner referenced here. Note in the FHIR base definition of this element that the scope of this element might be wider then just the general practicioner."
* managingOrganization only Reference(BeOrganization)
* managingOrganization ^definition = "Organization that is the custodian of the patient record.\n\nThis SHOULD be included when available.Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this Organization can be found. Alternatively, there is only an internal reference and the Organization is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
* managingOrganization ^comment = "There is only one managing organization for a specific patient record. Other organizations will have their own Patient record, and may use the Link property to join the records together (or a Person resource which can include confidence ratings for the association).\n\nSpecial remarks for KMEHR users:\n\nThe reference to the managing organization is the organization that is the custodian of the patient record. As there is no explicit ‘author of this record’ – like in a KMEHR message – this element functionally refers to the organization in charge. (Which might also be a GP practice of an individual.)"
*/

/*
Extension: CZ_AdministrativeGenderExtension
Id:        cz-AdministrativeGenderExtension
Title: "CZ extension for administrative gender codes"
Description: "This extension defines the official ValueSet to be used when expressing administrative gender according to the Czech standard"
//* insert SEStandardRuleSet
* ^context[0].type = #element
* ^context[0].expression = "Gender"
* value[x] only CodeableConcept
* valueCodeableConcept from CZ_AdministrativeGenderVS (required)
*/
