### Úvod

Implementační návod CZ Core vychází z [FHIR verze R4]. Definuje minimální pravidla interoperability a národní přizpůsobení zdrojů FHIR, která se uplatní při vytváření národních profilů pro konkrétní případy užití. Stanovení „základních“ norem na podporu interoperability a jejich implementace v informačních systémech vytváří společný základ pro interoperabilní výměnu zdravotních dat.

### Profily CZ Core

Níže je uveden seznam hlavních profilů CZ Core. Každý profil identifikuje, které základní prvky, rozšíření, slovníky a sady hodnot **MUSÍ** být přítomny ve zdroji při použití tohoto profilu. Společně podporují interoperabilitu a představují společný základ pro vývoj standardů pro konkrétní případy použití.

Jednoduchý popisný souhrn obsahuje požadavky a pokyny pro každý profil. Formální hierarchická tabulka představuje [logický pohled] na obsah jak v rozdílovém pohledu, tak i ve snímku a jsou uvedeny odkazy na příslušnou terminologii a příklady.

{% include sd-list-generator.md %}

### Závislosti

{% include dependency-table.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Globální Profily

{% include globals-table.xhtml %}

### IP statements

{% include ip-statements.xhtml %}

