# Primary Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=

# Secondary Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# 64-bit app support
TARGET_SUPPORTS_64_BIT_APPS := true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote=zygote64_32

PRODUCT_PACKAGES += \
    init.zygote64.rc \
    init.zygote64_32.rc

