LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

PRODUCT_COPY_FILES += \
    $(LOCAL_MODULE_PATH)/cfg-videoplayer.xml:system/etc/cfg-videoplayer.xml \

#PRODUCT_COPY_FILES += \
#    $(PRODUCT_PREBUILT_PATH)/dist/sunxi-hci.ko:recovery/root/sunxi-hci.ko \
#    $(PRODUCT_PREBUILT_PATH)/dist/ehci-sunxi.ko:recovery/root/ehci-sunxi.ko \
#    $(PRODUCT_PREBUILT_PATH)/dist/ohci-sunxi.ko:recovery/root/ohci-sunxi.ko \
#    $(PRODUCT_PREBUILT_PATH)/dist/sunxi_usbc.ko:recovery/root/sunxi_usbc.ko \

# thermal
# Memtrack
# power
# usb
# health HAL provided by AOSP / LineageOS

