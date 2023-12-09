# Required BIOS Settings

There are some basic requirements regarding the BIOS settings of this NUC in order to be able to boot correctly to macOS via the UEFI bootloader. Press F2 to enter BIOS Setup; press F9 to **load optimized defaults** then proceed to the following changes below, per section.

## :warning: Necessary and :white_check_mark: Advised Changes

**1. ADVANCED Section**
* In "Onboard Devices" panel → Set "Enhanced Consumer IR" to **Disabled**  :white_check_mark:
* In "Onboard Devices" panel → Confirm that "HDMI CEC Control" is **Disabled**  :white_check_mark:
* In "USB Ports" panel → Set both "USB Header Connector" ports to **Disabled**  :white_check_mark:
* In "Video Configuration" panel → Confirm that "IGD Minimum Memory" is set as **64 MB**  :warning:
* In "Video Configuration" panel → Confirm that "IGD Aperture Size" is set to **256 MB**  :warning:

**2. SECURITY Section**
* In "Security Features" panel → Set "Intel VT for Directed I/O (VT-d)" to **Disabled**  :warning:
* In "Security Features" panel → Set "Intel Platform Trust Technology" to **Disabled**  :white_check_mark:
* In "Security Features" panel → Set "Intel Software Guard Extensions (SGX)" to **Disabled**  :white_check_mark:
* In "Security Features" panel → Confirm that "Thunderbolt Security Level" to **"Legacy Mode"**  :warning:

**3. POWER Section**
* In "Secondary Power Settings" panel → Confirm that "Sleep Type Support" is set as **"Modern Standby"**  :warning:
* In "Secondary Power Settings" panel → Set "Wake on LAN from S4/S5" to **"Stay Off"**  :warning:
* In "Secondary Power Settings" panel → Set "Deep S4/S5" to **Enabled**  :warning:
* In "Secondary Power Settings" panel → Confirm that "PCIe ASPM Support" is **Enabled**  :white_check_mark:

**4. BOOT Section**
* In "Secure Boot" panel → Set "Secure Boot" to **Disabled**  :warning:
* In "Boot Priority" panel → Confirm that "UEFI Boot" is **Enabled**  :warning:
* In "Boot Priority" panel → Confirm that "Legacy Boot" is **Disabled**  :warning:
* In "Boot Priority" panel → Confirm that "Fast Boot" is **Disabled**  :warning:
* In "Boot Priority" panel → Set "Boot USB Devices First" to **Enabled**  :white_check_mark:
* In "Boot Priority" panel → Set "Optical Boot" to **Disabled**  :white_check_mark:
* In "Boot Priority" panel → Set "Network Boot" to **Disabled**  :white_check_mark:
* In "Boot Display Configuration" panel → Set "Display F7 to Update BIOS" to **Disabled**  :white_check_mark:

**Press F10 to save and exit.**

**Note:** [ASPM](https://en.wikipedia.org/wiki/Active_State_Power_Management) is a PCI Express enhancement; it allows for a device to go completely into an electrically "idle" state i.e. it will not send or receive electrical signals when entering this state. PCIe cards should always support ASPM and this should normally be handled by BIOS as the OS may _not_ always play an important part.

**Note:** Recent updates in macOS Monterey exhibit _native_ support for the integrated "SD Card 3.0 Controller", so there is no need to disable it anymore (ADVANCED Section → "Onboard Devices" panel).
