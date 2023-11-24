Extension: AddresaTrvalehoPobytuCz
Id:   addresa-trvaleho-pobytu-cz
Title:  "Adresa trvalého pobytu"
Description: "Tato extenze umožňuje zápis příznaku označujícího adresu trvalého pobytu. / This extension provides a link to the order [(Reference(ServiceRequest)] or requisition [ServiceRequest.requisition (i.e., 'Request.groupIdentifier')] that this report document is based on and fulfills."
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* ^context[+].type = #element
* ^context[=].expression = "CZ_Address"

//* ^url = "http://ncez.mzcr.cz/standards/fhir/StructureDefinition/addresa-trvaleho-pobytu-cz"
* value[x] only boolean