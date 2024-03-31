/*
 * This SSDT must be used in conjuction with the GPRW to XPRW rename-patch in ACPI tables.
 * When enabled, it can potentially fix "instant-wake" by disabling "Wake on USB" BIOS option.
 * It overrides the _PRW package returned for GPE indexes 0x0D or 0x6D.
 *
 * Guide: https://dortania.github.io/OpenCore-Post-Install/usb/misc/instant-wake.html
 * Source: https://github.com/RehabMan/OS-X-Clover-Laptop-Config/blob/master/hotpatch/SSDT-GPRW.dsl
 */

DefinitionBlock ("SSDT-GPRW.aml", "SSDT", 2, "OC", "GPRW", 0x00000000)
{
    External (XPRW, MethodObj)

    Scope (\)
    {
        // Native method GPRW is renamed to XPRW via rename-patch in ACPI.
        // As a result, calls to method XPRW land in this code, below.
        // The purpose of this implementation is to avoid "instant wake"
        // by returning 0 in the second position (sleep state supported)
        // of the returned package.

        Method (GPRW, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((Arg0 == 0x6D))
                {
                    Return (Package (0x02) {0x6D, 0x00})
                }

                If ((Arg0 == 0x0D))
                {
                    Return (Package (0x02) {0x0D, 0x00})
                }
            }

            Return (XPRW (Arg0, Arg1))
        }
    }
}

