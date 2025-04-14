//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: CZ_PractitionerCore
Parent: CZ_PractitionerBase
Id: cz-practitioner-core
Title: "Practitioner (CZ core)"
Description: "Czech national profile for practitioner."
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
//* ^status = #active
* ^experimental = false
* insert SetFmmandStatusRule ( 1, draft )
* insert ImposeProfile($Practitioner-eu-core, 0)
/*
* identifier MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^definition = "An identifier that applies to this person in this role.\r\nTypically, a KRZP value is given and/or CLK identifier provided by the Czech Medical Chamber or identifier of Pharmacist (PharmID) provided by the Czech Chamber of Pharmacists, however use of KRZP Id is preferred. Other systems remain allowed. Flows in organizations will most likely want to also include a local identifier, using its own system. A type can be added if needed. When it is given, a consumer SHALL NOT ignore it."
* identifier contains
    KRZP 0..* and
    CLK 0..* and
    CLeK 0..*
* identifier[KRZP].system = "https://ncez.mzcr.cz/fhir/sid/krzp" (exactly)
* identifier[KRZP].value 1..
* identifier[CLK].system = "https://ncez.mzcr.cz/fhir/sid/clk" (exactly)
* identifier[CLK].value 1..
* identifier[CLeK].system = "https://ncez.mzcr.cz/fhir/sid/clek" (exactly)
* identifier[CLeK].value 1..
* active ^definition = "Whether this practitioner's record is in active use. \r\n\r\nIt is RECOMMENDED to keep the value ‘true’ as long as the practitioner is still being treated by the provider of the data."
*/
* name 1..* //MS
//* name.family //MS
//* name.given //MS
* name ^definition = "The name(s) associated with the practitioner.\r\n\r\nTypically RECOMMENDED to include one familyname and at least one given name and to define this use as ‘official’."

//* telecom //MS
* telecom ^definition = "A contact detail for the practitioner, e.g. a telephone number or an email address.\r\n\r\nIt is RECOMMENDED to at least add one phone or email address."

//* address MS
//* address only cz-address
