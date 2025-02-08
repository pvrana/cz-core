//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_Address
Parent:     AddressEu
Id:         cz-address
Title:      "Address (CZ)"
Description: "Czech national profile on address, to provide the possibility in the 'line' element to provide a seperate streetname, housenumber and postal box.
It is always RECOMMENDED to give these elements separately. The national specification also includes the option of entering the address location according to the RUIAN register and marking the address as the permanent residence address."
//-------------------------------------------------------------------------------------------
//* ^publisher = "HL7 CZ"
//* ^version = "1.0.0"
* ^experimental = false

* . ^comment = "Note: address is intended to describe postal addresses for administrative purposes, not to describe absolute geographical coordinates.  Postal addresses are often used as proxies for physical locations (also see the [Location](location.html#) resource)."
* ^purpose = "This profile constrains the representation of address in the context of the Czech national interoperability project."
* . ^short = "Address according to Czech postal conventions"
* . ^definition = "Address according to Czech postal conventions. The address can be used both for delivering mail and for locating locations that do not have a valid mailing address. The use of extensions is not mandatory."
* insert SetFmmandStatusRule ( 1, draft )

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
  AddressPointCz named addressPoint 0..1 and
  PermanentResidenceAddressCz named permanentResidence 0..1

* extension[addressPoint] ^definition = "If both the RUIAN code and the address are given, both must match."
* use ^definition = "Address use"
* obeys text-or-ctry and POB-and-PCS and street-and-city and POB-only-postal and POB-ext-only

Invariant: text-or-ctry
Description: "Address must contain at least text or country element"
Expression: "( line.all($this.empty()) and city.empty() ) implies (text.exists() or country.exists())"
Severity:    #error

Invariant: POB-and-PCS
Description: "If P.O.Box extension is present, Postal code must be present too"
Expression: "line.all($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox').empty()) or (postalCode.exists())"
Severity:    #error

Invariant: street-and-city
Description: "If streetName extension is present, Postal code or city must be present too"
Expression: "line.all($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName').empty()) or postalCode.exists() or city.exists()"
Severity:    #error

Invariant: POB-only-postal
Description: "Address with P.O.Box cannot be \"physical\" or \"both\""
Severity: #warning
Expression: "line.all($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox').empty()) or type='postal' or type.empty()"

Invariant: POB-ext-only
Description: "If the extension 'P.O.Box' is used, the extensions 'Street' and 'House number' must not be used."
Severity: #warning
Expression: "line.all($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox').empty() or ($this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName').empty() and $this.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber').empty()))"