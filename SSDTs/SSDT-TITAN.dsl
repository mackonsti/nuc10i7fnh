/*
 * Intel ACPI Name Space Architecture for NUC10i7FNH device
 *
 * This SSDT code adds explicit Thunderbolt functionality to the embedded
 * Intel JHL 7540 Thunderbolt Controller (Titan Ridge 2C 2018) by first
 * disabling the native Device (PXSX) found in the firmware ACPI tables.
 *
 * Source: Original MacBookPro15,4 extracted ACPI table SSDT-10 (TbtOnPCH)
 */

DefinitionBlock ("SSDT-TITAN.aml", "SSDT", 2, "OC", "TITAN", 0x00000000)
{
    External (_SB_.PCI0.RP05, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (DTGP, MethodObj)

    Scope (\_SB.PCI0.RP05)
    {
        Scope (PXSX)
        {
            Name (_STA, Zero)  // _STA: Status
        }

        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
        {
            Return (Zero)
        }

        Device (UPSB)  // Intel JHL7540 Thunderbolt 3 Bridge (Titan Ridge 2C 2018) [8086:15e7]
        {
            Name (_ADR, Zero)  // _ADR: Address
            OperationRegion (A1E0, PCI_Config, Zero, 0x40)
            Field (A1E0, ByteAcc, NoLock, Preserve)
            {
                AVND,   32,
                BMIE,   3,
                Offset (0x18),
                PRIB,   8,
                SECB,   8,
                SUBB,   8,
                Offset (0x1E),
                    ,   13,
                MABT,   1
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (SECB)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }

//          Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
//          {
//              Return (Package (0x02) {0x69, 0x03})
//          }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One) {0x03})
                }

                Local0 = Package (0x06)
                {
                    "AAPL,slot-name",  Buffer (0x09) {"Built In"},
                //  "built-in",        Buffer (0x01) {0x00},
                    "model",           Buffer (0x23) {"Intel JHL7540 Thunderbolt 3 Bridge"},
                //  "name",            Buffer (0x0B) {"pci-bridge"},
                    "PCI-Thunderbolt", 0x01
                }
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }

            Device (DSB0)  // Intel JHL7540 Thunderbolt 3 Bridge (Titan Ridge 2C 2018) [8086:15e7]
            {
                Name (_ADR, 0x00000000)  // _ADR: Address
                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    AVND,   32,
                    BMIE,   3,
                    Offset (0x18),
                    PRIB,   8,
                    SECB,   8,
                    SUBB,   8,
                    Offset (0x1E),
                        ,   13,
                    MABT,   1
                }

                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                {
                    Return (Zero)
                }

//              Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
//              {
//                  Return (Package (0x02) {0x69, 0x03})
//              }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One) {0x03})
                    }

                    Local0 = Package (0x04)
                    {
                        "AAPL,slot-name",    Buffer (0x09) {"Built In"},
                    //  "built-in",          Buffer (0x01) {0x00},
                    //  "model",             Buffer (0x23) {"Intel JHL7540 Thunderbolt 3 Bridge"},
                    //  "name",              Buffer (0x0B) {"pci-bridge"},
                    //  "IOPCIHPType",       0x01,
                        "PCIHotplugCapable", 0x00
                    }
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

                Device (NHI0)  // Intel JHL7540 Thunderbolt 3 NHI Controller (Titan Ridge 2C 2018) [8086:15e8]
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }

                    OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                    Field (A1E0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   32,
                        BMIE,   3,
                        Offset (0x18),
                        PRIB,   8,
                        SECB,   8,
                        SUBB,   8,
                        Offset (0x1E),
                            ,   13,
                        MABT,   1
                    }

                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (Package (0x02) {0x69, 0x03})
                    }

                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One) {0x03})
                        }

                        Local0 = Package (0x13)
                        {
                        //  "AAPL,slot-name",  Buffer (0x0C) {"Thunderbolt"},
                            "AAPL,slot-name",  Buffer (0x09) {"Built In"},
                        //  "built-in",        Buffer (0x01) {0x00},
                            "device_type",     Buffer (0x1B) {"Thunderbolt NHI Controller"},
                            "linkDetails",     Buffer (0x08) {0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00},
                            "model",           Buffer (0x2B) {"Intel JHL7540 Thunderbolt 3 NHI Controller"},
                        //  "name",            Buffer (0x1B) {"Thunderbolt NHI Controller"},
                            "sscOffset",       Buffer (0x02) {0x00, 0x00},
                            "TBTDPLowToHigh",  Buffer (0x04) {0x01, 0x00, 0x00, 0x00},
                            "TBTFlags",        Buffer (0x04) {0x03, 0x00, 0x00, 0x00},
                            "ThunderboltUUID", ToUUID ("1ae81224-90df-4d2a-9061-1ce38b70598a"),
                            "power-save", One, Buffer (0x01) {0x00}
                        }
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }
            }

            Device (DSB1)  // Intel JHL7540 Thunderbolt 3 Bridge (Titan Ridge 2C 2018) [8086:15e7]
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Name (_SUN, 0x04)  // _SUN: Slot User Number
                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    AVND,   32,
                    BMIE,   3,
                    Offset (0x18),
                    PRIB,   8,
                    SECB,   8,
                    SUBB,   8,
                    Offset (0x1E),
                        ,   13,
                    MABT,   1
                }

                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                {
                    Return (Zero)
                }

//              Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
//              {
//                  Return (Package (0x02) {0x69, 0x03})
//              }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (0x01) {0x03})
                    }

                    Return (Package (0x02)
                    {
                    //  "built-in",             Buffer (0x01) {0x00},
                    //  "model",                Buffer (0x23) {"Intel JHL7540 Thunderbolt 3 Bridge"},
                    //  "name",                 Buffer (0x0B) {"pci-bridge"},
                        "Thunderbolt Entry ID", 0x94968416
                    })
                }

                Device (UPS0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                    Field (ARE0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   16
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }

                    Device (DSB0)
                    {
                        Name (_ADR, 0x00000000)  // _ADR: Address
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32,
                            BMIE,   3,
                            Offset (0x18),
                            PRIB,   8,
                            SECB,   8,
                            SUBB,   8,
                            Offset (0x1E),
                                ,   13,
                            MABT,   1,
                            Offset (0x3E),
                                ,   6,
                            SBRS,   1
                        }

                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                        {
                            Return (SECB)
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }

                        Device (DEV0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Device (DSB3)
                    {
                        Name (_ADR, 0x00030000)  // _ADR: Address
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32,
                            BMIE,   3,
                            Offset (0x18),
                            PRIB,   8,
                            SECB,   8,
                            SUBB,   8,
                            Offset (0x1E),
                                ,   13,
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                        {
                            Return (SECB)
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }

                        Device (UPS0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                            Field (ARE0, ByteAcc, NoLock, Preserve)
                            {
                                AVND,   16
                            }

                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }

                            Device (DSB0)
                            {
                                Name (_ADR, 0x00000000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1,
                                    Offset (0x3E),
                                        ,   6,
                                    SBRS,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                    {
                                        Return (0x0F)
                                    }
                                }
                            }

                            Device (DSB3)
                            {
                                Name (_ADR, 0x00030000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                    {
                                        Return (0x0F)
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                    {
                                        Return (0x0F)
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB5)
                            {
                                Name (_ADR, 0x00050000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }
                            }

                            Device (DSB6)
                            {
                                Name (_ADR, 0x00060000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }
                            }
                        }
                    }

                    Device (DSB4)
                    {
                        Name (_ADR, 0x00040000)  // _ADR: Address
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32,
                            BMIE,   3,
                            Offset (0x18),
                            PRIB,   8,
                            SECB,   8,
                            SUBB,   8,
                            Offset (0x1E),
                                ,   13,
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                        {
                            Return (SECB)
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }

                        Device (UPS0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                            Field (ARE0, ByteAcc, NoLock, Preserve)
                            {
                                AVND,   16
                            }

                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }

                            Device (DSB0)
                            {
                                Name (_ADR, 0x00000000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1,
                                    Offset (0x3E),
                                        ,   6,
                                    SBRS,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                    {
                                        Return (0x0F)
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB3)
                            {
                                Name (_ADR, 0x00030000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                    {
                                        Return (0x0F)
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                    {
                                        Return (0x0F)
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB5)
                            {
                                Name (_ADR, 0x00050000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }
                            }

                            Device (DSB6)
                            {
                                Name (_ADR, 0x00060000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32,
                                    BMIE,   3,
                                    Offset (0x18),
                                    PRIB,   8,
                                    SECB,   8,
                                    SUBB,   8,
                                    Offset (0x1E),
                                        ,   13,
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB)
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }
                            }
                        }
                    }

                    Device (DSB5)
                    {
                        Name (_ADR, 0x00050000)  // _ADR: Address
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32,
                            BMIE,   3,
                            Offset (0x18),
                            PRIB,   8,
                            SECB,   8,
                            SUBB,   8,
                            Offset (0x1E),
                                ,   13,
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                        {
                            Return (SECB)
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }
                    }

                    Device (DSB6)
                    {
                        Name (_ADR, 0x00060000)  // _ADR: Address
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32,
                            BMIE,   3,
                            Offset (0x18),
                            PRIB,   8,
                            SECB,   8,
                            SUBB,   8,
                            Offset (0x1E),
                                ,   13,
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                        {
                            Return (SECB)
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Device (DSB2)  // Intel JHL7540 Thunderbolt 3 Bridge (Titan Ridge 2C 2018) [8086:15e7]
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    AVND,   32,
                    BMIE,   3,
                    Offset (0x18),
                    PRIB,   8,
                    SECB,   8,
                    SUBB,   8,
                    Offset (0x1E),
                        ,   13,
                    MABT,   1
                }

                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                {
                    Return (Zero)
                }

//              Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
//              {
//                  Return (Package (0x02) {0x69, 0x03})
//              }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One) {0x03})
                    }

                    Local0 = Package (0x04)
                    {
                        "AAPL,slot-name",    Buffer (0x09) {"Built In"},
                    //  "built-in",          Buffer (0x01) {0x00},
                    //  "model",             Buffer (0x23) {"Intel JHL7540 Thunderbolt 3 Bridge"},
                    //  "name",              Buffer (0x0B) {"pci-bridge"},
                    //  "IOPCIHPType",       0x02,
                        "PCIHotplugCapable", 0x00
                    }
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

                Device (XHC2) // Intel JHL7540 Thunderbolt 3 USB Controller (Titan Ridge 2C 2018) [8086:15e9]
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                    Field (A1E0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   32,
                        BMIE,   3,
                        Offset (0x18),
                        PRIB,   8,
                        SECB,   8,
                        SUBB,   8,
                        Offset (0x1E),
                            ,   13,
                        MABT,   1
                    }

                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (Package (0x02) {0x69, 0x03})
                    }

                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One) {0x03})
                        }

                        Local0 = Package (0x0A)
                        {
                        //  "AAPL,slot-name",          Buffer (0x0C) {"Thunderbolt"},
                            "AAPL,slot-name",          Buffer (0x09) {"Built In"},
                            "AAPL,xhci-clock-id",      0x01,
                            "device_type",             Buffer (0x1B) {"Thunderbolt USB Controller"},
                        //  "IOPCIExpressCapabilites", 0x02,
                        //  "IOPCIHPType",             0x02,
                            "model",                   Buffer (0x2B) {"Intel JHL7540 Thunderbolt 3 USB Controller"},
                            "USBBusNumber",            0x00
                        }
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address

                        // According to the ACPI specification, we can define the USB port capabilities (_UPC)
                        // and physical location description (_PLD) objects. The use of both objects more precisely
                        // indicates the user's ability to connect devices to the port. Using only the _UPC object
                        // might not set the device container grouping correctly or as expected. Examples:
                        //
                        // Name(_UPC, Package (0x04) {
                        //     0xFF,   // Port is connectable
                        //     0x09,   // Connector type: Type C connector - USB2 and SS with Switch
                        //     Zero,   // Reserved 0, must be zero
                        //     Zero})  // Reserved 1, must be zero

                        Device (HS01)
                        {
                            Name (_ADR, 0x01)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0x00, 0x09, 0x00, 0x00
                            })
                        }

                        Device (HS02)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0x00, 0x09, 0x00, 0x00
                            })
                        }

                        Device (SS01)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 0x09, Zero, Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision           = 0x1,
                                    PLD_IgnoreColor        = 0x1,
                                    PLD_Red                = 0x0,
                                    PLD_Green              = 0x0,
                                    PLD_Blue               = 0x0,
                                    PLD_Width              = 0x0,
                                    PLD_Height             = 0x0,
                                    PLD_UserVisible        = 0x1,
                                    PLD_Dock               = 0x0,
                                    PLD_Lid                = 0x0,
                                    PLD_Panel              = "UNKNOWN",
                                    PLD_VerticalPosition   = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape              = "UNKNOWN",
                                    PLD_GroupOrientation   = 0x0,
                                    PLD_GroupToken         = 0x0,
                                    PLD_GroupPosition      = 0x0,
                                    PLD_Bay                = 0x0,
                                    PLD_Ejectable          = 0x0,
                                    PLD_EjectRequired      = 0x0,
                                    PLD_CabinetNumber      = 0x0,
                                    PLD_CardCageNumber     = 0x0,
                                    PLD_Reference          = 0x0,
                                    PLD_Rotation           = 0x0,
                                    PLD_Order              = 0x0,
                                    PLD_VerticalOffset     = 0x0,
                                    PLD_HorizontalOffset   = 0x0)
                            })
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One) {0x03})
                                }

                                Local0 = Package (0x04)
                                {
                                    "UsbCPortNumber", 0x02,
                                    "UsbPowerSource", 0x02
                                }
                                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                Return (Local0)
                            }
                        }

                        Device (SS02)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 0x09, Zero, Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision           = 0x1,
                                    PLD_IgnoreColor        = 0x1,
                                    PLD_Red                = 0x0,
                                    PLD_Green              = 0x0,
                                    PLD_Blue               = 0x0,
                                    PLD_Width              = 0x0,
                                    PLD_Height             = 0x0,
                                    PLD_UserVisible        = 0x1,
                                    PLD_Dock               = 0x0,
                                    PLD_Lid                = 0x0,
                                    PLD_Panel              = "UNKNOWN",
                                    PLD_VerticalPosition   = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape              = "UNKNOWN",
                                    PLD_GroupOrientation   = 0x0,
                                    PLD_GroupToken         = 0x0,
                                    PLD_GroupPosition      = 0x0,
                                    PLD_Bay                = 0x0,
                                    PLD_Ejectable          = 0x0,
                                    PLD_EjectRequired      = 0x0,
                                    PLD_CabinetNumber      = 0x0,
                                    PLD_CardCageNumber     = 0x0,
                                    PLD_Reference          = 0x0,
                                    PLD_Rotation           = 0x0,
                                    PLD_Order              = 0x0,
                                    PLD_VerticalOffset     = 0x0,
                                    PLD_HorizontalOffset   = 0x0)
                            })
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One) {0x03})
                                }

                                Local0 = Package (0x04)
                                {
                                    "UsbCPortNumber", 0x01,
                                    "UsbPowerSource", 0x02
                                }
                                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            Device (DSB3)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
            }

            Device (DSB4)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Name (_SUN, 0x05)  // _SUN: Slot User Number
            }
        }
    }
}

