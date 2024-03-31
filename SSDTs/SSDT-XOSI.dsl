/*
 * SOURCES:
 * https://dortania.github.io/Getting-Started-With-ACPI/Laptops/trackpad-methods/manual.html#osi-to-xosi
 * https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-XOSI.dsl
 *
 * ACPI code can use the _OSI method (implemented by the ACPI host) to check
 * which Windows version it is running on. Most DSDT implementations will vary
 * the USB configuration depending on the version of Windows that is running.
 *
 * When running macOS, none of the checks DSDT might be doing for _OSI ("Windows
 * <version>") will return 'true' because it only responds to "Darwin". This is
 * the reason for having the "OS Check Fix" family of DSDT patches. By patching
 * DSDT to simulate a certain version of Windows when running Darwin, we obtain
 * behavior that'd normally happen when running that specific version of Windows.
 *
 * Normally, _OSI calls would be handled by macOS (the ACPI host), but via the
 * Clover patch, _OSI calls are routed to XOSI so a particular version of Windows
 * can be simulated. The version of XOSI below implements a simulation of "Windows
 * 2009" (i.e. Windows 7), which is found to work well with most systems.
 *
 */

DefinitionBlock ("SSDT-XOSI.aml", "SSDT", 2, "OC", "XOSI", 0x00000000)
{
    // All official _OSI calls in DSDT are routed to XOSI via Clover patch.
    // This XOSI below now simulates "Windows 2015" (which is Windows 10).
    // Note: According to ACPI spec, _OSI("Windows") must also return true.
    // Also, it should return true for all previous versions of Windows.
    //
    // Definitions: https://learn.microsoft.com/en-us/windows-hardware/drivers/acpi/winacpi-osi

    Method (XOSI, 1, NotSerialized)
    {
        Local0 = Package (0x09)
        {
            "Windows",             // Generic Windows query
        //  "Windows 2000",        // Windows 2000
            "Windows 2001",        // Windows XP
            "Windows 2001 SP1",    // Windows XP SP1
            "Windows 2001 SP2",    // Windows XP SP2
        //  "Windows 2001.1",      // Windows Server 2003
        //  "Windows 2001.1 SP1",  // Windows Server 2003 SP1
            "Windows 2006",        // Windows Vista
        //  "Windows 2006 SP1",    // Windows Vista SP1
        //  "Windows 2006.1",      // Windows Server 2008
            "Windows 2009",        // Windows 7 & Windows Server 2008 R2
            "Windows 2012",        // Windows 8 & Windows Server 2012
            "Windows 2013",        // Windows 8.1 & Windows Server 2012 R2
            "Windows 2015",        // Windows 10
        //  "Windows 2016",        // Windows 10 Version 1607
        //  "Windows 2017",        // Windows 10 Version 1703
        //  "Windows 2017.2",      // Windows 10 Version 1709
        //  "Windows 2018",        // Windows 10 Version 1803
        //  "Windows 2018.2",      // Windows 10 version 1809
        //  "Windows 2019",        // Windows 10 version 1903
        //  "Windows 2020",        // Windows 10 version 2004
        //  "Windows 2021",        // Windows 11
        //  "Windows 2022",        // Windows 11 version 22H2
        }

        If (_OSI ("Darwin"))
        {
            Return ((Ones != Match (Local0, MEQ, Arg0, MTR, Zero, Zero)))
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}

