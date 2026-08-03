LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

PRODUCT_COPY_FILES += \
    $(LOCAL_MODULE_PATH)/cfg-videoplayer.xml:system/etc/cfg-videoplayer.xml

# thermal
# Memtrack
# power
# usb
# health HAL provided by AOSP / LineageOS

