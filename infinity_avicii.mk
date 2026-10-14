#
# Copyright (C) 2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from avicii device
$(call inherit-product, device/oneplus/avicii/device.mk)

# Inherit some common Infinity-X stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Infinity-X Specific Flags
INFINITY_MAINTAINER := sreeshankark
INFINITY_BUILD_TYPE := OFFICIAL
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_BOOT_ANIMATION_RES := 1080
ifeq ($(WITH_GAPPS), true)
TARGET_BUILD_GOOGLE_TELEPHONY := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_EXCLUDES_VIA := true
endif

PRODUCT_NAME := infinity_avicii
PRODUCT_DEVICE := avicii
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := AC2003

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="Nord-user 12 RKQ1.211119.001 Q.202212051830:user release-keys" \
    BuildFingerprint=OnePlus/Nord/Nord:12/RKQ1.211119.001/Q.202212051830:user/release-keys \
    DeviceName=Nord \
    DeviceProduct=avicii \
    SystemName=Nord \
    SystemDevice=avicii
