CodeSystem: RoleCodeSupplement
Id: role-code-supplement
Description: "CodeSystem Supplement pro PersonalRelationship"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "https://ncez.mzcr.cz/standards/fhir/CodeSystem/role-code-supplement"
* ^title = "Kódový systém osobních a příbuzenských vztahů k subjektu"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2023-01-08"
* ^publisher = "NCEZ"
* ^content = #supplement
* ^supplements = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* insert SetFmmandStatusRule(2, trial-use)

* #AUNT
* #AUNT ^designation.language = #cs
* #AUNT ^designation.value = "teta"
* #BRO
* #BRO ^designation.language = #cs
* #BRO ^designation.value = "bratr"
* #BROINLAW
* #BROINLAW ^designation.language = #cs
* #BROINLAW ^designation.value = "švagr"
* #CHILD
* #CHILD ^designation.language = #cs
* #CHILD ^designation.value = "dítě"
* #CHLDADOPT
* #CHLDADOPT ^designation.language = #cs
* #CHLDADOPT ^designation.value = "osvojené dítě"
* #CHLDFOST
* #CHLDFOST ^designation.language = #cs
* #CHLDFOST ^designation.value = "dítě v náhradní péči (kromě osvojení)"
* #CHLDINLAW
* #CHLDINLAW ^designation.language = #cs
* #CHLDINLAW ^designation.value = "zeť/snacha"
* #COUSN
* #COUSN ^designation.language = #cs
* #COUSN ^designation.value = "sestřenice/bratranec"
* #DAU
* #DAU ^designation.language = #cs
* #DAU ^designation.value = "vlastní dcera"
* #DAUADOPT
* #DAUADOPT ^designation.language = #cs
* #DAUADOPT ^designation.value = "osvojená dcera"
* #DAUC
* #DAUC ^designation.language = #cs
* #DAUC ^designation.value = "dcera"
* #DAUFOST
* #DAUFOST ^designation.language = #cs
* #DAUFOST ^designation.value = "dcera v náhradní péči (kromě osvojení)"
* #DAUINLAW
* #DAUINLAW ^designation.language = #cs
* #DAUINLAW ^designation.value = "snacha"
* #DOMPART
* #DOMPART ^designation.language = #cs
* #DOMPART ^designation.value = "druh/družka"
* #FAMMEMB
* #FAMMEMB ^designation.language = #cs
* #FAMMEMB ^designation.value = "rodinný příslušník"
* #FRND
* #FRND ^designation.language = #cs
* #FRND ^designation.value = "přítel/přítelkyně"
* #FTH
* #FTH ^designation.language = #cs
* #FTH ^designation.value = "otec"
* #FTHINLAW
* #FTHINLAW ^designation.language = #cs
* #FTHINLAW ^designation.value = "tchán"
* #GGRFTH
* #GGRFTH ^designation.language = #cs
* #GGRFTH ^designation.value = "pradědeček"
* #GGRMTH
* #GGRMTH ^designation.language = #cs
* #GGRMTH ^designation.value = "prababička"
* #GGRPRN
* #GGRPRN ^designation.language = #cs
* #GGRPRN ^designation.value = "praprarodič"
* #GRFTH
* #GRFTH ^designation.language = #cs
* #GRFTH ^designation.value = "dědeček"
* #GRMTH
* #GRMTH ^designation.language = #cs
* #GRMTH ^designation.value = "babička"
* #GRNDCHILD
* #GRNDCHILD ^designation.language = #cs
* #GRNDCHILD ^designation.value = "vnouče"
* #GRNDDAU
* #GRNDDAU ^designation.language = #cs
* #GRNDDAU ^designation.value = "vnučka"
* #GRNDSON
* #GRNDSON ^designation.language = #cs
* #GRNDSON ^designation.value = "vnuk"
* #GRPRN
* #GRPRN ^designation.language = #cs
* #GRPRN ^designation.value = "prarodič"
* #HUSB
* #HUSB ^designation.language = #cs
* #HUSB ^designation.value = "manžel"
* #MTH
* #MTH ^designation.language = #cs
* #MTH ^designation.value = "matka"
* #MTHINLAW
* #MTHINLAW ^designation.language = #cs
* #MTHINLAW ^designation.value = "tchýně"
* #NBOR
* #NBOR ^designation.language = #cs
* #NBOR ^designation.value = "soused/sousedka"
* #NCHILD
* #NCHILD ^designation.language = #cs
* #NCHILD ^designation.value = "potomek"
* #NEPHEW
* #NEPHEW ^designation.language = #cs
* #NEPHEW ^designation.value = "synovec"
* #NIECE
* #NIECE ^designation.language = #cs
* #NIECE ^designation.value = "neteř"
* #NIENEPH
* #NIENEPH ^designation.language = #cs
* #NIENEPH ^designation.value = "neteř/synovec"
* #NOK
* #NOK ^designation.language = #cs
* #NOK ^designation.value = "příbuzný"
* #PRN
* #PRN ^designation.language = #cs
* #PRN ^designation.value = "rodič"
* #PRNINLAW
* #PRNINLAW ^designation.language = #cs
* #PRNINLAW ^designation.value = "tchyně/tchán"
* #ROOM
* #ROOM ^designation.language = #cs
* #ROOM ^designation.value = "spolubydlící"
* #SIB
* #SIB ^designation.language = #cs
* #SIB ^designation.value = "sourozenec"
* #SIGOTHR
* #SIGOTHR ^designation.language = #cs
* #SIGOTHR ^designation.value = "osoba blízká"
* #SIS
* #SIS ^designation.language = #cs
* #SIS ^designation.value = "sestra"
* #SISINLAW
* #SISINLAW ^designation.language = #cs
* #SISINLAW ^designation.value = "švagrová"
* #SON
* #SON ^designation.language = #cs
* #SON ^designation.value = "vlastní syn"
* #SONADOPT
* #SONADOPT ^designation.language = #cs
* #SONADOPT ^designation.value = "osvojený syn"
* #SONC
* #SONC ^designation.language = #cs
* #SONC ^designation.value = "syn"
* #SONFOST
* #SONFOST ^designation.language = #cs
* #SONFOST ^designation.value = "syn v náhradní péči (kromě osvojení)"
* #SONINLAW
* #SONINLAW ^designation.language = #cs
* #SONINLAW ^designation.value = "zeť"
* #SPS
* #SPS ^designation.language = #cs
* #SPS ^designation.value = "manžel/maželka"
* #STPCHLD
* #STPCHLD ^designation.language = #cs
* #STPCHLD ^designation.value = "nevlastní dítě"
* #STPDAU
* #STPDAU ^designation.language = #cs
* #STPDAU ^designation.value = "nevlastní dcera"
* #STPSON
* #STPSON ^designation.language = #cs
* #STPSON ^designation.value = "nevlastní syn"
* #UNCLE
* #UNCLE ^designation.language = #cs
* #UNCLE ^designation.value = "strýc"
* #WIFE
* #WIFE ^designation.language = #cs
* #WIFE ^designation.value = "manželka"
