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

# Inherit from the AviumUI configuration.
# NOTE: vendor/avium/config/avium.mk is included by
# vendor/lineage/config/common.mk, which is reached through the
# common_full_phone.mk inherit below. The plain make variables set here are
# parsed before any inherited makefile is evaluated, so WITH_GMS and the
# AVIUM_* flags take effect correctly.
AVIUM_MAINTAINER ?= walkonbothsides
AVIUM_SETTINGS_SOC_MODEL_NAME ?= Snapdragon 8 Gen 3 for Galaxy
AVIUM_SETTINGS_DEVICE_CODENAME ?= e3q
# Enable avium fake-prop spoofing (ro.avium.status_fake_prop=1 + 35 spoofed
# props). NOTE: avium upstream feeds this flag through PRODUCT_SOONG_CONFIG_*,
# which this tree's build/make does NOT consume at all (grep -rn
# PRODUCT_SOONG_CONFIG build/ = 0 hits) -- the flag never reached Soong, so the
# #ifdef branch in system/core/init was compiled out. Re-export it through the
# real Soong config API so -DAVIUM_FORCE_SET_FAKE_PROP lands in init's cppflags
# (avium_init_defaults / soong_config_variables in system/core/init/Android.bp).
AVIUM_FORCE_SET_FAKE_PROP := true
$(call soong_config_set,AVIUM,AVIUM_FORCE_SET_FAKE_PROP,true)
WITH_GMS := true

# Inherit from the Lineage configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_e3q
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S928B
PRODUCT_MANUFACTURER := Samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung
