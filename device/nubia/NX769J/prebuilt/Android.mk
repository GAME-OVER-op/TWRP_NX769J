LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
    LOCAL_MODULE := magicos_prebuilt
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_CLASS := ETC
    LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)
    LOCAL_HOST_REQUIRED_MODULES := depmod
    LOCAL_POST_INSTALL_CMD += \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/vendor; \
        cp -rf $(LOCAL_PATH)/$(PRODUCT_RELEASE_NAME)/vendor $(TARGET_RECOVERY_ROOT_OUT)/; \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/system/lib64 $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64; \
        for lib in libapexsupport.so libvndksupport.so; do \
          if [ -f $(TARGET_OUT_SHARED_LIBRARIES)/$$lib ]; then cp -f $(TARGET_OUT_SHARED_LIBRARIES)/$$lib $(TARGET_RECOVERY_ROOT_OUT)/system/lib64/; fi; \
          if [ -f $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/$$lib ]; then cp -f $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/$$lib $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/; fi; \
        done; \
        echo "calling depmod on magicos_prebuilt"; \
        $(DEPMOD) -b $(TARGET_RECOVERY_ROOT_OUT)/vendor 1.1;
include $(BUILD_PHONY_PACKAGE)
