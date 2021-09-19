# OpenCore Changes History

The following changes (either additions or removals) are present in each configuration file per the respective OpenCore release:

## OpenCore v0.7.3 Update

Moving directly to this new version has required the following small changes:

* UEFI → AppleInput → added new key: `GraphicsInputMirroring` as "true" boolean
* UEFI → Drivers → changed structure: each driver has its own `Path`, `Arguments` and `Enabled` switch
* UEFI → Quirks → added new key: `ForceOcWriteFlash` as "false" boolean

## OpenCore v0.7.1 Update

The transition to this new version brought minimal changes:

* ACPI → Quirks → added new key: `SyncTableIds` as "false" boolean
* Kernel → Scheme → added new key: `CustomKernel` as "false" boolean

**Personal changes:**

* Added boot argument `msgbuf=1048576` increasing the [kernel message buffer size](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/kernel-debugging.html#config-plist-setup) for improved debugging during boot

## OpenCore v0.7.0 Update

Some more new keys were added again:

* Kernel → Quirks → added new key: `ProvideCurrentCpuInfo` as "false" boolean
* Misc → Security → added new key: `AllowToggleSip` as "false" boolean
* Misc → Tools → added the required key `Flavour` in all **tool** entries as "Auto" string
* NVRAM → Add → `7C436110-AB2A-4BBB-A880-FE41995C9F82` key: included `ForceDisplayRotationInEFI` parameter
* NVRAM → Delete → `7C436110-AB2A-4BBB-A880-FE41995C9F82` key: included `ForceDisplayRotationInEFI` parameter
* PlatformInfo → Generic: renamed key from `AdviseWindows` to `AdviseFeatures` per requirement
* UEFI → Output → changed key: `GopPassThrough` type from boolean to string as "Disabled"
* UEFI → ProtocolOverrides → added new key: `AppleEg2Info` as "false" boolean

**Personal changes:**

* ACPI → Delete → included two samples of drop tables such as `CpuPm` and `Cpu0Ist` for possible later use
* DeviceProperties → `PciRoot(0x0)/Pci(0x14,0x3)` → added new section: Intel WLAN with keys `AAPL,slot-name`, `device_type`, `model`, `name` etc.
* Kernel → Add → changed order of some kexts, placing `USBPorts.kext` before AirportItlwm and IntelBluetooth kexts

## OpenCore v0.6.9 Update

A handful of updates with new keys added:

* UEFI → AppleInput → changed key: `CustomDelays` type to boolean as "false"
* UEFI → AppleInput → updated key: `KeyInitialDelay` default value to "50" integer
* UEFI → Quirks → added new key: `EnableVectorAcceleration` as "false" boolean
* UEFI → Quirks → added new key: `ForgeUefiSupport` as "false" boolean
* UEFI → Quirks → added new key: `ReloadOptionRoms` as "false" boolean

**Personal changes:**

* Kernel → Add → removed completely kext `AirportItlwm_Catalina.kext` reference
* Kernel → Add → renamed kext `AirportItlwm_BigSur.kext` to `AirportItlwm.kext`
* Kernel → Quirks → changed value: `PowerTimeoutKernelPanic` to "false" boolean
* Misc → Tools → disabled entry: `ControlMsrE2.efi` as this does not work from Picker
* UEFI → Audio → set value of key: `AudioDevice` to audio device `PciRoot(0x0)/Pci(0x1f,0x3)`

## OpenCore v0.6.8 Update

This version of OpenCore brought again just a handful of new keys that were added with their _default_ values in the following sections:

* ACPI → Patch → updated all entries with the new `Base` and `BaseSkip` keys per OpenCore sample configuration
* Booter → MmioWhitelist → added new key: `ForceBooterSignature` as "false" boolean
* UEFI → AppleInput → added this completely new section with default values from OpenCore sample configuration
* UEFI → ProtocolOverrides → removed obsolete key: `AppleEvent` (was "false" boolean)

Moreover, the following changes were performed in this configuration file:

* ACPI → Add → introduced an SSDT entry for `SSDT-GPRW.aml` whilst keeping it **disabled** for now
* ACPI → Add → introduced an SSDT entry for `SSDT-XOSI.aml` and **enabled** it (needed by the Patch below)
* ACPI → Patch → made the rename patch `_DSM` to `XDSM` system-wide by removing `TableSignature` restriction
* ACPI → Patch → added new rename patch `_OSI` to `XOSI` system-wide to be used with `SSDT-XOSI.aml` above
* ACPI → Patch → added new rename patch `GPRW` to `XPRW` system-wide but **disabled** it just like `SSDT-GPRW.aml` above
* ACPI → Patch → added new rename patch `SAT0` to `SATA` system-wide just for aesthetic reasons in IORegistry
* DeviceProperties → `PciRoot(0x0)/Pci(0x2,0x0)` → added new key: `AAPL,GfxYTile` with default value `AQAAAA==`
* DeviceProperties → `PciRoot(0x0)/Pci(0x2,0x0)` → added new key: `igfxfw` with default value `AgAAAA==`
* DeviceProperties → `PciRoot(0x0)/Pci(0x1f,0x0)` → added new section for SMC reading via `ec-device` key as "Intel_EC_V9" string
* DeviceProperties → `PciRoot(0x0)/Pci(0x1f,0x3)` → added new key: `hda-gfx` as "onboard-1" string
* Kernel → Add → enabled `SMCSuperIO.kext` as it is now supported (see added **DeviceProperties** section above)
* Misc → Tools → added an additional `ResetSystem.efi` tool entry as a "Cold Reset" action
* Misc → Tools → removed `CFGLock.efi` tool and replaced it with the official `ControlMsrE2.efi` tool

## OpenCore v0.6.7 Update

This version of OpenCore brought just a handful of new keys that were added with their _default_ values in the following sections:

* UEFI → Audio → added new key: `ResetTrafficClass` as "false" boolean
* UEFI → Input → removed obsolete key: `KeyMergeThreshold` (had "2" as integer)
* UEFI → Output → added new key: `GopPassThrough` as "false" boolean
* UEFI → Quirks → added new key: `ActivateHpetSupport` as "false" boolean

**Personal changes:**

* For normal booting, keys `PanicNoKextDump`, `AppleDebug`, `ApplePanic`, `AllowNvramReset` and `AllowSetDefault` have all been disabled.

## OpenCore v0.6.6 Update

This version of OpenCore brought some new keys that were added with their _default_ values in the following sections:

* Kernel → Quirks → added new key: `SetApfsTrimTimeout` with value "-1" as integer
* Misc → Boot → added new key: `LauncherOption` as "Disabled" string
* Misc → Boot → added new key: `LauncherPath` as "Default" string
* Misc → Security → removed obsolete key: `BootProtect` (had "None" as string)
* PlatformInfo → Generic → added new key: `MaxBIOSVersion` as "false" boolean
* PlatformInfo → added new key: `UseRawUuidEncoding` as "false" boolean
* UEFI → Drivers → changed key: Replaced string "HFSPlus.efi" with "OpenHfsPlus.efi"
* UEFI → Quirks → added new key: `DisableSecurityPolicy` as "false" boolean

**Personal changes:**

* Kernel → Block → added array entry: `com.apple.driver.AppleTyMCEDriver` as a _disabled_ template

## OpenCore v0.6.5 Update

This version of OpenCore brought some new keys that were added with their _default_ values in the following sections:

* Misc → Boot → added new key: `PickerVariant` as "Auto" string
* Misc → Tools → added new key to each array entry: `RealPath` as "false" boolean
* Misc → Tools → added new key to each array entry: `TextMode` as "false" boolean
* UEFI → Audio → changed key type: `PlayChime` to "Auto" string (was "false" boolean)
* UEFI → Audio → added new key: `SetupDelay` with value "0" as integer
* UEFI → Quirks → removed obsolete key: `DeduplicateBootOrder` (had "true" as boolean)

**Personal changes:**

* DeviceProperties → Add → changed `PciRoot(0x0)/Pci(0x2,0x0)` key value: `device-id` to `mz4AAA==` (was `kj4AAA==`)
* DeviceProperties → Add → removed `PciRoot(0x0)/Pci(0x2,0x0)` key: `framebuffer-patch-enable` (was `AQAAAA==`)
* Kernel → Add → changed key value in each **kext** entry: `KernelArch` to "Any" string (was "x86_64" string)
* Kernel → Force → changed key value in each array entry: `KernelArch` to "Any" string (was "x86_64" string)
* Kernel → Scheme → changed key value: `KernelArch` to "Auto" string (was "x86_64" string)

## OpenCore v0.6.4 Update

This version of OpenCore brought very few new keys that were added with their _default_ values in the following sections:

* Booter → Patch → added entry with empty `<array/>` as placeholder
* Booter → Quirks → added new key: `AllowRelocationBlock` as "false" boolean
* Misc → Security → added new key: `BlacklistAppleUpdate` as "true" boolean
* NVRAM → Delete → removed strings from key: `7C436110-AB2A-4BBB-A880-FE41995C9F82` to match sample configuration
* NVRAM → LegacySchema → added strings in key: `7C436110-AB2A-4BBB-A880-FE41995C9F82` to match sample configuration

**No personal changes.**

## OpenCore v0.6.3 Update

This version of OpenCore brought very few new keys that were added with their _default_ values in the following sections:

* Kernel → Force → added new array entry: `com.apple.iokit.IONetworkingFamily` as a _disabled_ template
* Kernel → Quirks → added new key: `ForceSecureBootScheme` as "false" boolean
* Misc → Tools → added new tool entry: `CFGLock.efi` as "Set MSR Lock" label
* PlatformInfo → added new key: `CustomMemory` as "false" boolean
* UEFI → Output → added new key: `ForceResolution` as "false" boolean

## OpenCore v0.6.2 Update

**No changes logged.**
