LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \

# Sensor hal 2.0
#PRODUCT_PACKAGES += android.hardware.sensors@2.0-service

#support alibaba remote control
PRODUCT_COPY_FILES += \
    $(LOCAL_MODULE_PATH)/alibaba_Keyboard.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/alibaba_Keyboard.kl
