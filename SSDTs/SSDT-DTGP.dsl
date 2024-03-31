/*
 * The DTGP Method is not necessarily required in SSDTs; this method is only used to check UUID
 * as a piece of generic code that is injected into our DSDT. It behaves in a similar way to the
 * key "AddDTGP_0001" in Clover configuration (ACPI/DSDT/Fixes/AddDTGP_0001) as described here:
 * https://www.tonymacx86.com/threads/clover-dsdt-fixes.176195/
 *
 * The reason we may use the DTGP method is that many real Apple computers use it; we may want
 * our devices to behave more natively. If we examine the DSDTs from MacMini8,1 for example, we
 * see that almost every Method (_DSM) is followed by a DTGP method, using the same UUID below.
 */

DefinitionBlock ("SSDT-DTGP.aml", "SSDT", 2, "OC", "DTGP", 0x00000000)
{
    Method (DTGP, 5, NotSerialized)
    {
        If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
        {
            If ((Arg1 == One))
            {
                If ((Arg2 == Zero))
                {
                    Arg4 = Buffer (One) {0x03}
                    Return (One)
                }

                If ((Arg2 == One))
                {
                    Return (One)
                }
            }
        }

        Arg4 = Buffer (One) {0x00}
        Return (Zero)
    }
}

