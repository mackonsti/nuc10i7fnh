/*
 * SOURCES:
 * https://dortania.github.io/Getting-Started-With-ACPI/Universal/nvram-methods/manual.html
 * https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PMC.dsl
 *
 * KEXT REFERENCES:
 * /System/Library/Extensions/AppleIntelPCHPMC.kext/Contents/Info.plist
 *
 * Intel 300-series PMC support for macOS
 *
 * Starting from Z390 chipsets, PMC (D31:F2) is only available through MMIO.
 * Since there is no standard device for PMC in ACPI, Apple introduced its
 * own naming "APP9876" to access this device from AppleIntelPCHPMC driver.
 * To avoid confusion, we disable this device for all other operating systems,
 * as they would normally use another non-standard device with "PNP0C02" HID
 * and "PCHRESV" UID names.
 *
 * On certain implementations, PMC initialisation is required for NVRAM access
 * oherwise it will freeze in SMM mode. The reason for this is rather unclear.
 * Note that PMC and SPI are located in separate memory regions and PCHRESV maps
 * both, yet only PMC region is used by AppleIntelPCHPMC:
 *
 * 0xFE000000~0xFE00FFFF - PMC MBAR
 * 0xFE010000~0xFE010FFF - SPI BAR0
 * 0xFE020000~0xFE035FFF - SerialIO BAR in ACPI mode
 *
 * The PMC device may be added to Scope (LPCB) for faster initialisation, but
 * it has nothing to do with LPC bus itself. If added to PCI0 where it normally
 * exists in Apple DSDTs, it will start in the end of PCI configuration, which
 * may be too late for NVRAM support (especially on those Z390 chipsets).
 */

DefinitionBlock ("SSDT-PMCR.aml", "SSDT", 2, "OC", "PMCR", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Device (PMCR)
        {
            Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0xFE000000,         // Address Base
                    0x00010000,         // Address Length
                    )
            })

            // Original _STA value for Device (PMCR) found in Apple DSDTs was 0x0B which
            // is 1011 in binary. Reading from right to left, it represents the following:
            //
            // 1 - Bit [0] – Set if the device is present
            // 1 - Bit [1] – Set if the device is enabled and decoding its resources
            // 0 - Bit [2] – Set if the device should be shown in the UI
            // 1 - Bit [3] – Set if the device is functioning properly (cleared if device failed its diagnostics)
            //
            // Converter: https://www.rapidtables.com/convert/number/hex-to-binary.html
            // Source: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}

