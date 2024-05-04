#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific fist.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from device makefile
$(call inherit-product, device/xiaomi/yunluo/device.mk)

# Inherit some common StatiXOS stuff.
$(call inherit-product, vendor/statix/config/common.mk)
DISABLE_COLUMBUS := true
ENABLE_GAMETOOLS := true
INCLUDE_PIXEL_LAUNCHER := true
TARGET_USES_BLUR := true

PRODUCT_NAME := statix_yunluo
PRODUCT_DEVICE := yunluo
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Pad

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="yunluo-user 12 SP1A.210812.016 V816.0.2.0.ULYMIXM release-keys"

BUILD_FINGERPRINT := Redmi/yunluo_global/yunluo:12/SP1A.210812.016/V816.0.2.0.ULYMIXM:user/release-keys
