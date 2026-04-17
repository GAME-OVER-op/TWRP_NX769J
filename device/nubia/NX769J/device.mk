#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Helper for trees that place target product makefiles either in build/target or build/make/target.
define inherit-product-if-exists
$(if $(wildcard $(1)),$(call inherit-product,$(1)))
endef

$(call inherit-product-if-exists,build/make/target/product/base.mk)
$(call inherit-product-if-exists,build/target/product/base.mk)

$(call inherit-product-if-exists,build/make/target/product/core_64_bit_only.mk)
$(call inherit-product-if-exists,build/target/product/core_64_bit_only.mk)

$(call inherit-product-if-exists,build/make/target/product/virtual_ab_ota.mk)
$(call inherit-product-if-exists,build/target/product/virtual_ab_ota.mk)

$(call inherit-product-if-exists,build/make/target/product/virtual_ab_ota/compression.mk)
$(call inherit-product-if-exists,build/target/product/virtual_ab_ota/compression.mk)

$(call inherit-product-if-exists,build/make/target/product/emulated_storage.mk)
$(call inherit-product-if-exists,build/target/product/emulated_storage.mk)

# Stage02 patch06: vendor/twrp/config/common.mk is not present in this twrp-14.1 source layout.
# Bring-up continues without that include; TWRP flags stay in BoardConfig.mk.

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
