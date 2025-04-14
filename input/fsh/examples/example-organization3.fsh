Instance: Organization-3
InstanceOf: cz-organization-core
Usage: #example
Description: "An example of the organization of a health insurance"
* identifier[+].system = "https://www.dastacr.cz/dasta/nclp_data/ds_UZIS/ZdravotniPojistovna.xml"
* identifier[=].value = "111"
//* type[+] = $hl7OrganizationType#ins "Insurance Company"
* name = "Všeobecná zdravotní pojišťovna ČR"


