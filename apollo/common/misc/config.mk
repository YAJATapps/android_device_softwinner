LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

PRODUCT_COPY_FILES += \
    $(LOCAL_MODULE_PATH)/cfg-videoplayer.xml:system/etc/cfg-videoplayer.xml

# thermal
# Memtrack
# power & lights HALs (Standard AOSP APEX / services)
PRODUCT_PACKAGES += \
    com.android.hardware.power \
    android.hardware.lights-service.example

# health HAL (AIDL batteryless for SBC)
PRODUCT_PACKAGES += \
    android.hardware.health-service.batteryless


