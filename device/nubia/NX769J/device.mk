#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure base.mk
$(call inherit-product, build/make/target/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, build/make/target/product/core_64_bit_only.mk)

# Configure Virtual A/B
$(call inherit-product, build/make/target/product/virtual_ab_ota.mk)

# Configure virtual_ab compression.mk
$(call inherit-product, build/make/target/product/virtual_ab_ota/compression.mk)

# Configure emulated_storage.mk
$(call inherit-product, build/make/target/product/emulated_storage.mk)

# Configure twrp common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# Stage02 patch02: keep the first 14.1 bring-up minimal.
# Crypto / bootctrl add-ons will be restored one by one after the base image builds.
# PRODUCT_PACKAGES += \
#     bootctrl.nubia_sm8650 \
#     android.hardware.boot@1.2-impl-qti

# SHIPPING API
PRODUCT_SHIPPING_API_LEVEL := 34

# VNDK API
PRODUCT_TARGET_VNDK_VERSION := 34

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Stage02 patch02: do not force extra prebuilt modules during the first 14.1 bring-up.
# TWRP_REQUIRED_MODULES += \
#     magicos_prebuilt
