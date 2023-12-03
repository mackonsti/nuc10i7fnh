/*
 * The High Precision Event Timer (HPET) is a hardware timer (formerly Multimedia Timer) and
 * has been used in computers for a long time. It is used to produce periodic interrupts, which
 * can be used to synchronize multimedia streams, in turn, providing smoother playback. It also
 * reduces the need for other time-stamp calculations.
 *
 * The presence of HPET may cause performance drop in certain situations. In earlier days, when
 * CPUs had less clock speed and games did not use multi-threading in an efficient way, the use
 * of HPET to retrieve incremental time-stamp counter took away precious calculation power of
 * the CPUs and significantly hurt gaming performance.
 *
 * The problem has arisen because of a very slow timer interpretation of the HPET on today's
 * high-performance rigs. The impact of slow HPET depends on actual usage of the timer functions
 * in the game engine and the hardware used. The HPET 'bug' could cause stutters in game-play
 * if runing a not-graphics-heavy game or application on an overpowered GPU.
 *
 * Some people report latency improvement with HPET disabled, but HPET may be required on older
 * software and computers. For some it helps, others it hurts performance and most users do not
 * notice anything at all.
 *
 * The code below sets HPTE in ACPI to Zero, thus disabling natively Device (HPET) in the firmware.
 */

DefinitionBlock ("SSDT-HPTE.aml", "SSDT", 2, "OC", "HPTE", 0x00000000)
{
    External (HPTE, IntObj)

    Scope (\_SB)
    {
        If (_OSI ("Darwin"))
        {
            HPTE = Zero
        }
    }
}

