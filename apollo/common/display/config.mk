LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

# Display & Graphics (Mesa Panfrost / DRM HWC)
PRODUCT_COPY_FILES += \
    $(LOCAL_MODULE_PATH)/init.display.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.display.rc

# ION
PRODUCT_PACKAGES += \
    libion

# display - hdmi-cec
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.hdmi.keep_awake=false

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.hdmi.set_menu_language=1
