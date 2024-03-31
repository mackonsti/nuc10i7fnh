/*
 * Intel ACPI Name Space Architecture for NUC10i5FNHN device
 *
 * NOTES:
 * Assigned various ACPI device names to undefined PCI devices in IODeviceTree list.
 *
 * KEXT REFERENCES:
 * No macOS kext reference found.
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

DefinitionBlock ("SSDT-NAMES.aml", "SSDT", 2, "OC", "NAMES", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Device (MCHC)  // Intel Corporation Comet Lake Host Bridge/DRAM Controller [8086:9b61]
        {
            Name (_ADR, 0x00000000)
        }

        Device (PGMM)  // Intel Corporation Core Processor Gaussian Mixture Model [8086:1911]
        {
            Name (_ADR, 0x00080000)
        }

        Device (THRM)  // Intel Corporation Comet Lake Thermal Subsystem [8086:02f9]
        {
            Name (_ADR, 0x00120000)
        }

        Device (SRAM)  // Intel Corporation Comet Lake Shared Memory Controller [8086:02ef]
        {
            Name (_ADR, 0x00140002)
        }

        Device (XSPI)  // Intel Corporation Comet Lake Serial Bus SPI Controller [8086:02a4]
        {
            Name (_ADR, 0x001F0005)

//          Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
//          {
//              If ((Arg2 == Zero))
//              {
//                  Return (Buffer (One) {0x03})
//              }
//
//              Return (Package (0x02)
//              {
//                  "pci-device-hidden", Buffer (0x08) {0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}
//              })
//          }

//          Method (_STA, 0, NotSerialized)  // _STA: Status
//          {
//              If (_OSI ("Darwin"))
//              {
//                  Return (0x0F)
//              }
//              Else
//              {
//                  Return (Zero)
//              }
//          }
        }
    }
}

