#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/samsung/sm8650-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/e3q

# Assert
TARGET_OTA_ASSERT_DEVICE := e3q

# Display
TARGET_SCREEN_DENSITY := 600

# Kernel
BOARD_USES_SOONG_KERNEL := true
SOONG_KERNEL_MODULE := //device/samsung/e3q:kernel
TARGET_KERNEL_VERSION := 6.1


# Kernel Modules
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat device/samsung/e3q/modules.load.recovery))
BOARD_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat device/samsung/e3q/modules.load.recovery))
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)


# Vendor props
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Device-specific wakeup source labels.
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Include the proprietary files BoardConfig.
include vendor/samsung/e3q/BoardConfigVendor.mk
