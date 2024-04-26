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
//* ^status = #active
* ^experimental = false
* insert SetFmmandStatusRule ( 1, draft )

* extension contains
  $sex-for-clinical-use named sex-for-clinical-use 0..* and
  $patient-birthPlace named birthPlace 0..1 and
  $nationality named nationality 0..* and
  $registering-provider named registeringProvider 0.. //V každém okamžiku může mít pacient nejvýše jednoho registrujícího praktického lékaře a nejvýše jednoho registrujícího zubaře. Pacientky mohou mít také nejvýše jednoho registrujícího gynekologa.

* extension[sex-for-clinical-use] ^mustSupport = false

* extension[birthPlace]
  * ^short = "Místo narození / Birth place"
//  * ^definition = ""
* extension[birthPlace].value[x] only CZ_Address

* extension[nationality]
  * ^short = "Státní občanství / Nationality"
  * ^definition = "Státní občanství dle zákona 186/2013. Státní občanství, jak je uváděno na oficiálních dokladech k prokázání identity."
* extension[nationality].extension[code].value[x] only CZ_CodeableConcept
* extension[nationality].extension[period].value[x] only Period
* extension[nationality].extension[code].valueCodeableConcept 1..1 MS
* extension[nationality].extension[code].valueCodeableConcept from $iso3166-1-2

* extension[registeringProvider]
  * ^short = "Registrující poskytovatel primární ambulantní péče / Registering primary outpatient healthcare provider"
  * ^definition = "Registrujícím poskytovatelem se rozumí poskytovatel ambulantní péče v oboru všeobecné praktické lékařství, v oboru praktické lékařství pro děti a dorost, v oboru zubní lékařství nebo v oboru gynekologie a porodnictví, který přijal pacienta do péče za účelem poskytnutí primární ambulantní péče."
  * ^comment = """V každém okamžiku může mít pacient nejvýše jednoho registrujícího poskytovatele v oboru všeobecné praktické lékařství nebo v oboru praktické lékařství pro děti a dorost a jednoho registrujícího poskytovatele v oboru zubního lékařství. Pacientky mohou mít také nejvýše jednoho registrujícího poskytovatele v oboru gynekologie a porodnictví.\n\nAt any one time, a patient may have no more than one general practitioner or paediatric and adolescent practitioner and one dental registrar. Female patients may also have no more than one registered provider in gynaecology and obstetrics."""
* obeys(cz-pat-2)

* language = urn:ietf:bcp:47#cs

* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "Identifikátor pacienta.\r\n\r\nObvykle se používá, pokud je k dispozici, některý z národních identifikátorů (číslo pacienta z národního registru pacientů,  rodné číslo (RC), číslo pojištěnce). Organizace mohou také uvést lokální identifikátor, a to pomocí vlastního identifikačního systému. V případě potřeby lze přidat také typ identifikátoru. \r\n\r\nPatient identifier.\r\n\r\nWhen available, one of the national identifiers (patient number from the national patient register, birth number (RC), insurance number) is usually used. Organisations may also provide a local identifier using their own identification system. If necessary, the type of identifier can also be added."
* identifier contains RC 0..1 MS
* identifier[RC]
  * ^short = "Rodné číslo (Personal Number)"
  * ^definition = "Identifikátor pacienta přidělený podle zákona o evidenci obyvatel. / Patient identifier assigned under the Czech Population Registration Act."
* identifier[RC] only CZ_Rodcis_Identifier
//* identifier[RC].system = "https://ncez.mzcr.cz/fhir/sid/rcis" (exactly)  // could be also "urn:oid:2.16.840.1.113883.2.40.1"
//* identifier[RC].value 1..1
* identifier contains RID 0..1 MS
* identifier[RID]
  * ^short = "Resortní identifikátor (National Health Identifier)"
  * ^definition = "Jedinečný identifikátor pacienta (resortní identifikátor) podle Národního registru pacientů. / An unique patient identifier (resortní identifikátor) according to the National Patient Register"
* identifier[RID].system = "https://ncez.mzcr.cz/fhir/sid/rid" (exactly)
* identifier[RID].value 1..1
* identifier contains CPOJ 0..1 MS
* identifier[CPOJ]
  * ^short = "Číslo pojištěnce zdravotního pojištění (Health Insurance Number)"
  * ^definition = "Jedinečný identifikátor pacienta (číslo pojištěnce) podle Národního registru zdravotního pojištění. / An unique patient identifier (číslo pojištěnce) according to the National Health Insurance Register"
* identifier[CPOJ].system = "https://ncez.mzcr.cz/fhir/sid/cpoj" (exactly)
* identifier[CPOJ].value 1..1
* identifier contains OP 0..1 MS
* identifier[OP]
  * ^short = "Číslo občanského průkazu (National Identity Card Number)"
  * ^definition = "Jedinečný identifikátor pacienta (číslo občanského průkazu) vydaného ministerstvem vnitra. / An unique patient identifier (National ID Card Number) issued by the ministry of interior"
* identifier[OP].system = "https://ncez.mzcr.cz/fhir/sid/op" (exactly)
* identifier[OP].value 1..1
* identifier contains PAS 0..* MS
* identifier[PAS]
  * ^short = "Číslo pasu (Passport Number)"
  * ^definition = "Jedinečný identifikátor pacienta (číslo pasu). / An unique patient identifier (Passport Number)"
//* identifier[PAS].system = "http://hl7.org/fhir/sid/passport-CZE"
* identifier[PAS].system from PassportNSVS
  * ^short = "Jmenný prostor dle vydavatele pasu. FHIR eviduje jmenné prostory pro pasy ve formátu http://hl7.org/fhir/sid/passport-XXX, kde XXX je třípísmenný kód země dle ISO 3166"
* identifier[PAS].use = #official
* identifier[PAS].type = $v2-0203#PPN
* identifier[PAS].value 1..1

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
  * ^definition = "Informace o úmrtí buď příznakem či datem úmrtí. \n\nDOPORUČUJE SE uvést informace o úmrtí ve všech relevantních případech."
/*
* deceasedBoolean
  * ^short = "Indikace úmrtí - příznak"
  * ^definition = "Logický příznak úmrtí pacienta"
* deceasedDateTime
  * ^short = "Datum úmrtí pacienta"
  * ^definition = "Datum a případně také čas úmrtí pacienta"
*/
* address MS
* address only CZ_Address
  * ^definition = "Adresa fyzické osoby. / An address for the individual. \n\nDOPORUČUJE SE uvést adresu, pokud je k dispozici. / It is RECOMMENDED to include an address when available."
  * obeys cnt-2-char

* generalPractitioner MS  // general practicioner must be supported
  * ^short = "Lékař či poskytovatel určený pacientem"
  * ^definition = "Praktický lékař či jiný poskytovatel určený pacientem. / Patient's nominated care provider.\n\nUpzorňujeme, že se jedná pouze o informační údaj, který nemusí znamenat jakýkoliv právně závazný terapeutický vztah mezi pacientem a lékařem či poskytovatelem či souhlas pacienta s poskytováním informací. Doporučujeme tento údaj uvést, pokud je k dispozici a pokud se jedná o informaci související s lékařskou péčí. Upozorňujeme, že se jedná o prvek datového typu Reference. To znamená, že pokud je k dispozici, bude obsahovat buď relativní, nebo absolutní adresu URL, kde lze tohoto praktického lékaře nalézt. Případně je k dispozici pouze interní odkaz a GP je zahrnut jako \"obsažený zdroj\" (viz specifikace HL7 FHIR)./ Take note this does not automatically imply any legal form of therapeutic link or consent relationship with this GP. It is RECOMMENDED to include this when available if the flow is in any way medical. Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this GP can be found. Alternatively, there is only an internal reference and the GP is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
  * ^comment = """Může to být poskytovatel primární či specializované ambulantní péče, nebo to může být pacientem určený pečovatel v komunitním prostředí či prostředí pro osoby se zdravotním postižením, nebo organizace, která poskytne osoby, kteří budou plnit roli poskytovatele péče. Pokud jde o registrujícího poskytovatele, bude odkaz zároveň uveden v extenzi \"registeringProvider\". Tento element se nemá používat k evidenci týmů péče, ty by měly být ve zdroji CareTeam, který může být propojen se zdroji CarePlan nebo EpisodeOfCare. \nU pacienta může být z různých důvodů zaznamenáno více poskytovatelů, například student, který má svého domácího praktického lékaře uvedeného spolu s praktickým lékařem na univerzitě, nebo pracovník, který má vedle svého domácího praktického lékaře uvedeného také praktického lékaře na pracovišti, aby byl informován o zdravotních problémech.\n\nThis may be a primary or specialist outpatient care provider, or it may be a patient-designated carer in a community or disability setting, or an organisation that provides people to act as care providers. If it is a registering provider, the reference will also be included in the \"registeringProvider\" extension. This element should not be used to register care teams, these should be in the CareTeam resource, which can be linked to the CarePlan or EpisodeOfCare resources. \n Multiple providers may be recorded for a patient for different reasons, for example a student who has their GP listed alongside their GP at the university, or a worker who has a GP listed alongside their GP at the workplace to keep them informed of health issues."""
* generalPractitioner only Reference(CZ_Organization or CZ_Practitioner or CZ_PractitionerRole)

* managingOrganization only Reference(CZ_Organization)
  * ^short = "Organizace, která je správcem elektronického záznamu / Organization that is the custodian of the patient record"
  * ^definition = "Organizace, která je správcem záznamu o pacientovi.\n\nTento údaj by měl být uveden, pokud je k dispozici. Upozorňujeme, že se jedná o prvek datového typu Reference. To znamená, že pokud je k dispozici, bude obsahovat buď relativní, nebo absolutní adresu URL, kde lze tuto organizaci nalézt. Případně je zde pouze interní odkaz a Organizace je zahrnuta jako 'contined resource' (viz specifikace HL7 FHIR, v jakých případech se uplatňuje).\n\nOrganization that is the custodian of the patient record.\n\nThis SHOULD be included when available. Please note this is an element of the Reference datatype. This means when it is available it will contain either a relative or absolute URL where this Organization can be found. Alternatively, there is only an internal reference and the Organization is included as a ‘contained resource’ (cfr. the HL7 FHIR specifications in what cases this applies)."
  * ^comment = "Pro konkrétní záznam pacienta existuje pouze jedna organizace, která jej spravuje. Ostatní organizace budou mít svůj vlastní záznam pacienta a mohou použít element Link ke spárování záznamů (nebo resource Person, který může obsahovat hodnocení důvěryhodnosti pro toto spojení).\n\nThere is only one managing organization for a specific patient record. Other organizations will have their own Patient record, and may use the Link property to join the records together (or a Person resource which can include confidence ratings for the association)."

* contact ^definition = "Kontaktní osoba (např. opatrovník, partner, přítel) pacienta.\n\nDOPORUČUJE SE uvést ji, pokud je k dispozici a pokud je považována za relevantní pro péči o pacienta. (např. rodič dítěte).\n\nA contact party (e.g. guardian, partner, friend) for the patient.\n\nIt is RECOMMENDED to include this when available and considered relevant for the patientcare. (e.g. a parent of a young patient)"
* contact ^comment = "Kontakt zahrnuje všechny druhy kontaktních osob: rodinné příslušníky, obchodní kontakty, opatrovníky, pečovatele. Nevztahuje se na evidenci rodokmenu a rodinných vazeb mimo rámec použití týkající se kontaktů.\n\nContact covers all kinds of contact parties: family members, business contacts, guardians, caregivers. Not applicable to register pedigree and family ties beyond use of having contact."
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

// zvážit zda přidat:
// - národnost (česká, moravská ...)
// - zaměstnání
// - vzdělání