//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_Organization
Parent:     Organization
Id:         cz-organization
Title:      "Organization (CZ)"
Description: "Český národní profil pro resource Organization. / Czech national profile for an organization."
//-------------------------------------------------------------------------------------------
* ^publisher = "NCEZ"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* insert SetFmmandStatusRule ( 1, draft )
* ^purpose = "Tento profil vymezuje způsob reprezentace organizace v kontextu českého národního projektu interoperability. / This profile constrains the representation of organization in the context of the Czech national interoperability project."

* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "Identifikátor organizace, který se používá k identifikaci organizace v různých informačních systémech. \r\nTypicky se uvádí hodnota NRPZS a/nebo hodnota IČO nebo IČZ/IČP. Jsou povoleny i jiné identifikační systémy. Upřednostňuje se použití identifikátoru NRPZS.\r\nProcesy v rámci organizacímohou vyžadovat také použití lokálních identifikátorů v rámci vlastních identifikačních systémů.\r\nV případě potřeby lze přidat také atribut typ. Pokud je typ identifikátoru uveden, konzument jej NESMÍ ignorovat. / Identifier for the organization that is used to identify the organization across multiple disparate systems. \r\nTypically, an NRPZS value and/or IČO or IČZ/IČP value are given. Other systems are allowed, however use of NRPZS Id is preferred. Flows in organizations will most likely want to also include a local identifier, using its own identification system. A type can be added if needed. When it is given, a consumer SHALL NOT ignore it."
* identifier contains
    NRPZS 0..1 and
    ICO 0..1 and
    ICZ 0..1 and
    ICP 0..1
* identifier[NRPZS].system = "https://ncez.mzcr.cz/standards/fhir/sid/nrpzs" (exactly)
* identifier[NRPZS].value 1..
* identifier[ICO].system = "https://ncez.mzcr.cz/standards/fhir/sid/ico" (exactly)
* identifier[ICO].value 1..
* identifier[ICZ].system = "https://ncez.mzcr.cz/standards/fhir/sid/icz" (exactly)
* identifier[ICZ].value 1..
* identifier[ICP].system = "https://ncez.mzcr.cz/standards/fhir/sid/icp" (exactly)
* identifier[ICP].value 1..

* active ^definition = "Informace o tom, zda je záznam organizace stále aktivně používán. / Whether the organization's record is still in active use."

* name MS

* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "coding.system"
* type ^slicing.rules = #open
* type ^definition = "Druh(y) organizace.\r\n\r\n. Druh by měl být přebírán z číselníku DRZAR. / The kind(s) of organization that this is.\r\n\r\n. Type should be taken from DRZAR value set."
* type only CZ_CodeableConcept
* type contains DRZAR 0..*
* type[DRZAR].coding.system = $drzar (exactly)
* type[DRZAR].coding.code 1..
* type[DRZAR] from CZ_DrzarVS (required)

* telecom ^definition = "Kontaktní údaje organizace.\r\n\r\nDOPORUČUJE SE uvést alespoň jeden telefon nebo e-mailovou adresu. / A contact detail for the organization.\r\n\r\nIt is RECOMMENDED to at least add one phone or email address."

* address only CZ_Address
* address ^definition = "Adresa organizace.\r\n\r\nDOPORUČUJE SE ji uvést, pokud je k dispozici. / An address for the organization.\r\n\r\nIt is RECOMMENDED to include this when available"