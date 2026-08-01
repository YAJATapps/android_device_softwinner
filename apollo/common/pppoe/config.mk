LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

# PPPoE (disabled for LineageOS)
# PRODUCT_COPY_FILES += \
#     $(LOCAL_MODULE_PATH)/android.software.pppoe.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.pppoe.xml \
#     $(LOCAL_MODULE_PATH)/pppoe.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/pppoe.rc

# PRODUCT_PACKAGES += \
#     pppoe \
#     libpppoe-jni \
#     pppoe-service
