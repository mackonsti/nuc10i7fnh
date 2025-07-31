# OpenCore Changes History

The following changes (either additions or removals) are present in each configuration file per their respective OpenCore release:

## OpenCore v1.0.5 Update

* No changes required to configuration files, no keys were added or removed.

**Personal changes:**

* Disabled `SSDT-PLUG.aml` injection; explicitly adding `plugin-type = 1` in recent macOS is no longer necessary, as the `X86PlatformPlugin` driver is loaded by default since Monterey 12.3 (see [Dortania comment](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#enabling-x86platformplugin))
* Removed boot argument `igfxagdc=0` as it was found to delay monitor wake-up and did not contribute to anything useful
* Removed unnecessary, disabled arrays that delete `CpuPm` and `Cpu0Ist` tables, to simplify configuration file

## OpenCore v1.0.4 Update

* Booter → Quirks → added new required key: `ClearTaskSwitchBit` as "false" boolean

## OpenCore v1.0.2 Update

* UEFI → Unload → added new required (empty) array

**Personal changes:**

* Misc → Security → changed key `SecureBootModel` value to "Default" for finished installations
* Booter → Quirks → set key `FixupAppleEfiImages` to "true" (boolean) only if `SecureBootModel` is "Disabled"

## OpenCore v1.0.1 Update

* No changes required to configuration files, no keys were added or removed.

**Personal changes:**

* Booter → Quirks → changed key `ProtectUefiServices` value to "false" (boolean) after OpenCore manual study
* Kernel → Scheme → added and enabled `RestrictEvents.kext` to be able to also detect OS updates
* NVRAM → Add & Delete → brought back `4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14` section for compatibility
* NVRAM → Add & Delete → brought back `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` section for compatibility
* UEFI → Drivers → added and enabled driver `FirmwareSettingsEntry.efi` as option in Picker menu

## OpenCore v1.0.0 Update

* No changes required to configuration files since 0.9.7, no keys were added or removed.

## OpenCore v0.9.9 Update

* No changes required to configuration files since 0.9.7, no keys were added or removed.

## OpenCore v0.9.8 Update

* No changes required to configuration files, no keys were added or removed.

## OpenCore v0.9.7 Update

* Booter → Quirks → added new required key: `FixupAppleEfiImages` as "false" boolean

## OpenCore v0.9.5 Update

* UEFI → Quirks → added new required key: `ShimRetainProtocol` as "false" boolean

## OpenCore v0.9.4 Update

* Misc → BlessOverride → added new required key: `InstanceIdentifier` as empty string

## OpenCore v0.9.3 Update

* UEFI → Output → added new required key: `ConsoleFont` as empty string
* UEFI → ProtocolOverrides → added new required key: `PciIo` as "false" boolean

**Personal changes:**

* Switched to new **Western Digital Black SN750 NVMe Controller** for storage
* Kernel → Scheme → changed key `FuzzyMatch` value to "false" boolean
* NVRAM → Add → `4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14` → completely removed this non-applicable key
* NVRAM → Add → `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` → completely removed this non-applicable key
* NVRAM → Delete → `4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14` → completely removed this non-applicable key
* NVRAM → Delete → `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` → completely removed this non-applicable key

## OpenCore v0.9.2 Update

* Kernel → Quirks →  added new required key: `DisableIoMapperMapping` as "false" boolean
* UEFI → Output → added new required key: `InitialMode` as "Auto" string

## OpenCore v0.9.1 Update

* UEFI → Output → added new required key: `GopBurstMode` as "false" boolean

## OpenCore v0.8.9 Update

* UEFI → Quirks → added new required key: `ResizeUsePciRbIo` as "false" boolean

**Personal changes:**

* NVRAM → Add → `7C436110-AB2A-4BBB-A880-FE41995C9F82` → removed string `darkwake=0` from `boot-args` parameters

## OpenCore v0.8.8 Update

* Misc → Boot → added new required key `HibernateSkipsPicker` as "false" boolean

## OpenCore v0.8.6 Update

* UEFI → AppleInput → added new required key: `PointerDwellClickTimeout` default value to "0" integer
* UEFI → AppleInput → added new required key: `PointerDwellDoubleClickTimeout` default value to "0" integer
* UEFI → AppleInput → added new required key: `PointerDwellRadius` default value to "0" integer

## OpenCore v0.8.5 Update

* Kernel → Quirks → changed key `ExtendBTFeatureFlags` value to "false" boolean as it is not applicable to Monterey OS
* NVRAM → Add → `7C436110-AB2A-4BBB-A880-FE41995C9F82` → removed key `ForceDisplayRotationInEFI` per OC sample
* NVRAM → Delete → `7C436110-AB2A-4BBB-A880-FE41995C9F82` → removed string `ForceDisplayRotationInEFI` per OC sample

**Personal changes:**

* DeviceProperties → Add → `PciRoot(0x0)/Pci(0x1f,0x3)` → added audio `device-id` with value `0HoAAA==`
* DeviceProperties → Add → `PciRoot(0x0)/Pci(0x1f,0x3)` → changed audio `layout-id` value to "24" integer

## OpenCore v0.8.4 Update

* Misc → Tools → added new required key `FullNvramAccess` in all entries as "false" boolean
* NVRAM → added new required key: `LegacyEnable` as "false" boolean
* UEFI → Drivers → added new required key `LoadEarly` in all entries as "false" boolean

**Personal changes:**

* Kernel → Add → added and enabled new required kernel extension `IntelBTPatcher.kext`
* NVRAM → removed entries under `LegacySchema` as they are not referenced anywhere

## OpenCore v0.8.1 Update

* Misc → Security → removed obsolete key `AllowNvramReset`
* Misc → Security → removed obsolete key `AllowToggleSip`
* UEFI → Drivers → added new driver entry for `ResetNvramEntry.efi` as "Enabled" string
* UEFI → Drivers → added new driver entry for `ToggleSipEntry.efi` as "Enabled" string

**Personal changes:**

* DeviceProperties → Add → `PciRoot(0x0)/Pci(0x17,0x0)` → added SATA compatible device `pci8086,a352` as string
* Kernel → Quirks → changed key `AppleXcpmCfgLock` value to "true" boolean
* Kernel → Quirks → changed key `ExtendBTFeatureFlags` value to "true" boolean

## OpenCore v0.8.0 Update

* Kernel → Quirks → added new key: `CustomPciSerialDevice` as "false" boolean
* Kernel → Quirks → added new key: `ForceAquantiaEthernet` as "false" boolean
* Misc → Debug → removed obsolete key: `SerialInit`
* Misc → Serial → added new structure with keys `Init` and `Override` as "false" boolean

**Personal changes:**

* Disabled loading `SSDT-XOSI.aml` as well as patch to `Rename _OSI to XOSI (ACPI)` since there seems no real use for it.

## OpenCore v0.7.9 Update

* Kernel → Add → added new key: `Strategy` default value to "Disable" as string
* Misc → Debug → added new key: `LogModules` default value to "*" as string

**Personal changes:**

* DeviceProperties → Add → `PciRoot(0x0)/Pci(0x1d,0x5)/Pci(0x0,0x0)` → added SD Host model string for visual reference only
* Kernel → Add → replaced `IntelBluetoothInjector.kext` with `BlueToolFixup.kext` for macOS Monterey compatibility

## OpenCore v0.7.8 Update

A direct jump to this version, where some personal tweaks were added besides changes in OpenCore configuration keys:

* UEFI → AppleInput → added new key: `PointerPollMask` default value to "-1" integer
* UEFI → AppleInput → added new key: `PointerPollMin` default value to "10" integer
* UEFI → AppleInput → added new key: `PointerPollMax` default value to "80" integer
* UEFI → Audio → renamed key from `AudioOut` to `AudioOutMask` with default value to "1" integer
* UEFI → Audio → added new required key: `DisconnectHda` as "false" boolean
* UEFI → Audio → added new required key: `MaximumGain` default value to "-15" integer
* UEFI → Audio → added new required key: `MinimumAssistGain` default value to "-30" integer
* UEFI → Audio → added new required key: `MinimumAudibleGain` default value to "-55" integer
* UEFI → Audio → removed obsolete key: `MinimumVolume`
* UEFI → Audio → removed obsolete key: `VolumeAmplifier`
* UEFI → Drivers → added new driver entry for `AudioDxe.efi` as "Disabled" string

**Personal changes:**

* ACPI → Patch → changed method replacing `_STA` with `XSTA` for Device (H_EC) with improved byte matching
* DeviceProperties → `PciRoot(0x0)/Pci(0x2,0x0)` → removed `igfxfw` key as it doesn't serve any purpose
* DeviceProperties → `PciRoot(0x0)/Pci(0x17,0x0)` → added SATA model string for visual reference only
* DeviceProperties → `PciRoot(0x0)/Pci(0x1d,0x0)/Pci(0x0,0x0)` → added NVMe model string for visual reference only
* DeviceProperties → `PciRoot(0x0)/Pci(0x1f,0x3)` → converted type for key `layout-id` to integer
* Misc → Security → changed value for key `ScanPolicy` to integer "17760515" to comply with documentation
* NVRAM → Add → `7C436110-AB2A-4BBB-A880-FE41995C9F82` → changed `boot-args` parameters string to include `igfxagdc=0`

## OpenCore v0.7.6 Update

In this version, some minor aditions are reported, but none impacts this NUC hardware configuration:

* NVRAM → Add/Delete → removed both obsolete `UIScale` key and string
* UEFI → Output → added new required key: `ReconnectGraphicsOnConnect` as "false" boolean
* UEFI → Output → added new required key: `UIScale` default value to "0" integer
* UEFI → Quirks → added new required key: `EnableVmx` as "false" boolean

## OpenCore v0.7.5 Update

In this version, only a handful but very specific keys were added, not used in this NUC hardware configuration:

* Booter → Quirks → added new key: `ResizeAppleGpuBars` default value to "-1" integer
* UEFI → Quirks → added new key: `ResizeGpuBars` default value to "-1" integer

## OpenCore v0.7.4 Update

This new OpenCore update brings almost no changes to the configuration structure:

* UEFI → Drivers → changed structure: each driver has its own `Arguments`, `Comments`, `Enabled` switch and `Path`

**Personal changes:**

* Switched key `AllowToggleSip` to "true" boolean, allowing quick SIP control via picker menu (emergency configuration only)

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
