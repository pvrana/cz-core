//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_Address
Parent:     Address
Id:         cz-address
Title:      "Address (CZ)"
Description: """Národní profil specifikující české konvence pro vyjádření adresy.
Profil zahhrnuje standardní rozšíření/extenzi umožňující explicitní vyjádření jména ulice, čísla domu a P.O.Box a jeho požití je DOPORUČENO všem implementátorům.
Toto rozšíření je rovněž použito v evropské standardní specifikaci adresy.
Národní specifikace dále obsahuje možnost zadání adresního místa dle registru RUIAN.
/ Czech national profile on address, to provide the possibility in the 'line' element to provide a seperate streetname, housenumber and postal box.
It is always RECOMMENDED to give these elements seperately."""
//-------------------------------------------------------------------------------------------
* ^publisher = "NCEZ"
* ^version = "1.0.0"
* ^experimental = false

* . ^comment = "Note: address is intended to describe postal addresses for administrative purposes, not to describe absolute geographical coordinates.  Postal addresses are often used as proxies for physical locations (also see the [Location](location.html#) resource)."
* ^purpose = "This profile constrains the representation of address in the context of the Czech national interoperability project."
* . ^short = "Adresa dle českých poštovních konvencí"
* . ^definition = "Adresa podle poštovních zvyklostí (na rozdíl například od GPS souřadnic). Adresa může být použita jak pro doručování poštovních zásilek, tak pro lokalizaci míst, která nemají platnou poštovní adresu.\r\n\r\nRozšíření použitá v tomto profilu mapují strukturu adresy, jak je použita ve formátu VSDM elektronické karty pojištění.\r\n\r\nJiné struktury jsou možné, zejména pro zahraniční adresy nebo adresy, které nebyly zaznamenány skenováním elektronické karty pojištění. Použití přípon není povinné."
* insert SetFmmandStatusRule ( 1, draft )

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains AddressPointCz named addressPoint 0..1
* extension contains AddresaTrvalehoPobytuCz named trvalyPobyt 0..1

* use ^definition = """Způsob použití adresy /  Address use"""
* line ^definition = """Tato složka umožňuje zadat číslo domu, číslo bytu, název ulice, směr ulice, číslo P.O. Boxu, pokyny pro doručování a podobné informace o adrese. Tyto prvky se vždy DOPORUČUJE uvádět samostatně pomocí definovaných extenzí. / This component contains the house number, apartment number, street name, street direction, P.O. Box number, delivery hints, and similar address information. It is always RECOMMENDED to give these elements seperately using the defined extensions."""
* line.extension ^slicing.discriminator.type = #value
* line.extension ^slicing.discriminator.path = "url"
* line.extension ^slicing.rules = #open
* line.extension ^definition = "DOPORUČUJE se používat tato rozšíření pro definování adresních prvků. / It is RECOMMENDED to use these extensions to define address elements."
* line.extension contains
    $iso21090-ADXP-streetName named streetName 0..* and
    $iso21090-ADXP-houseNumber named houseNumber 0..* and
    $iso21090-ADXP-postBox named postBox 0..*
* line.extension[streetName].value[x] only string
* line.extension[houseNumber].value[x] only string
* line.extension[postBox].value[x] only string
//* country ^definition = "Country, the FHIR specification defines its country field as a string and suggests using a ISO 3166 2 or 3 letter codes. Use of 2-letter code to express country is RECOMMENDED"
* country from $iso3166-1-2 (preferred)
* country ^short = "Země"
* country ^definition = """Země (dvoumístný kód země dle ISO nebo volným textem)./r/nPovinné použití kódu země může být stanoveno v jednotlivých odvozených profilech. / Country (two-digit ISO country code or free text)./r/nMandatory use of the country code may be specified in specific derived profiles."""
* obeys text-or-ctry and POB-and-PCS and street-and-city and POB-only-postal and POB-ext-only

Invariant: text-or-ctry
Description: "Adresa musí obsahovat minimálně element text nebo země / Address must contain at least text or country element"
Expression: "( line.all($this.empty()) and city.empty() ) implies (text.exists() or country.exists())"
Severity:    #error

Invariant: POB-and-PCS
Description: "Pokud je uvedena extenze P.O.Box, pak musí být evedeno také PSČ / If P.O.Box extension is present, Postal code must be present too"
Expression: "line.all($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox').empty()) or (postalCode.exists())"
Severity:    #error

Invariant: street-and-city
Description: "Pokud je uvedena extenze streetName, pak musí být evedeno také PSČ nebo město / If streetName extension is present, Postal code or city must be present too"
Expression: "line.all($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName').empty()) or postalCode.exists() or city.exists()"
Severity:    #error

Invariant: POB-only-postal
Description: "Adresa obsahující extenzi P.O.Box nemůže mít typ \"physical\" or \"both\" / Address with P.O.Box cannot be \"physical\" or \"both\""
Severity: #warning
Expression: "line.all($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox').empty()) or type='postal' or type.empty()"

Invariant: POB-ext-only
Description: "Pokud je uvedena extenze P.O.Box, nesmí být uvedena extenze 'Street' a 'House number' / If the extension 'P.O.Box' is used, the extensions 'Street' and 'House number' must not be used."
Severity: #warning
Expression: "line.all($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox').empty() or ($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName').empty() and $this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber').empty()))"