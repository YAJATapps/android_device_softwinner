LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

# APEX Support
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
OVERRIDE_PRODUCT_COMPRESSED_APEX := false

# Display & Graphics (Mesa Panfrost / DRM HWC — prebuilt libraries)
PRODUCT_COPY_FILES += \
    $(LOCAL_MODULE_PATH)/init.display.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.display.rc

PRODUCT_PACKAGES += \
    libion \
    com.android.hardware.graphics.composer.drm_hwcomposer_upstream \
    android.hardware.graphics.allocator-service.minigbm_upstream \
    mapper.minigbm_upstream


# ==============================================================================
# Core System Graphics Properties
# ==============================================================================
PRODUCT_PROPERTY_OVERRIDES += \
    debug.renderengine.backend=skiaglthreaded \
    debug.hwui.renderer=skiagl

# ==============================================================================
# Vendor Device Nodes & Core HAL Properties
# ==============================================================================
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.hwcomposer=drm \
    ro.hardware.egl=mesa \
    ro.hardware.gralloc=minigbm \
    vendor.minigbm.generic_backend=gbm_mesa \
    ro.opengles.version=196609 \
    vendor.hwc.drm.device=/dev/dri/card0 \
    vendor.minigbm.device=/dev/dri/renderD128 \
    ro.vendor.hwc.drm.avoid_using_alpha_bits_for_framebuffer=true \
    ro.vendor.hwc.drm.disable_planes=true


