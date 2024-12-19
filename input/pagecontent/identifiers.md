### CZ Core Identifiers
CZ Core Identifiers are used extensively to consistently identify real world entities across systems, contexts of use, and other formats in CZ Core profiles.

Defined in this implementation guide are profiles for identifiers for use in populating the following data elements:
* Patient.identifier
* Device.identifier
* Document.identifier
* Organisation.identifier
* Practitioner.identifier

For all described identifiers, it must be unique within the given identifier type. It is mandatory to enter at least one national or international identifier.

#### Patient identifier
If it is known, it is mandatory to enter at least one national or international identifier (birth number, passport number, etc.). Usually, if available, one of the national identifiers is used (patient number from the national patient register, birth number, insurance number).

##### Birth number
Birth number numbers are assigned: 
* natural person upon birth or adoption of a minor natural person 
* a citizen who has not yet had a birth number, foreigners with a residence permit in the territory of the Czech Republic 
* a foreigner who has been granted international protection in the form of asylum or supplementary protection on the territory of the Czech Republic 
* a foreigner who applied for the allocation of a birth number in order to fulfill the conditions according to a special legal regulation, e.g. university studies, employment, etc. 
* a natural person for whom the Czech Social Security Administration or the District Social Security Administration has requested the allocation of a birth number in accordance with a special legal regulation.

It is required that the namespace be filled with the value: https://ncez.mzcr.cz/fhir/sid/rcis 

A unique identifier value assigned by some of the Dispensing Points. Rule for birth numbers: Minimum length: 9 characters, maximum length: 10 characters and must be a number that matches:
~~~ 
[0-9]{2}(?:[0257][1-9]|[1368][ 0-2])(?:0[1-9]|[12][0-9]|3[01])[0-9]{3,4} 
~~~

##### Passport number
Passport number is a unique ID number that confirms that a person is a citizen of a given country. 

Name space according to the passport issuer. Standard Passport Namespaces are required to be used. FHIR registers namespaces for passports in the format http://hl7.org/fhir/sid/passport-XXX, where XXX is the ISO 3166 three-letter country code.

##### Identity card number
Identity card number is is assigned when the identity card is created. Namespace according to the issuer of the identifier. Required value: https://ncez.mzcr.cz/fhir/sid/op

##### Health insurance number 

it is a number which is created by heath insurance provider. Namespace according to the issuer of the identifier. Required value: https://ncez.mzcr.cz/fhir/sid/cpoj 

##### Ressort identifier
Namespace according to the issuer of the identifier. Required value: https://ncez.mzcr.cz/fhir/sid/rid

#### Device identifier
This is a unique device identifier that is standardized according to EU Regulation 2017/745.

#### Document identifier
Document identifier enables the unique identification of medical documentation. It is recommended to use identifiers such as GUID (recommended), URI or OID.

##### GUID
GUID (Globally Unique Identifier) ​​is standardized by the ITU-T Recommendation X.667 standard. An identifier is generated to be virtually unique worldwide and is often used to identify objects and entities in various systems, databases and applications. A GUID is a 128-bit number that is usually represented as 32 hexadecimal numbers separated by dashes like: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.

##### URI
The unique identifier URI (Uniform Resource Identifier) ​​is standardized by the RFC 3986 standard. It is a reference to a certain resource, such as a web page. A URI typically includes a scheme (eg https), an authority (eg domain), a path, and an object identifier. If a URI refers to the identification of a unique document, that URI may be considered a unique identifier.

##### OID
OID 

The OID (Object Identifier), which is used for unique identification in IT, is standardized by ISO/IEC standards. It is a unique identifier used in information technology for unambiguously distinguishing objects, attributes and data structures within organizations, systems and standards. An OID is a hierarchical identifier in the form of numbers separated by dots that represent the path to a given object in a hierarchy defined by a given organizational or standardization system, such as ISO. 

OID enables unambiguous identification and addressing of data elements and entities within different systems and facilitates interoperability and resource management.

#### Organisation identifier
Within the organization, it is necessary to use at least one national unique Identifier, which is used to identify the organization. Typically, the NRPZS value and/or the IČO value are stated. It is allowed to include information from other identification systems. The use of the identifier NRPZS is preferred.

##### NRPZS
This identification is according to the National Register of Health Service Providers.

##### IČO
Identification number of a person using the eight-digit identification number of a legal entity, a natural person doing business or an organizational component of the state.

##### Others
There are three other possible types of identifier according to IČZ, ČLK and ČLéK. However, these identifiers are not required.

#### Practitioner identifier
National identification of the Clinician or Physician 

Within the organization, it is necessary to use at least one national unique Identifier, which is used to identify the worker. Typically, the NRZP value is given. However, there are optional identifiers according to ČLK and ČLéK, which can be used here as well.