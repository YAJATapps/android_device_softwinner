LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

-include vendor/aw/public/package/rro/rro.mk

# overlay
DEVICE_PACKAGE_OVERLAYS := \
    $(LOCAL_MODULE_PATH)/overlay \
    $(LOCAL_MODULE_PATH)/overlay_rro \
    $(DEVICE_PACKAGE_OVERLAYS)

ifeq ($(CONFIG_LOW_RAM_DEVICE),true)
    ifeq ($(CONFIG_LOW_RAM_2GB_DEVICE),true)
        DEVICE_PACKAGE_OVERLAYS := $(LOCAL_MODULE_PATH)/overlay_go_2gb \
                                   $(DEVICE_PACKAGE_OVERLAYS)
    else
        DEVICE_PACKAGE_OVERLAYS := $(LOCAL_MODULE_PATH)/overlay_go \
                                   $(DEVICE_PACKAGE_OVERLAYS)
    endif # ifeq ($(CONFIG_LOW_RAM_2GB_DEVICE),true))
endif

# TV overlay
ifneq (,$(filter tv,$(PRODUCT_CHARACTERISTICS)))
    DEVICE_PACKAGE_OVERLAYS := \
        $(LOCAL_MODULE_PATH)/overlay_tv \
        $(DEVICE_PACKAGE_OVERLAYS)
endif

# Car / Automotive overlay
ifneq (,$(filter automotive car,$(PRODUCT_CHARACTERISTICS)))
    PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_MODULE_PATH)/overlay_car
endif

# DEVICE_OVERLAYS is special device overlay dirs. maybe not set.
DEVICE_PACKAGE_OVERLAYS := \
    $(DEVICE_OVERLAYS) \
    $(DEVICE_PACKAGE_OVERLAYS)

# Lineage SDK overlay
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_MODULE_PATH)/lineage-sdk

PRODUCT_ENFORCE_RRO_TARGETS := framework-res

