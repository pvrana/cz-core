### Identifiers
This chapter discusses the general use of identifiers and nationally specific identifiers. CZ Identifiers are used extensively to consistently identify real world entities across systems, contexts of use, and other formats in CZ profiles.

#### General identifiers

At the general level it is used identifiers in the URI format.
The unique identifier URI (Uniform Resource Identifier) ​​is standardized by the RFC 3986 standard. It is a reference to a certain resource, such as a web page. A URI typically includes a scheme (eg https), an authority (eg domain), a path, and an object identifier. If a URI refers to the identification of a unique document, that URI may be considered a unique identifier.

The URI format allows the creation of identifiers of several types. In our national environment, these two types are mainly used:  

##### GUID
GUID (Globally Unique Identifier) ​​is standardized by the ITU-T Recommendation X.667 standard. An identifier is generated to be virtually unique worldwide and is often used to identify objects and entities in various systems, databases and applications. A GUID is a 128-bit number that is usually represented as 32 hexadecimal numbers separated by dashes like: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.
Format must match this regular expression:
~~~ 
[0-9a-zA-Z]{8}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{4}-[0-9a-zA-Z]{12} 
~~~

##### OID
The OID (Object Identifier), which is used for unique identification in IT, is standardized by ISO/IEC standards. It is a unique identifier used in information technology for unambiguously distinguishing objects, attributes and data structures within organizations, systems and standards. An OID is a hierarchical identifier in the form of numbers separated by dots that represent the path to a given object in a hierarchy defined by a given organizational or standardization system, such as ISO. 

OID enables unambiguous identification and addressing of data elements and entities within different systems and facilitates interoperability and resource management.
Format must match this regular expression:
~~~ 
[0-2](\.(0|[1-9][0-9]*))* 
~~~

#### Nationally specific identifier

Defined in this implementation guide are profiles for identifiers for use in populating the following data elements:
* Patient.Identifier
* Device.Identifier
* DocumentIdentifier
* Organization.Identifier
* Practitioner.Identifier

All identifiers must be unique within the identifier type. 

##### Patient Identifier
If it is known, it is mandatory to enter at least one national or international identifier (birth number, passport number, etc.). Usually, if available, one of the national identifiers is used (patient number from the national patient register, birth number, insurance number).

###### Birth Number
Birth Numbers are assigned: 
* natural person upon birth or adoption of a minor natural person 
* a citizen who has not yet had a birth number, foreigners with a residence permit in the territory of the Czech Republic 
* a foreigner who has been granted international protection in the form of asylum or supplementary protection on the territory of the Czech Republic 
* a foreigner who applied for the allocation of a birth number in order to fulfill the conditions according to a special legal regulation, e.g. university studies, employment, etc. 
* a natural person for whom the Czech Social Security Administration or the District Social Security Administration has requested the allocation of a birth number in accordance with a special legal regulation.

It is required that the namespace be filled with the value: https://ncez.mzcr.cz/fhir/sid/rcis 

A unique identifier value assigned by some of the Dispensing Points. Rule for birth numbers: Minimum length: 9 characters, maximum length: 10 characters and must be a number that matches this expression:
~~~ 
[0-9]{2}(?:[0257][1-9]|[1368][ 0-2])(?:0[1-9]|[12][0-9]|3[01])[0-9]{3,4} 
~~~

###### Passport Number
Passport Number is a unique ID number that confirms that a person is a citizen of a given country. 

Name space according to the passport issuer. Standard Passport Namespaces are required to be used. FHIR registers namespaces for passports in the format http://hl7.org/fhir/sid/passport-XXX, where XXX is the ISO 3166 three-letter country code.

###### Identity Card Number
Identity Card Number is is assigned when the identity card is created. The identifier namespace in this case is presented by the value from this: https://ncez.mzcr.cz/fhir/sid/op.

###### Health Insurance Number 
It is a number which is created by heath insurance provider. The identifier namespace in this case is presented by the value from this: https://ncez.mzcr.cz/fhir/sid/cpoj 

###### Personal Healthcare Identifier (RID)
The identifier namespace in this case is presented by the value from this: https://ncez.mzcr.cz/fhir/sid/rid.

##### Device Identifier
This is a unique device identifier that is standardized according to EU Regulation 2017/745. The ‘Unique Device Identifier’ (knows as‘UDI’) is a series of numeric or alphanumeric characters that is created through a globally accepted device identification and coding standard. It allows the unambiguous identification of a specific device on the market. The UDI is comprised of the UDI-DI and the UDI-PI.

The UDI-DI is a unique numeric or alphanumeric code specific to a model of device and that is also used as the ‘access key’ to information stored in a UDI database.

The UDI-PI is a numeric or alphanumeric code that identifies the unit of device production.
The different types of UDI-PIs include serial number, lot number, software identification and manufacturing or expiry date or both types of date.

The word ‘Unique’ does not imply serialisation of individual production units.

##### Document Identifier
Document identifier enables the unique identification of medical documentation. It is recommended to use identifiers such as GUID (recommended), OID or possibly another type of URI.

##### Organization Identifier
Within the organization, it is necessary to use at least one national unique Identifier, which is used to identify the organization. Typically, the NRPZS value and/or the IČO value are stated. It is allowed to include information from other identification systems. The use of the identifier NRPZS is preferred.

###### NRPZS
This identification is according to the National Register of Health Service Providers. The identifier namespace in this case is presented by the value: https://ncez.mzcr.cz/fhir/sid/nrpzs.

###### IČO
Identification number of a person using the eight-digit identification number of a legal entity, a natural person doing business or an organizational component of the state. The identifier namespace in this case is presented by the value: https://ncez.mzcr.cz/fhir/sid/ico.

###### Others
There are two other possible types of identifier according to IČZ (Namespace: https://ncez.mzcr.cz/fhir/sid/icz) and IČP (Namespace: https://ncez.mzcr.cz/fhir/sid/icp). However, these identifiers are not required. 

##### Practitioner Identifier
This indentifier represents national identification of the Clinician, Physician or Pharmacist. Within the organization, it is necessary to use at least one national unique Identifier, which is used to identify the worker. Typically, the NRZP value is given. The identifier namespace for NRZP in this case is presented by the value: However, there are optional identifiers according to ČLK and ČLéK, which can be used here as well.