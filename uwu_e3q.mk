#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/samsung/e3q/device.mk)

WITH_GMS := true

# EPPE off: FlipFlap / SoundBoosterStage / libsamsungSoundbooster_plus are
# LineageOS-only and absent from this tree; uwu EPPE (vendor/uwu/config/common.mk:144)
# would hard-fail Kati on them.
TARGET_DISABLE_EPPE := true

# Inherit from the uwu configuration.
UWU_DEVICE_TYPE := phone
UWU_SUPPORTS_TELEPHONY := true
UWU_MAINTAINER := walkonbothsides
$(call inherit-product, vendor/uwu/config/common.mk)

PRODUCT_NAME := uwu_e3q
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S9280
# Match the stock firmware's case-sensitive manufacturer value.
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung
