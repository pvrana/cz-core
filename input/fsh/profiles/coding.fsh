Profile: CZ_Coding
Parent: Coding
Id: cz-coding
Title: "Coding data type"
Description: """This profile adds must-support constraints to the coding data type."""
* system MS
* code MS
* display MS
//* display.extension ^slicing.discriminator.type = #value
//* display.extension ^slicing.discriminator.path = "url"
//* display.extension ^slicing.rules = #open
//* display.extension[translation] only Translation
//* display.extension[translation] ^sliceName = "translation"
//* display.extension[translation] ^short = "Language Translation (Localization)"