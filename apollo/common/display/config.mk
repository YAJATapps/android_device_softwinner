LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

# Display & Graphics (Mesa Panfrost / DRM HWC)
PRODUCT_COPY_FILES += \
    $(LOCAL_MODULE_PATH)/init.display.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.display.rc

PRODUCT_PACKAGES += \
    libion \
    android.hardware.composer.hwc3-service.drm \
    android.hardware.graphics.allocator@4.0-service.minigbm \
    android.hardware.graphics.mapper@4.0-impl.minigbm \
    vulkan.pastel

# display - hdmi-cec
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hdmi.device_type=4 \
    debug.sf.no_hw_vsync=1 \
    debug.renderengine.backend=skiagl \
    ro.surface_flinger.has_wide_color_display=false \
    ro.surface_flinger.has_HDR_display=false \
    ro.surface_flinger.use_color_management=false \
    ro.surface_flinger.use_context_priority=false \
    ro.apex.updatable=false

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.hdmi.keep_awake=false

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.hdmi.set_menu_language=1

