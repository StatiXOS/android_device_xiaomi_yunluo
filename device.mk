#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
	boot \
	vendor_boot \
	system \
	system_ext \
	vendor \
    vendor_dlkm \
	product \
	vbmeta \
	vbmeta_system \
	vbmeta_vendor

PRODUCT_PACKAGES += \
	update_engine \
	update_engine_sideload \
	update_verifier \
	otapreopt_script \
	checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
	RUN_POSTINSTALL_system=true \
	POSTINSTALL_PATH_system=system/bin/otapreopt_script \
	FILESYSTEM_TYPE_system=$(BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE) \
	POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=$(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_vendor=true

# Boot animation
TARGET_SCREEN_HEIGHT := 2000
TARGET_SCREEN_WIDTH := 1200

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := gz
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Dalvik configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Allow userspace reboots
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Windows extensions
$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 31

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_CHARACTERISTICS := tablet

# Audio
$(call soong_config_set,android_hardware_audio,run_64bit,true)

PRODUCT_PACKAGES += \
	android.hardware.audio.service \
	android.hardware.audio@7.0-impl:64 \
	android.hardware.audio.effect@7.0-impl:64 \
	audioclient-types-aidl-cpp.vendor:64 \
	audio.bluetooth.default:64 \
	audio.usb.default:64 \
	libalsautils:64 \
	libopus.vendor:64 \
	libtinycompress:64 \
	libnbaio_mono:64 \
	libaudiofoundation.vendor:64

# Bluetooth
PRODUCT_PACKAGES += \
	android.hardware.bluetooth.audio-impl:64 \
	libbluetooth_audio_session:64 \
	android.hardware.bluetooth@1.0.vendor:64 \
	android.hardware.bluetooth@1.1.vendor:64

# Boot control HAL
PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

# Camera
PRODUCT_PACKAGES += \
	android.hardware.camera.common@1.0.vendor:64 \
	android.hardware.camera.device@1.0.vendor:64 \
	android.hardware.camera.device@3.2.vendor:64 \
	android.hardware.camera.device@3.3.vendor:64 \
	android.hardware.camera.device@3.4.vendor:64 \
	android.hardware.camera.device@3.5.vendor:64 \
	android.hardware.camera.device@3.6.vendor:64 \
	android.hardware.camera.provider@2.4.vendor:64 \
	android.hardware.camera.provider@2.5.vendor:64 \
	android.hardware.camera.provider@2.6.vendor:64 \

# Display
PRODUCT_PACKAGES += \
	android.hardware.graphics.composer@2.3-service \
	libhwc2on1adapter:64 \
	libhwc2onfbadapter:64 \
	libdrm.vendor:64

# DRM
PRODUCT_PACKAGES += \
	android.hardware.drm@1.0.vendor:64 \
	android.hardware.drm@1.1.vendor:64 \
	android.hardware.drm@1.2.vendor:64 \
	android.hardware.drm@1.3.vendor:64 \
	android.hardware.drm@1.4.vendor:64 \

# DRM (Clearkey)
PRODUCT_PACKAGES += \
	android.hardware.drm-service.clearkey

# FastbootD
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.1-impl-mock


# FM Radio
PRODUCT_PACKAGES += \
    FMRadio

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl:64 \
    android.hardware.gatekeeper@1.0-service

# Keymaster / Keymint
PRODUCT_PACKAGES += \
	libkeymaster_messages.vendor:64 \
	libkeymaster_portable.vendor:64 \
	libkeymint.vendor:64 \
	libpuresoftkeymasterdevice.vendor:64

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.mt6789 \
    android.hardware.health-service.mt6789-recovery \
    charger_res_images_vendor

# HIDL
PRODUCT_PACKAGES += \
	libhidltransport.vendor:64 \
	libhwbinder.vendor

# Lights
PRODUCT_PACKAGES += \
	android.hardware.light-service.xiaomi

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

# MediaCas
PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service-lazy

# Media (C2)
PRODUCT_PACKAGES += \
	android.hardware.media.c2@1.0.vendor:64 \
	android.hardware.media.c2@1.1.vendor:64 \
	android.hardware.media.c2@1.2.vendor:64 \
	libcodec2_hidl@1.2.vendor:64 \
	libcodec2_hidl_plugin:64 \
	libcodec2_vndk.vendor:64 \
	libcodec2_soft_common.vendor:64 \
	libeffects:64 \
    libeffectsconfig.vendor:64 \
	libsfplugin_ccodec_utils.vendor:64 \
	libavservices_minijail.vendor:64

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack-service.mediatek-mali

# Other common
PRODUCT_PACKAGES += \
	libflatbuffers-cpp.vendor:64 \
	libpcap.vendor:64 \
	libprotobuf-cpp-full.vendor:64 \
	libprotobuf-cpp-lite.vendor:64 \
	libruy.vendor:64 \
	libtextclassifier_hash.vendor:64 \
	libmemunreachable.vendor:64

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.xiaomi-libperfmgr

# Power configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Dummy mtkperf lib
PRODUCT_PACKAGES += \
    libmtkperf_client_vendor \
    libmtkperf_client \
    libpowerhalwrap_vendor

PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub

# Rebalance interrupts
PRODUCT_PACKAGES += \
    rebalance_interrupts-vendor.mediatek

# Sensors
PRODUCT_PACKAGES += \
	android.frameworks.sensorservice@1.0.vendor:64 \
	android.hardware.sensors-service.multihal \
	libsensorndkbridge:64

# Soundtrigger
PRODUCT_PACKAGES += \
	android.hardware.soundtrigger@2.3-impl:64

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.mediatek

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb-service.mediatek

# Enable audio accessory support
$(call soong_config_set,android_hardware_mediatek_usb,audio_accessory_supported,true)

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    wpa_supplicant \
    hostapd \
	libkeystore-wifi-hidl:64 \
    libkeystore-engine-wifi-hidl:64

# Permissions
PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore.xml \
    android.software.vulkan.deqp.level-2021-03-01.prebuilt.xml \
    android.software.opengles.deqp.level-2021-03-01.prebuilt.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.ar.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.ar.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
	frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
	frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
	frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Overlays
PRODUCT_PACKAGES += \
	FrameworksResOverlayYunluo \
    SettingsResOverlayYunluo \
    WifiResOverlayYunluo

# Init files
PRODUCT_PACKAGES += \
	init.insmod.sh \
	init.insmod.mtk.cfg \
	init.cgroup.rc \
	init.connectivity.rc \
	init.mi_thermald.rc \
	init.mt6789.rc \
	init.mt8781.rc \
	init.mt6789.usb.rc \
	init.mtkgki.rc \
	init.project.rc \
	init.sensor_2_0.rc \
	ueventd.mt6789.rc \
	fstab.mt6789 \
	fstab.mt8781 \
	fstab.mt8781.vendor_ramdisk \
	fstab.mt6789.vendor_ramdisk \
	init.recovery.usb.rc

# Audio Configuration
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Media
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Public libraries
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/misc/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Seccomp
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/seccomp/,$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy)

# Sensors MultiHAL config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Wifi configs
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
	hardware/mediatek \
	hardware/xiaomi

# Add vendor log tags
include $(LOCAL_PATH)/configs/props/vendor_log_tags.mk

# Inherit our proprietary vendor
$(call inherit-product, vendor/xiaomi/yunluo/yunluo-vendor.mk)
