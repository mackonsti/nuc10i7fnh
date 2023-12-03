/*
 * SOURCES:
 * https://dortania.github.io/Getting-Started-With-ACPI/Universal/awac.html
 * https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-AWAC-DISABLE.dsl
 *
 * The Time and Alarm device provides an alternative to the Real Time Clock (RTC),
 * which is defined as a fixed-feature hardware device. The wake timers allow the
 * system to transition from the S3 (or optionally S4/S5) state to S0 state after
 * a time period elapses. In comparison with the Real Time Clock (RTC) alarm, the
 * Time and Alarm device provides a larger scale of flexibility in the operation
 * of the wake timers and allows the implementation of the time source to be
 * abstracted from the OSPM.
 *
 * However, macOS does yet not support AWAC, so we have to force-enable RTC device
 * while disabling AWAC, on some modern BIOS. NOTE: Do not use "RTC ACPI Patch" in
 * Clover at the same time, but opt for this cleaner solution if you just cannot
 * force-enable Legacy RTC in your BIOS.
 */

DefinitionBlock ("SSDT-AWAC.aml", "SSDT", 2, "OC", "AWAC", 0x00000000)
{
    External (STAS, IntObj)

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                STAS = One
            }
        }
    }
}

