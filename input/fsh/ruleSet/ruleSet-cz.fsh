RuleSet: SetFmmandStatusRule ( fmm, status )
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}

RuleSet: SetFmmandStatusRuleInstance ( fmm, status )
// Rule to be used for Instances
* extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}

RuleSet: ExtensionContext(path)
// copied by mCode
* ^context[+].type = #element
* ^context[=].expression = "{path}"

RuleSet: SNOMEDCopyrightForVS
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* ^experimental = false

/*
RuleSet: LOINCCopyrightForVS
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* ^experimental = false

RuleSet: NPUCopyrightForVS
* ^copyright = "This material contains content from NPU Terminology (http://npu-terminology.org). NPU is copyright International Federation of Clinical Chemistry (IFCC) and International Union of Pure and Applied Chemistry (IUPAC) and is available at no cost under the license at blob:https://www.labterm.dk/0472bc56-3aa1-484d-a377-92a3db82b559."
* ^experimental = false
*/

/* RuleSet: JCTLMCopyrightForVS
* ^copyright = "This material contains content from JCTLM Database (https://www.jctlmdb.org). The JCTLM Database is copyright Joint Committee for Traceability in Laboratory Medicine (JCTLM)."
* ^experimental = false

RuleSet: NIBSCCopyrightForVS
* ^copyright = "This material contains content from the NIBSC Product list (https://nibsc.org/NIBSC%20Product%20List%20-%20Feb%2024.pdf). The National Institute for Biological Standards and Control part of the UK Medicines and Healthcare products Regulatory Agency (MHRA)."
* ^experimental = true
 */

RuleSet: ImposeProfile ( profile, index )
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile][{index}].valueCanonical = {profile}

RuleSet: ValueSetSupplementRule (codeSystem)
* ^extension[http://hl7.org/fhir/StructureDefinition/valueset-supplement].valueCanonical = {codeSystem}
