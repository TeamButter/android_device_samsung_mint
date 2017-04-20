# Samsung Galaxy Star
Device Tree for Samsung Galaxy Star AOKP LP 5.0.2

## Note 
* This tree is incomplete ,but it should make a booting ROM
* To make the device appear in lunch menu you should go to vendor/aokp/vendorsetup.sh
* To not get "not found .zip required by bootanimation.zip" error go to vendor/aokp/configs/common.mk 
and add "TARGET_BOOTANIMATION_NAME :=320" 
after "$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))"

## How to build AOKP-LP (or any other ROMs) for Samsung Galaxy Star
* You must first have a Build Environment ready to build android, and a clone of **AOKP LP** ready to be built.
* Get the following repos and put them in mentioned path 
	* Device Tree - This repository. Clone this repository in device/samsung/**mint2g**.
	* Kernel Source - (https://github.com/TeamButter/android_kernel_samsung_mint). Clone -Cm-12.1- tree in kernel/samsung/**mint2g**.
	* Vendor Blobs - (https://github.com/TeamButter/android_vendor_samsung_mint). Clone -slimlp- tree in vendor/samsung/**mint2g**.
* Apply the following patches -
	* MR0_AUDIO_BLOB patch - https://gist.github.com/Alonso1398/5d9dbb0f0eb5cc9cf25a
	* AudioFlinger hack to load old HAL - https://gist.github.com/Flex1911/79969e4bfe06cf91b647
	* Patch to get microphone working - https://gist.github.com/Alonso1398/9eede1c631c2a88ec2fc
	* RIL patch to use proper sockets - https://github.com/ngoquang2708/android_frameworks_opt_telephony/commit/76463f444f0df104df83d2b7d179362d79ba4fe6
	* Dual SIM fix - https://github.com/ngoquang2708/android_system_core/commit/97d9f4f83710e4983c80d38097e2cfb19cd50e4c
	* Bionic patch to suppress 'text relocations' logcat spam (optional) - https://github.com/Agontuk/ste_patches/blob/cm-12.1/bionic/001_avoid_logcat_spam.patch
	* Fix rotation artifacts (apply only the marked portion of the full patch) - https://gist.github.com/pawitp/88a1d4514a0734c866c7#file-frameworks_native-patch-L78-L102
* Open terminal in the source folder (of aokp) and type -
  * `source build/envsetup.sh`
  * `brunch mint2g`
  
#### Note
* If you are going to use this tree to build other ROMs, you might need to modify certain *.mk files based on ROM guidelines. You may see any device tree which can build that ROM, use that tree as reference and accordingly adapt the tree.

### Happy Building!!

## Credits (no specific order)
* Flex1911
* Alonso1398
* pawitp
* Agontuk and other people who worked on Sony STE Hardware
* halfpsych
* ngoquang2708
* koquantam
* wakaber
* Corphish
* LehKeda
