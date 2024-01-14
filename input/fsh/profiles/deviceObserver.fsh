Profile: CZ_DeviceObserver
Parent: Device
Id: cz-device-observer
Title: "Device - performer, observer"
Description: """Tento profil obsahuje omezení aplikovaná na Device v rámci českého národního projektu interoperability.

Profil popisuje zařízení v roli \"observer\" nebo \"performer\".

This profile represents the constraints applied to the Device resource by the Czech national interoperability proje ct.

This profile describes a device that plays the role of observer or performer."""
//* ^status = #active
* ^purpose = "Tento profil specifikuje požadavky na Device použité při vyšetření.\n\nThis profile constrains the representation of a device acting as observer in the Czech interoperability project."
* insert SetFmmandStatusRule ( 1, draft )

* identifier MS
* manufacturer MS
* modelNumber MS
* patient only Reference(CZ_Patient)