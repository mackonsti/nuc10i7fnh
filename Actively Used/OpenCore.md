## OpenCore Folder Structure

The EFI folder structure follows the required OpenCore structure with added files such as SSDTs, Kexts, Tools and additional [OpenCore Binary Data](https://github.com/acidanthera/OcBinaryData) such as those used in `Resources`.

```
📁 EFI
├── 📁 BOOT
│  └── 📃 BOOTx64.efi                      // ?
└── 📁 OC
    ├── 📁 ACPI
    │  ├── 📃 SSDT-APPLE.aml               // ?
    │  ├── 📃 SSDT-AWAC.aml                // ?
    │  ├── 📃 SSDT-DTGP.aml                // ?
    │  ├── 📃 SSDT-EC-USBX.aml             // ?
    │  ├── 📃 SSDT-HPTE.aml                // ?
    │  ├── 📃 SSDT-NAMES.aml               // ?
    │  ├── 📃 SSDT-PLUG.aml                // ?
    │  ├── 📃 SSDT-PMCR.aml                // ?
    │  ├── 📃 SSDT-SBUS.aml                // ?
    │  ├── 📃 SSDT-TITAN.aml               // ?
    │  └── 📃 SSDT-XOSI.aml                // ?
    │
    ├── 📁 Drivers
    │  ├── 📃 HfsPlus.efi                  //
    │  ├── 📃 OpenRuntime.efi              //
    │  ├── 📃 OpenCanopy.efi               //
    │  ├── 📃 AudioDxe.efi                 //
    │  ├── 📃 ResetNvramEntry.efi          //
    │  └── 📃 ToggleSipEntry.efi           //
    │
    ├── 📁 Kexts
    │  ├── 📃 Lilu.kext                    //
    │  ├── 📃 VirtualSMC.kext              // Required SMC Kext
    │  ├── 📃 SMCProcessor.kext            //
    │  ├── 📃 SMCSuperIO.kext              //
    │  ├── 📃 WhateverGreen.kext           // Graphics Kext
    │  ├── 📃 AppleALC.kext                // Audio Kext
    │  ├── 📃 IntelMausi.kext              // Intel Wired LAN Adapter Kext
    │  ├── 📃 USBPorts.kext                // USB Port Definition Kext
    │  ├── 📃 AirportItlwm.kext            // Intel Wireless Adapter Kext
    │  ├── 📃 BlueToolFixup.kext           //
    │  ├── 📃 IntelBluetoothFirmware.kext  //
    │  └── 📃 IntelBTPatcher.kext          //
    │
    ├── 📁 Resources
    │  ├── 📁 Audio                        // OpenCore Binary Data (Release)
    │  ├── 📁 Font                         // OpenCore Binary Data (Release)
    │  ├── 📁 Image                        // OpenCore Binary Data (Release)
    │  │  └── 📁 Acidanthera               // OpenCore Binary Data (Release)
    │  └── 📁 Label                        // OpenCore Binary Data (Release)
    │
    ├── 📁 Tools
    │  ├── 📃 OpenShell.efi                //
    │  └── 📃 VerifyMsrE2.efi              //
    │
    ├── 📃 config.plist                    // OpenCore Configuration (Intel NUC)
    └── 📃 OpenCore.efi                    // OpenCore Extensible Firmware Interface (Release)
```
