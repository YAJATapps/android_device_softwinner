# Standard AOSP NL80211 Wireless Configuration

# 1. Standard Wi-Fi Configuration

# AOSP Wi-Fi Packages & HALs
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    libwifi-hal-uwe5622 \
    libwpa_client \
    wpa_supplicant \
    hostapd \
    wificond \
    uwe5622_bsp_sdio.ko \
    sprdwl_ng.ko \
    sprdbt_tty.ko


# AOSP Wi-Fi Permissions & Firmware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    device/softwinner/apollo/common/wireless/firmware/uwe5622/wcnmodem.bin:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/uwe5622/wcnmodem.bin \
    device/softwinner/apollo/common/wireless/firmware/uwe5622/wifi_2355b001_1ant.ini:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/uwe5622/wifi_2355b001_1ant.ini \
    device/softwinner/apollo/common/wireless/wifi_hal/uwe5622.xml:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/vendor_hals/uwe5622.xml \
    device/softwinner/apollo/common/wireless/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf



# Wi-Fi Properties
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.direct.interface=p2p-dev-wlan0 \
    wlan.driver.status=ok



# 2. Standard Bluetooth Configuration
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_CONFIG_DIR ?= device/softwinner/apollo/common/wireless/bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(BOARD_BLUETOOTH_CONFIG_DIR)

# AOSP Bluetooth Packages & HALs
PRODUCT_PACKAGES += \
    android.hardware.bluetooth-service.default

# AOSP Bluetooth Permissions & Init
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    device/softwinner/common/config/wireless/initrc/init.wireless.bluetooth.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.wireless.bluetooth.rc

# Bluetooth Properties
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.enable_timeout_ms=8000 \
    ro.bluetooth.ble_address_type=1 \
    persist.vendor.bluetooth_port=/dev/ttyS1 \
    vendor.ser.bt-uart=/dev/ttyBT0
