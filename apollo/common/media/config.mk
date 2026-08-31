LOCAL_MODULE_PATH := $(shell dirname $(lastword $(MAKEFILE_LIST)))

USE_XML_AUDIO_POLICY_CONF := 1

# Audio
PRODUCT_PACKAGES += \
    com.android.hardware.audio \
    android.hardware.audio.parameter_parser.example_service

# PRODUCT_COPY_FILES
$(call inherit-product, $(LOCAL_MODULE_PATH)/sounds/AudioPackage.mk)
$(call inherit-product, hardware/interfaces/audio/aidl/default/audio_effects.mk)
AUDIO_CONFIG_PATH := $(LOCAL_MODULE_PATH)/audio
PRODUCT_COPY_FILES += \
    $(AUDIO_CONFIG_PATH)/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(AUDIO_CONFIG_PATH)/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(AUDIO_CONFIG_PATH)/audio_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_mixer_paths.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# setting default audio output/input
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.output.active=AUDIO_CODEC,AUDIO_HDMI \
    vendor.audio.input.active=AUDIO_AC107

# V4L2 Hardware Codec2 Service
PRODUCT_SOONG_NAMESPACES += external/v4l2_codec2

PRODUCT_PACKAGES += \
    android.hardware.media.c2-service-v4l2 \
    libc2plugin_store

PRODUCT_PROPERTY_OVERRIDES += \
    media.c2.hal.selection=aidl \
    debug.c2.use_dmabufheaps=1 \
    debug.stagefright.c2-poolmask=458752 \
    debug.stagefright.c2inputsurface=-1 \
    ro.vendor.v4l2_codec2.decode_concurrent_instances=4 \
    ro.vendor.v4l2_codec2.encode_concurrent_instances=4

# Media Codecs Configuration
CODEC_CONFIG_PATH := $(LOCAL_MODULE_PATH)/codec
PRODUCT_COPY_FILES += \
    $(CODEC_CONFIG_PATH)/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(CODEC_CONFIG_PATH)/media_codecs_v4l2_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_v4l2_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    $(CODEC_CONFIG_PATH)/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_MODULE_PATH)/seccomp_policy/mediaswcodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaswcodec.policy \
    $(LOCAL_MODULE_PATH)/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_MODULE_PATH)/seccomp_policy/android.hardware.media.c2-extended-seccomp_policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/android.hardware.media.c2-extended-seccomp_policy
