#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/mint2g/mint2g-vendor.mk)

# Use the Dalvik VM specific for devices with 512 MB of RAM
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/mint2g/overlay

LOCAL_PATH := device/samsung/mint2g

# Init Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.sp8810.rc:root/init.sp8810.rc \
    $(LOCAL_PATH)/rootdir/init.sp8810.usb.rc:root/init.sp8810.usb.rc \
    $(LOCAL_PATH)/rootdir/fstab.sp8810:root/fstab.sp8810 \
    $(LOCAL_PATH)/rootdir/fstab.swap:root/fstab.swap \
    $(LOCAL_PATH)/rootdir/init.swap.rc:root/init.swap.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sp8810.rc:root/ueventd.sp8810.rc \
    $(LOCAL_PATH)/rootdir/bin/charge:root/bin/charge \
    $(LOCAL_PATH)/rootdir/modem_control:root/modem_control \
    $(LOCAL_PATH)/rootdir/bin/poweroff_alarm:root/bin/poweroff_alarm \
    $(LOCAL_PATH)/rootdir/bin/vcharged:root/bin/vcharged \
    $(LOCAL_PATH)/rootdir/bin/rawdatad:root/bin/rawdatad


# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf
    
# Idc
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Keylayout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/keylayout/sprd-keypad.kl:system/usr/keylayout/sprd-keypad.kl

# Media
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
     $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \

#Camera
PRODUCT_COPY_FILES += \
frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml


# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=180

#Wifi
PRODUCT_PACKAGES += \
	wpa_supplicant \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant.conf

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    tinymix \
    libtinyalsa
    

# Hw params
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/hw_params/audio_para:system/etc/audio_para \
     $(LOCAL_PATH)/hw_params/codec_pga.xml:system/etc/codec_pga.xml\
     $(LOCAL_PATH)/hw_params/tiny_hw.xml:system/etc/tiny_hw.xml

# Device props
PRODUCT_PROPERTY_OVERRIDES := \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=false \
	persist.sys.sprd.modemreset=0

# Board-Pecific
PRODUCT_PACKAGES += \
    	lights.sc8810 \
    	cpufreq-sc8810.ko \

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
 	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
 	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

# Misc packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory
    
# Samsung Service Mode
PRODUCT_PACKAGES += \
    SamsungServiceMode \
    Gallery2
    
# Web
PRODUCT_PACKAGES += \
    libskia_legacy

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false \
    wifi.interface=wlan0 \
    ro.zygote.disable_gl_preload=true \
    persist.msms.phone_count=2 \
    persist.radio.multisim.config=dsds \
    ro.telephony.call_ring.multiple=0 \
    dalvik.vm.heapgrowthlimit=46m \
    dalvik.vm.heapsize=92m \
    ro.telephony.call_ring=0 


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=adb,mtp \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    persist.service.adb.enable=1

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungMint2GRIL
    
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 240


# Prebuilt APPs
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/apps/app/OpenCamera/OpenCamera.apk:/system/app/OpenCamera/OpenCamera.apk \
#    $(LOCAL_PATH)/apps/priv-app/Launcher3/Launcher3.apk:system/priv-app/Launcher3/Launcher3.apk \
#    $(LOCAL_PATH)/apps/app/SimpleExplorer/SimpleExplorer.apk:system/app/SimpleExplorer/SimpleExplorer.apk 

#    $(LOCAL_PATH)/apps/app/Music/Music.apk:system/app/Music/Music.apk \

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-Xms=8m \
	dalvik.vm.dex2oat-Xmx=96m \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.dex2oat-filter=interpret-only \
	dalvik.vm.image-dex2oat-Xms=48m \
	dalvik.vm.image-dex2oat-Xmx=48m \
	dalvik.vm.image-dex2oat-filter=speed

#PRODUCT_PACKAGES := \
#	Music \
#	SlimFileManager \
#	FMRadio \
#	Camera2 \
#	LegacyCamera \
#	Terminal
#




