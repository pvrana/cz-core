//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_Address
Parent:     Address
Id:         cz-address
Title:      "Address (CZ)"
Description: "Czech national profile on address, to provide the possibility in the 'line' element to provide a seperate streetname, housenumber and postal box. It is always RECOMMENDED to give these elements seperately."
//-------------------------------------------------------------------------------------------
* ^publisher = "NCEZ"
* ^version = "1.0.0"
* ^experimental = false
* insert SetFmmandStatusRule ( 1, draft )
* . ^comment = "Note: address is intended to describe postal addresses for administrative purposes, not to describe absolute geographical coordinates.  Postal addresses are often used as proxies for physical locations (also see the [Location](location.html#) resource)."
* ^purpose = "This profile constrains the representation of address in the context of the Czech national interoperability project."

* line ^definition = "This component contains the house number, apartment number, street name, street direction, P.O. Box number, delivery hints, and similar address information. It is always RECOMMENDED to give these elements seperately using the defined extensions."
* line.extension ^slicing.discriminator.type = #value
* line.extension ^slicing.discriminator.path = "url"
* line.extension ^slicing.rules = #open
* line.extension ^definition = "RECOMMENDED to use these extensions to define address elements."
* line.extension contains
    $iso21090-ADXP-streetName named Streetname 0..* and
    $iso21090-ADXP-houseNumber named Housenumber 0..* and
    $iso21090-ADXP-postBox named Postbox 0..*
* line.extension[Streetname].value[x] only string
* line.extension[Housenumber].value[x] only string
* line.extension[Postbox].value[x] only string
* country ^definition = "Country, the FHIR specification defines its country field as a string and suggests using a ISO 3166 2 or 3 letter codes. Use of 2-letter code to express country is RECOMMENDED"

* obeys text-or-ctry
* obeys POB-and-PCS
* obeys street-and-city


Invariant: text-or-ctry
Description: "Address must contain at least text or country element / Adresa musí obsahovat minimálně element text a země"
Expression: "( (line.empty() and city.empty() ) implies (text.exist() or country.exist()) "
Severity:    #error

Invariant: POB-and-PCS
Description: "If P.O.Box is present, Postal code must be present too/ Pokud je uveden P.O.Box, pak musí být evedeno také PSČ"
Expression: "line.extension.postbox.exist() implies (postalCode.exist()) "
Severity:    #error

Invariant: street-and-city
Description: "If street is present, Postal code must be present too/ Pokud je uveden P.O.Box, pak musí být evedeno také PSČ"
Expression: "line.extension.Streetname.exist() implies (postalCode.exist() or city.exist()) "
Severity:    #error
