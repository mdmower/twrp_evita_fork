$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/evita/evita-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/evita/overlay

LOCAL_PATH := device/htc/evita
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/htc/evita/recovery/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    device/htc/evita/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/evita/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/evita/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/evita/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/evita/recovery/fstab.qcom:recovery/root/fstab.qcom

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_evita
PRODUCT_DEVICE := evita
