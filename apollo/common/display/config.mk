LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

# APEX Support
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
OVERRIDE_PRODUCT_COMPRESSED_APEX := false

# Display & Graphics (Mesa Panfrost / DRM HWC — prebuilt libraries)
PRODUCT_COPY_FILES += \
    $(LOCAL_MODULE_PATH)/init.display.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.display.rc

# Mesa3D prebuilt namespace
PRODUCT_SOONG_NAMESPACES += prebuilts/mesa/arm64


PRODUCT_PACKAGES += \
    libion \
    com.android.hardware.graphics.composer.drm_hwcomposer \
    android.hardware.graphics.allocator-service.minigbm \
    mapper.minigbm

# Mesa GLES + Gallium (Prebuilt)
PRODUCT_PACKAGES += \
    libEGL_mesa \
    libGLESv1_CM_mesa \
    libGLESv2_mesa \
    libgallium_dri

# Vulkan prebuilt
PRODUCT_PACKAGES += \
    vulkan.panfrost

# GBM prebuilt
PRODUCT_PACKAGES += \
    libgbm_mesa


PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.egl=mesa \
    ro.hardware.gralloc=minigbm \
    debug.sf.no_hw_vsync=1 \
    debug.renderengine.backend=skiaglthreaded \
    ro.surface_flinger.has_wide_color_display=false \
    ro.surface_flinger.has_HDR_display=false \
    ro.surface_flinger.use_color_management=false \
    ro.surface_flinger.use_context_priority=false \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    debug.sf.latch_unsignaled=0 \
    debug.sf.disable_backpressure=0 \
    debug.sf.log_frame_missed=0 \
    vendor.minigbm.debug=0 \
    service.sf.prime_shader_cache=0


PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=mesa \
    ro.hardware.vulkan=panfrost \
    ro.hardware.gralloc=minigbm \
    ro.hardware.hwcomposer=drm \
    ro.opengles.version=196610 \
    vendor.hwc.drm.device=/dev/dri/card0

