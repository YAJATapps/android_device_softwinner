-include device/softwinner/common/config/vendorcommand.mk
# image related
TARGET_NO_BOOTLOADER := true
# recovery related
TARGET_NO_RECOVERY := false

BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
# sepolicy
BOARD_SEPOLICY_DIRS += device/softwinner/common/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS := device/softwinner/common/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS := device/softwinner/common/sepolicy/private
