/*
 * SOURCES:
 * https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html
 * https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-SBUS-MCHC.dsl
 *
 * KEXT REFERENCES:
 * /System/Library/Extensions/AppleSMBusPCI.kext/Contents/Info.plist
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

DefinitionBlock ("SSDT-SBUS.aml", "SSDT", 2, "OC", "SMBUS", 0x00000000)
{
    External (_SB_.PCI0.SBUS, DeviceObj)

    Scope (\_SB.PCI0.SBUS)  // Intel Corporation Comet Lake SMBus Controller [8086:02a3]
    {
        Device (BUS0)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_CID, "smbus")  // _CID: Compatible ID

            Device (DVL0)
            {
                Name (_ADR, 0x57)  // _ADR: Address
                Name (_CID, "diagsvault")  // _CID: Compatible ID
                Method (_DSM, 4, NotSerialized)
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One) {0x57})
                    }

                    Return (Package (0x02) {"address", 0x57})
                }
            }
        }

        Device (BUS1)
        {
            Name (_ADR, One)  // _ADR: Address
            Name (_CID, "smbus")  // _CID: Compatible ID
        }
    }
}

