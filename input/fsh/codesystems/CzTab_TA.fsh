CodeSystem: CZ_TabTaCS
Id: cz-tab-ta
Title: "Typ adresy DASTA"
Description: "Kódový systém typů adresy DASTA / Czech national code system (DASTA) for type of address."

* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.203.24341.11.2.4.4"
* ^version = "1.0"
* ^status = #active
* ^date = "1980-01-01"
* ^experimental = false
* ^publisher = "DASTA"
* ^caseSensitive = true
* ^content = #complete
* ^url = "https://ncez.mzcr.cz/standards/fhir/CodeSystem/cz-tab-ta"
* insert SetFmmandStatusRule(2, trial-use)

* #1
* #1 ^designation.language = #cs
* #1 ^designation.value = "trvalé bydliště"
* #1 ^definition = "Místo trvalého pobytu"
* #2
* #2 ^designation.language = #cs
* #2 ^designation.value = "přechodné bydliště"
* #2 ^definition = "Místo přechodného pobytu"
* #3
* #3 ^designation.language = #cs
* #3 ^designation.value = "příbuzný"
* #3 ^definition = "Příbuzný pacienta"
* #4
* #4 ^designation.language = #cs
* #4 ^designation.value = "registrující lékař"
* #4 ^definition = "Registrující všeobecný praktický lékař nebo praktický lékař pro děti a dorost"
* #5
* #5 ^designation.language = #cs
* #5 ^designation.value = "zaměstnavatel"
* #6
* #6 ^designation.language = #cs
* #6 ^designation.value = "plátce nemocenských dávek"
* #7
* #7 ^designation.language = #cs
* #7 ^designation.value = "zdravotnické zařízení"
* #8
* #8 ^designation.language = #cs
* #8 ^designation.value = "právní zástupce"
* #8 ^definition = "právní zástupce (pacienta), nejedná se o zákonného zástupce"
* #9
* #9 ^designation.language = #cs
* #9 ^designation.value = "farnost"
* #S
* #S ^designation.language = #cs
* #S ^designation.value = "základní škola"
* #S ^definition = "Základní škola (dětského pacienta)"
* #C
* #C ^designation.language = #cs
* #C ^designation.value = "kontakt na poskytovatele"
* #C ^definition = "Kontaktní zdravotnický profesionál či poskytovatel zdrav. služeb (ve vazbě k pacientovi) dle projektu Patient Summary"
* #K
* #K ^designation.language = #cs
* #K ^designation.value = "kontaktní osoba"
* #K ^definition = "Kontaktní osoba (ve vazbě k pacientovi) dle projektu Patient Summary"
* #Z
* #Z ^designation.language = #cs
* #Z ^designation.value = "zákonný zástupce (pacienta)"
* #G
* #G ^designation.language = #cs
* #G ^designation.value = "registrující gynekolog"
* #M
* #M ^designation.language = #cs
* #M ^designation.value = "registrující stomatolog"
* #T
* #T ^designation.language = #cs
* #T ^designation.value = "tlumočník"
* #L
* #L ^designation.language = #cs
* #L ^designation.value = "laboratoř"
* #A
* #A ^designation.language = #cs
* #A ^designation.value = "zdravotnické pracoviště (poskytovatel, klinika, pracoviště)"
* #B
* #B ^designation.language = #cs
* #B ^designation.value = "zdravotní pojišťovna"
* #P
* #P ^designation.language = #cs
* #P ^designation.value = "adresa příjemce"
* #O
* #O ^designation.language = #cs
* #O ^designation.value = "adresa odesílatele"
* #X
* #X ^designation.language = #cs
* #X ^designation.value = "jiná adresa"