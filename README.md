# Intel NUC Model NUC10i7FNH

This repository contains personal work and files, developed and maintained for a successful use with [OpenCore EFI bootloader](https://github.com/acidanthera/OpenCorePkg) on this specific Intel NUC model. There are **no** ready, pre-packaged EFI solutions provided; instead, the needed configuration and ACPI files are published for those interested in studying the code, while creating their own bootloader configurations.

## Platform Generation

* Sandy Bridge = All Core ix-3xxx (HD Graphics 3000)
* Ivy Bridge = All Core ix-3xxx (HD Graphics 4000)
* Haswell = All Core ix-4xxx (HD Graphics 4600)
* Broadwell = All Core ix-5xxx (Iris Pro Graphics 6200)
* Skylake = All Core ix-6xxx (HD Graphics 5xx)
* Kaby Lake = All Core ix-7xxx (UHD/Iris Plus Graphics 6xx)
* Coffee Lake = All Core ix-8xxx (UHD/Iris Plus Graphics 6xx)
* Whiskey Lake = Low-power Coffee Lake processors (mainly Mobile)
* Coffee Lake Refresh = All Core ix-9xxx (UHD Graphics 6xx)
* **Comet Lake = All Core ix-10xxx (UHD Graphics 6xx)**

## Generation Details: Frost Canyon (2019)

**Specifications:**<br/>
https://ark.intel.com/content/www/us/en/ark/products/188811/intel-nuc-10-performance-kit-nuc10i7fnh.html

**Downloads:**<br/>
https://downloadcenter.intel.com/product/188811/Intel-NUC-10-Performance-kit-NUC10i7FNH

**BIOS Recovery & Update Instructions:**<br/>
https://www.intel.com/content/www/us/en/support/articles/000033291/mini-pcs.html

**BIOS Troubleshooting Issues:**<br/>
https://www.intel.com/content/www/us/en/support/articles/000005964/mini-pcs.html

## Generation Details: Frost Canyon (2019)

**CPU:** Intel Core i7-10710U @ 1.10 GHz up to 4.70 GHz / 6 Cores / 12 Threads

**GPU:** Intel UHD 630 Graphics / 300 MHz up to 1.15 GHz / 32 GB Video Memory

**URL:** https://www.intel.com/content/www/us/en/products/processors/core/i7-processors/i7-10710u.html

## Geekbench

**V4 Scores:** https://browser.geekbench.com/v4/cpu/search?q=Core+i7-10710U

**V5 Scores:** https://browser.geekbench.com/v5/cpu/search?q=Core+i7-10710U

## Product Overview

![FrontPanel.jpg](Various/FrontPanel.jpg)

![RearPanel.jpg](Various/RearPanel.jpg)

## Compatible Models

Mac Model: **Macmini8,1**<br/>
CPU: i7-8700B @ 3.20 GHz up to 4.60 GHz / 6 Cores / 12 Threads<br/>
GPU: Intel UHD Graphics 630<br/>
Everymac: https://everymac.com/ultimate-mac-lookup/?search_keywords=Macmini8,1<br/>
Board ID: 7BA5B2DFE22DDD8C<br/>
BIOS Revision: MM81.88Z.F000.B00.1809171422<br/>
BIOS Revision: MM81.88Z.F000.B00.1907261958<br/>
BIOS Revision: MM81.88Z.F000.B00.2001052107<br/>
BIOS Revision: MM81.88Z.F000.B00.2005132145<br/>
BIOS Revision: MM81.88Z.F000.B00.2101062036<br/>

## Current Setup

**Memory:** 16GB in 2 x 8GB SO-DIMM (1.2V)<br/>
**RAM:** Kingston HyperX "Impact" DDR4 @ 2666MHz CL15 (Model HX426S15IB2K2/16)<br/>
**WLAN:** Intel Dual-Band Wi-Fi 6 AX201 (Embedded Module) [[8086:02f0]](http://pci-ids.ucw.cz/read/PC/8086/02f0) (Subsystem ID 0x0074)<br/>
**BTLE:** Intel Bluetooth 5.1 (Embedded Module) [8087:0026]<br/>
**NVMe:** Samsung EVO 970 NVMe M.2 1TB (Model MZ-V7E1T0BW) [[144d:a808]](https://pci-ids.ucw.cz/read/PC/144d/a808)<br/>
**SSD:** TBC<br/>
**Thunderbolt:** Intel JHL7540 Thunderbolt 3 Bridge (Titan Ridge 2C 2018) [[8086:15e7]](https://pci-ids.ucw.cz/read/PC/8086/15e7)<br/>
**Intel Product Compatibility Tool:** https://compatibleproducts.intel.com/ProductDetails?EPMID=188811<br/>

## Wireless Connectivity

The embedded 802.11ax wireless [AX201](https://ark.intel.com/content/www/us/en/ark/products/130293/intel-wi-fi-6-ax201-gig.html) chipset [8086:02f0] has been working without issues with [itlwm](https://github.com/OpenIntelWireless/itlwm) since Catalina. As for the embedded BTLE module, Intel reports it being a Bluetooth 5.1 device, which works in most cases with [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware) since Catalina, too.

Both devices can be enabled in BIOS, and both drivers can be loaded through OpenCore.

## OpenCore Picker Keyboard Shortcuts

When the `Timeout` key is set and OpenCore Picker displays the available boot drives:

* Press **Space Bar** to access the hidden _Auxiliary_ tools such as UEFI Shell, NVRAM Cleanup, Verify MSR Lock etc.
* Press **Tab** to move selection to the newly available Reboot and Shutdown icons (since OpenCore 0.6.8).

Alternatively, if `ShowPicker` is disabled or `Timeout` set to 0, keep pressing **Escape** or **Zero** or **Option** keys to access Picker just before OpenCore kicks-in and starts booting.

## Required BIOS Settings

For the most basic but _required_ BIOS settings, as well as previous firmware releases, see [BIOS](BIOS/) folder.

## Active Configuration

* Faking CPU ID is **absolutely** required, power management is native; MSR `0xE2` can be unlocked; :warning:
* External USB 3.1 ports work as expected; using generated `USBPorts.kext`;
* Internal USB 2.0 headers not used; they are disabled in BIOS;
* External USB-C ports **TBC**;
* Intel graphics acceleration works as platform ID `0x3E9B0007` with [WhateverGreen](https://github.com/acidanthera/whatevergreen/releases);
* Analogue audio output works as layout ID `0x17` with [AppleALC](https://github.com/acidanthera/AppleALC/releases/);
* Digital audio output does **not** work yet;
* Embedded Intel LAN interface works with [IntelMausi](https://github.com/acidanthera/IntelMausi/releases);
* Embedded Intel WLAN module works with [OpenIntelWireless](https://github.com/OpenIntelWireless/itlwm/releases);
* Embedded Intel BTLE module detected with [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases);
* CPU fan readings work with `ec-device` as `Intel_EC_V9` with [VirtualSMC](https://github.com/acidanthera/VirtualSMC/releases);
* Integrated SDXC Card reader is not compatible; it is disabled in BIOS;
* Sleep/Wake both work without issues; see "Power" section in [Hackintool](https://github.com/headkaze/Hackintool/releases);
* Both NVMe and SSD SATA interfaces work with no effort nor kext needed.

For the complete list of all detected PCI hardware components and their respective addresses via `lspci -nn` command (in Ubuntu, loaded via USB) see [here](Various/lspci-nn.txt). This list was created with all devices enabled in BIOS and is used as a device "map" so that PCI IDs can be detected before tweaking the hardware (and BIOS) to run macOS.

![Peripherals](Various/Peripherals.png)

## Intel UHD Graphics 630 Properties

The `AAPL,ig-platform-id` property set to `0x3E9B0007` is used for **WhateverGreen** to successfully enable acceleration on this graphics device [[8086:9bca]](http://pci-ids.ucw.cz/read/PC/8086/9bca). This ID represents the following properties and connectors:

| Properties             | Value(s)                             |
| ---------------------- | ------------------------------------ |
| Platform ID            | 0x3E9B0007 → `07009B3E`              |
| Device ID              | 0x3E9B0000 → `9B3E0000`              |
| Mobile                 | No                                   |
| Stolen Memory          | 57 MB                                |
| Framebuffer Memory     | 0 MB                                 |
| Video Memory (VRAM)    | 1536 MB                              |
| Total Stolen Memory    | 58 MB                                |
| Total Cursor Memory    | 1 MB                                 |
| Maximum Stolen Memory  | 172 MB                               |
| Maximum Overall Memory | 173 MB                               |
| Model name             | Intel UHD Graphics 630               |
| Camellia               | CamelliaDisabled (0)                 |
| Connector Count        | 3                                    |
| Pipe / Port #1         | Bus ID `0x05` Pipe `9`  Connector DP |
| Pipe / Port #2         | Bus ID `0x04` Pipe `10` Connector DP |
| Pipe / Port #3         | Bus ID `0x06` Pipe `8`  Connector DP |

Read more at [Intel® HD Graphics FAQs](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md) on the **WhateverGreen** repository.

## Changes Brought About by macOS 11

An analysis of all the novelties that *Big Sur* brings are detailed over at [Dortania](https://dortania.github.io/hackintosh/updates/2020/11/12/bigsur-new.html).

## USB Port Mapping on NUC Chassis

| USB 2.0 Port Name | USB 3.0 Port Name | Hardware Location    | Controller     |
| ----------------- | ----------------- | -------------------- | -------------- |
| HS01              | SS01              | Rear TOP socket      | Primary XHCI   |
| HS02              | SS02              | Rear BOTTOM socket   | Primary XHCI   |
| HS03              | SS03              | Front RIGHT socket   | Primary XHCI   |
| HS04              | SS04              | Front USB-C socket   | Primary XHCI   |
| HS07              | N/A               | Internal USB-C alias | Primary XHCI   |
| HS10              | N/A               | Internal BTLE port   | Primary XHCI   |
| N/A               | SS01              | Rear USB-C socket    | Secondary XHCI |

The above active and working USB ports are listed in Hackintool when the two *internal* (USB 2.0) headers and **Consumer IR** are all _disabled_ in [BIOS](BIOS/) and when **all unused or non-referenced USB ports** are removed. In any other situation, ports such as HS05, HS06, HS07, HS08, HS09, USR1, USR2, SS05 and SS06 may be listed. All ports above are defined in `USBPorts.kext` according to their _electrical_ connector.

**N.B.** Following some testing with external devices, it is believed that HS07 serves as the USB 2.0 alias for the rear USB-C (Thunderbolt XHCI) socket.

![USBPorts.png](Various/USBPorts.png)

## CPU Fan Reading Support

Support for the NUC's embedded chipset **ITE IT5571** has been added in [VirtualSMC](https://github.com/acidanthera/VirtualSMC/releases) (and more specifically `SMCSuperIO.kext`) since version 1.2.2 thanks to its developers. This is achieved by injecting the needed property `<key>ec-device</key>` and the correct identifier that corresponds to the NUC's model/generation own **LPC Controller** device (see [here](https://github.com/acidanthera/VirtualSMC/blob/master/Docs/EmbeddedControllers.md)). For this NUC, the value is `<string>Intel_EC_V9</string>` thus enabling CPU fan readings in any monitoring tool.

![BigSur](Various/BigSur.png)

![AmorphousDiskMark](Various/AmorphousDiskMark.png)

![PowerGadget](Various/PowerGadget.png)
