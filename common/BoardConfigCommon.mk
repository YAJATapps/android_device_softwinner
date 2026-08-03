-include device/softwinner/common/config/vendorcommand.mk
# image related
TARGET_NO_BOOTLOADER := true
# recovery related
TARGET_NO_RECOVERY := false
TARGET_RECOVERY_FSTAB := device/softwinner/apollo/common/storage/fstab.sun50iw9p1
BOARD_RECOVERY_IMAGE_PREPARE := mkdir -p $(PRODUCT_OUT)/recovery/root/system/etc && cp -f $(TARGET_RECOVERY_FSTAB) $(PRODUCT_OUT)/recovery/root/system/etc/recovery.fstab && cp -f $(TARGET_RECOVERY_FSTAB) $(PRODUCT_OUT)/recovery/root/fstab.sun50iw9p1 && cp -f device/softwinner/apollo/common/system/ueventd.sun50iw9p1.rc $(PRODUCT_OUT)/recovery/root/ueventd.rc && cp -f device/softwinner/apollo/common/system/init.recovery.sun50iw9p1.rc $(PRODUCT_OUT)/recovery/root/init.recovery.sun50iw9p1.rc

BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
# sepolicy
BOARD_SEPOLICY_DIRS += device/softwinner/common/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS := device/softwinner/common/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS := device/softwinner/common/sepolicy/private
