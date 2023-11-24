//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CZ_Patient
Parent:   Patient
Id:       cz-patient
Title:    "Pacient/Patient (CZ)"
Description: "Tento profil definuje způsob reprezentace pacienta ve FHIR pro účely českých národních standardů interoperability. / This profile defines how to represent Patient in FHIR for the purpose of the Czech national interoperability standards."
// CZ_Patient je odvozen z IPS Patient a je rozšířen o položku státní občanství
//-------------------------------------------------------------------------------------------
* ^description = "Informace o osobě, které jsou poskytovány zdravotní služby / Information about an individual receiving health care services"
* ^publisher = "NCEZ"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* insert SetFmmandStatusRule ( 1, draft )

* language = urn:ietf:bcp:47#cs_CZ
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "Identifikátor pacienta.\r\n\r\nObvykle se používá, pokud je k dispozici, některý z národních identifikátorů (číslo pacienta z národního registru pacientů,  rodné číslo (RC), číslo pojištěnce). Organizace mohou také uvést lokální identifikátor, a to pomocí vlastního identifikačního systému. V případě potřeby lze přidat také typ identifikátoru. \r\n\r\nPatient identifier.\r\n\r\nWhen available, one of the national identifiers (patient number from the national patient register, birth number (RC), insurance number) is usually used. Organisations may also provide a local identifier using their own identification system. If necessary, the type of identifier can also be added."
* identifier contains RC 0..1 MS
* identifier[RC]
  * ^short = "Rodné číslo (Personal Number)"
  * ^definition = "Identifikátor pacienta přidělený podle zákona o evidenci obyvatel. / Patient identifier assigned under the Czech Population Registration Act."
* identifier[RC].system = "https://ncez.mzcr.cz/standards/fhir/sid/rcis" (exactly)  // could be also "urn:oid:2.16.840.1.113883.2.40.1"
* identifier[RC].value 1..1
* identifier contains RID 0..1 MS
* identifier[RID]
  * ^short = "Resortní identifikátor (National Health Identifier)"
  * ^definition = "Jedinečný identifikátor pacienta (resortní identifikátor) podle Národního registru pacientů. / An unique patient identifier (resortní identifikátor) according to the National Patient Register"
* identifier[RID].system = "https://ncez.mzcr.cz/standards/fhir/sid/rid" (exactly)
* identifier[RID].value 1..1
* identifier contains CPOJ 0..1 MS
* identifier[CPOJ]
  * ^short = "Číslo pojištěnce zdravotního pojištění (Health Insurance Number)"
  * ^definition = "Jedinečný identifikátor pacienta (číslo pojištěnce) podle Národního registru zdravotního pojištění. / An unique patient identifier (číslo pojištěnce) according to the National Health Insurance Register"
* identifier[CPOJ].system = "https://ncez.mzcr.cz/standards/fhir/sid/cpoj" (exactly)
* identifier[CPOJ].value 1..1

* name 1..* MS  // patient name element must be provided
* name only HumanNameCz  // HumanNameCz adds extensions for spanish and portugal name parts
* name obeys cz-pat-1
* name ^definition = "Plné jméno osoby. \n\nDoporučuje se uvádět alespoň jedno příjmení a alespoň jedno křestní jméno, pokud je to možné, a definovat 'oficiální' použití. Pokud je jméno uvedeno, příjemce je NESMÍ ignorovat. / A name associated with the individual. \n\nIt is RECOMMENDED to give at least one family name and at least one given name when possible and define an 'official' use. When names are given, a consumer SHALL NOT ignore it."
* name ^requirements = "Pacient může být znám pod více různými jmény. Příkladem je oficiální jméno a přezdívka nebo pseudonym.\r\nVe všech případech se vždy používá alfabetické vyjádření jména.\r\nA patient may be known by several different names. An example is an official name and a nickname or pseudonym.\r\nIn all cases, the alphabetical representation of the name is always used."
* name.extension contains $ext-data-absent-reason named name-absent-reason 0..*
* name.extension[name-absent-reason]
  * ^short = "Důvod pro neuvedení jména / Reason for not providing the name"
  * ^definition = "Důvod pro neuvedení jména / Reason for not providing the name"
* name.text MS
* name.text ^definition = "Textové vyjádření plného jména. Vzhledem ke kulturním odlišnostem ve způsobu zápisu jmen v různých zemích nemusí přijímající systém vědět, jak jméno správně prezentovat; navíc ne všechny části jména lze označit  jako křestní jméno či příjmení. Tvůrcům se proto důrazně doporučuje, aby prostřednictvím tohoto prvku poskytli prezentovanou verzi plného jména. Budoucí verze této příručky mohou tento prvek vyžadovat. / Text representation of the full name. Due to the cultural variance around the world a consuming system may not know how to present the name correctly; moreover not all the parts of the name go in given or family. Creators are therefore strongly encouraged to provide through this element a presented version of the name. Future versions of this guide may require this element"
* name.text ^min = 0
* name.family 0..1 MS
* name.given MS
* name.given ^min = 0

* telecom MS
* telecom
  * ^short = "Elektronický kontakt osoby / A contact detail for the individual"
  * ^definition = "Elektronický kontakt (např. telefonní číslo nebo e-mailová adresa), pomocí kterého lze osobu kontaktovat.\n\nDOPORUČUJE SE přidat alespoň jeden telefon nebo e-mailovou adresu s jasným označením pomocí prvku .use, zda se jedná o domácí použití, pracovní použití atd.\r\nA contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.\n\nIt is RECOMMENDED to at least add one phone or email address with clear indication using the .use element whether it is home use, work use, etc."

* gender MS  // gender must be supported
  * ^definition = "Pohlaví pro úřední účely"
* gender from $CZ_AdministrativegenderVS (required)

* birthDate MS
* birthDate ^definition = "Datum narození.\n\nDOPORUČUJE SE uvádět datum narození, pokud je k dispozici.\n\nThe date of birth for the individual.\n\nIt is RECOMMENDED to give the birthdate when available."
* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension contains $patient-birthTime named birthTime 0..1
* birthDate.extension[birthTime].value[x] only dateTime

* deceased[x] MS
  * ^short = "Informace o úmrtí buď příznakem či datem úmrtí"
//* deceased[x] ^definition = "Indicates if the individual is deceased or not.\n\nIt is RECOMMENDED to include deceased information when applicable"
* deceasedBoolean ^short = "Indikace úmrtí - příznak"
//* deceasedBoolean ^definition = ""
* deceasedDateTime ^short = "Datum úmrtí pacienta"

* address MS
* address only CZ_Address
* address ^definition = "Adresa fyzické osoby. / An address for the individual. \n\nDOPORUČUJE SE uvést adresu, pokud je k dispozici. / It is RECOMMENDED to include an address when available."
* address obeys cnt-2-char

* generalPractitioner MS  // general practicioner must be supported
  * ^definition = "Praktický lékař či jiný poskytovatel určený pacientem. / Patient's nominated care provider.\n\nUpzorňujeme, že se jedná pouze o informační údaj, který nemusí znamenat jakýkoliv právně závazný terapeutický vztah mezi pacientem a lékařem či poskytovatelem či souhlas pacienta s poskytováním informací. Doporučujeme tento údaj uvést, pokud je k dispozici a pokud se jedná o informaci související s lékařskou péčí. Upozorňujeme, že se jedná o prvek datového typu Reference. To znamená, že pokud je k dispozici, bude obsahovat buď relativní, nebo absolutní adresu URL, kde lze tohoto praktického lékaře nalézt. Případně je k dispozici pouze interní odkaz a GP je zahrnut jako \"obsažený zdroj\" (viz specifikace HL7 FHIR)./ Take note this does not automatically imply any legal form of therapeutic link or consent relationship with this GP. It is RECOMMENDED to include this when available if the flow is in any way medical. Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this GP can be found. Alternatively, there is only an internal reference and the GP is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
  * ^comment = "This may be the registering primary care provider (in a GP context), or it may be a patient nominated care manager in a community/disability setting, or even organization that will provide people to perform the care provider roles. It is not to be used to record Care Teams, these should be in a CareTeam resource that may be linked to the CarePlan or EpisodeOfCare resources.\nMultiple GPs may be recorded against the patient for various reasons, such as a student that has his home GP listed along with the GP at university during the school semesters, or a \"fly-in/fly-out\" worker that has the onsite GP also included with his home GP to remain aware of medical issues.\n\nJurisdictions may decide that they can profile this down to 1 if desired, or 1 per type. Note in the FHIR base definition of this element that the scope of this element might be wider then just the general practicioner."  // ToDo: Doplnit český komentář k tomuto prvku
* generalPractitioner only Reference(CZ_Organization or CZ_Practitioner or CZ_PractitionerRole)

* managingOrganization only Reference(CZ_Organization)
* managingOrganization ^definition = "Organization that is the custodian of the patient record.\n\nThis SHOULD be included when available.Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this Organization can be found. Alternatively, there is only an internal reference and the Organization is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
* managingOrganization ^comment = "There is only one managing organization for a specific patient record. Other organizations will have their own Patient record, and may use the Link property to join the records together (or a Person resource which can include confidence ratings for the association)."

* extension contains http://hl7.org/fhir/StructureDefinition/patient-nationality named nationality 0..*
* extension[nationality]
  * ^short = "Státní občanství / Nationality"
  * ^definition = "Státní občanství dle zákona 186/2013. Státní občanství, jak je uváděno na oficiálních dokladech k prokázání identity."
* extension[nationality].extension[code].value[x] only CZ_CodeableConcept
* extension[nationality].extension[period].value[x] only Period
* extension[nationality].extension[code].valueCodeableConcept 1..1 MS
* extension[nationality].extension[code].valueCodeableConcept from $iso3166-1-2

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