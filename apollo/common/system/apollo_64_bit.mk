# Primary Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=



# 64-bit app support
TARGET_SUPPORTS_64_BIT_APPS := true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote=zygote64

PRODUCT_PACKAGES += \
    init.zygote64.rc

