Profile: CZ_DeviceObserver
Parent: Device
Id: cz-device-observer
Title: "Device - performer, observer"
Description: "This profile represents the constraints applied to the Device resource by the Czech national interoperability project.
This profile describes a device that plays the role of observer or performer."
//* ^status = #active
* ^purpose = "This profile constrains the representation of a device acting as observer in the Czech interoperability project."
* insert SetFmmandStatusRule ( 1, draft )

* identifier MS
* manufacturer MS
* modelNumber MS
* patient only Reference(CZ_PatientCore)