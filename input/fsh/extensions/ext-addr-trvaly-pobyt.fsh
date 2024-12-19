Extension: PermanentResidenceAddressCz
Id:   permanent-residencer-address-cz
Title:  "Address permanent residence"
Description: "This extension provides a link to the order [(Reference(ServiceRequest)] or requisition [ServiceRequest.requisition (i.e., 'Request.groupIdentifier')] that this report document is based on and fulfills."
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* insert SetFmmandStatusRule ( 1, draft )
* insert ExtensionContext(Address)
* . ^short = "Address permanent residence"
* . ^definition = "This extension allows to specify whether or not the address is an official address (permanent address) or to indicate that it is the official address for that country."

* value[x] 1..1
* value[x] only boolean or CodeableConcept
//* value[x] from $iso3166-1-2 (preferred)
* valueCodeableConcept from $iso3166-1-2 (preferred)
  * ^short = "Code of the country in which the address is an official address similar to the address of permanent residence"
* valueBoolean ^short = "Permanent residence address flag"