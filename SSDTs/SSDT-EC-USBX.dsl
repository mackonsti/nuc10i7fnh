/*
 * SOURCES:
 * https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-fix.html
 * https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-EC-USBX.dsl
 *
 * KEXT REFERENCES:
 * /System/Library/Extensions/AppleBusPowerController.kext/Contents/Info.plist
 * /System/Library/Extensions/IOUSBHostFamily.kext/Contents/Info.plist
 *
 * DefinitionBlock (AMLFileName, TableSignature, ComplianceRevision, OEMID, TableID, OEMRevision)
 *
 *    AMLFileName = Name of the AML file (string); can be a null string too;
 *    TableSignature = Signature of the AML file (DSDT or SSDT) (4-character string);
 *    ComplianceRevision = 1 or less for 32-bit arithmetic; 2 or greater for 64-bit arithmetic (8-bit unsigned integer);
 *    OEMID = ID of the Original Equipment Manufacturer of this ACPI table (6-character string);
 *    TableID = A specific identifier for the table (8-character string);
 *    OEMRevision = A revision number set by the OEM (32-bit number).
 */

DefinitionBlock ("SSDT-EC-USBX.aml", "SSDT", 2, "OC", "FakeEC", 0x00000000)
{
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC._STA, MethodObj)

    // Do NOT simply rename EC0, H_EC, etc. to EC as these devices are incompatible with macOS and
    // may break at any time; AppleACPIEC kext must NOT load. If your motherboard has an existing
    // Embedded Controller of PNP0C09 type, this code checks for the existence of typical references
    // such as _HID, _CRS and _GPE before injecting a value in _STA that would disable the device.

    If (CondRefOf (\_SB.PCI0.LPCB.H_EC))
    {
        If ((((CondRefOf (\_SB.PCI0.LPCB.H_EC._HID) && CondRefOf (\_SB.PCI0.LPCB.H_EC._CRS)) && CondRefOf (\_SB.PCI0.LPCB.H_EC._GPE)) && !CondRefOf (\_SB.PCI0.LPCB.H_EC._STA)))
        {
            Scope (\_SB.PCI0.LPCB.H_EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    Scope (\_SB.PCI0.LPCB)  // Intel Corporation Comet Lake LPC Controller [8086:0284]
    {
        Device (EC)
        {
            Name (_HID, "EC000000")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (\_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One) {0x03})
                }

                // The following power values are copied from the Macmini7,1 platform as defined
                // in file /System/Library/Extensions/IOUSBHostFamily.kext/Contents/Info.plist

                Return (Package (0x08)
                {
                    "kUSBSleepPortCurrentLimit", 0x0834,  // 2100mA
                    "kUSBSleepPowerSupply",      0x13EC,  // 5100mA
                    "kUSBWakePortCurrentLimit",  0x0834,  // 2100mA
                    "kUSBWakePowerSupply",       0x13EC   // 5100mA
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}

