//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CZ_Patient
Parent:   Patient
Id:       cz-patient
Title:    "Patient (CZ)"
Description: "This profile defines how to represent Patient in FHIR for the purpose of the Czech national interoperability standards."
// CZ_Patient je odvozen z IPS Patient a je rozšířen o položku stásní občanství
//-------------------------------------------------------------------------------------------
* ^description = "Information about an individual receiving health care services"
* ^publisher = "NCEZ"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false

* language = urn:ietf:bcp:47#cs_CZ
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "An identifier for this patient.\r\n\r\nTypically, when National birth Id (RC) is available it is used. Organizations will most likely want to also include a local identifier, using its own system. A type can be added if needed."
* identifier contains RC 0..1 MS
* identifier[RC] ^definition = "An identifier for this patient according to National Birth Registry\r\n\r\nWhen needed to express a RC, it SHALL be done according to these guidelines. Other ways to identify a patient using coding systems remain also possible."
* identifier[RC].system = "https://ncez.mzcr.cz/standards/fhir/sid/rcis" (exactly)  // could be also "urn:oid:2.16.840.1.113883.2.40.1"
* identifier[RC].value 1..1
* identifier contains RID 0..1 MS
* identifier[RID] ^definition = "An unique patient identifier (resortní identifikátor) according to the National Patient Register"
* identifier[RID].system = "https://ncez.mzcr.cz/standards/fhir/sid/rid" (exactly)
* identifier[RID].value 1..1

* name 1..* MS
* name obeys cz-pat-1
* name ^definition = "A name associated with the individual. \n\nIt is RECOMMENDED to give at least one familyname and at least one given name when possible and define an 'official' use. When names are given, a consumer SHALL NOT ignore it."
* name ^requirements = "Need to be able to track the patient by multiple names. Examples are your official name and a alias or nickname.\r\nThe Alphabetic representation of the name SHALL be always provided"
* name.text MS
* name.text ^definition = "Text representation of the full name. Due to the cultural variance around the world a consuming system may not know how to present the name correctly; moreover not all the parts of the name go in given or family. Creators are therefore strongly encouraged to provide through this element a presented version of the name. Future versions of this guide may require this element"
* name.text ^min = 0
* name.family 0..1 MS
* name.given MS
* name.given ^min = 0

* telecom MS
* telecom ^definition = "A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.\n\nIt is RECOMMENDED to at least add one phone or email address with clear indication using the .use element whether it is home use, private use,..."

* gender MS  // gender must be supported
* gender from $CZ_AdministrativegenderVS (required)

* birthDate MS
* birthDate ^definition = "The date of birth for the individual.\n\nIt is RECOMMENDED to give the birthdate when available."
* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension contains $patient-birthTime named birthTime 0..1
* birthDate.extension[birthTime].value[x] only dateTime

* deceased[x] MS
//* deceased[x] ^definition = "Indicates if the individual is deceased or not.\n\nIt is RECOMMENDED to include deceased information when applicable"

* address MS
* address only CZ_Address
* address ^definition = "An address for the individual. \n\nIt is RECOMMENDED to include an address when available. When needed to express the availablity of a Patient at home (e.g. only Wednesdays), another solution will be defined."

* generalPractitioner MS  // general practicioner must be supported
* generalPractitioner only Reference(CZ_Organization or CZ_Practitioner or CZ_PractitionerRole)
* generalPractitioner ^definition = "Patient's nominated care provider.\n\nTake note this does not automatically imply any legal form of therapeutic link or consent relationship with this GP. It is RECOMMENDED to include this when available if the flow is in any way medical. Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this GP can be found. Alternatively, there is only an internal reference and the GP is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
* generalPractitioner ^comment = "This may be the registering primary care provider (in a GP context), or it may be a patient nominated care manager in a community/disability setting, or even organization that will provide people to perform the care provider roles. It is not to be used to record Care Teams, these should be in a CareTeam resource that may be linked to the CarePlan or EpisodeOfCare resources.\nMultiple GPs may be recorded against the patient for various reasons, such as a student that has his home GP listed along with the GP at university during the school semesters, or a \"fly-in/fly-out\" worker that has the onsite GP also included with his home GP to remain aware of medical issues.\n\nJurisdictions may decide that they can profile this down to 1 if desired, or 1 per type. Note in the FHIR base definition of this element that the scope of this element might be wider then just the general practicioner."

* managingOrganization only Reference(CZ_Organization)
* managingOrganization ^definition = "Organization that is the custodian of the patient record.\n\nThis SHOULD be included when available.Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this Organization can be found. Alternatively, there is only an internal reference and the Organization is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
* managingOrganization ^comment = "There is only one managing organization for a specific patient record. Other organizations will have their own Patient record, and may use the Link property to join the records together (or a Person resource which can include confidence ratings for the association)."

* extension contains http://hl7.org/fhir/StructureDefinition/patient-nationality named nationality 0..*
* extension[nationality] ^short = "Nationality/Státní občanství"
* extension[nationality] ^definition = "Státní občanství dle zákona 186/2013. Státní občanství, jak je uváděno na oficiálních dokladech k prokázání identity."
* extension[nationality].extension[code].value[x] only CZ_CodeableConcept
* extension[nationality].extension[period].value[x] only Period
* extension[nationality].extension[code].valueCodeableConcept 1..1 MS
* extension[nationality].extension[code].valueCodeableConcept from https://www.hl7.org/fhir/valueset-country.html

* contact ^definition = "A contact party (e.g. guardian, partner, friend) for the patient.\n\nIt is RECOMMENDED to include this when available and considered relevant for the patientcare. (e.g. a parent of a young patient)"
* contact ^comment = "Contact covers all kinds of contact parties: family members, business contacts, guardians, caregivers. Not applicable to register pedigree and family ties beyond use of having contact."
* contact.relationship only CZ_CodeableConcept
* contact.relationship from CZ_ContactPersonRelationVS
/* * contact.relationship ^slicing.discriminator.type = #value
* contact.relationship ^slicing.discriminator.path = "system"
* contact.relationship ^slicing.rules = #open
* contact.relationship contains CONTACT_TYPE 0..1 MS
* contact.relationship[CONTACT_TYPE] from $v2-0131 (extensible)
* contact.relationship contains C_REL 0..1 MS
* contact.relationship[C_REL] from CZ_ContactPersonRelationVS (extensible)
 */
* contact.address only CZ_Address
* contact.organization only Reference(CZ_Organization)
* contact.gender from $CZ_AdministrativegenderVS

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
*/