# Preset TARGET_USES_HARDWARE_QCOM_BOOTCTRL for existing platforms.
ifneq ($(filter msm8953 msm8996 msm8998 msmnile sdm660 sdm710 sdm845,$(TARGET_BOARD_PLATFORM)),)
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true
endif

ifeq ($(strip $(TARGET_USES_HARDWARE_QCOM_BOOTCTRL)),true)
# TODO:  Find a better way to separate build configs for ADP vs non-ADP devices
ifneq ($(BOARD_IS_AUTOMOTIVE),true)
LOCAL_PATH := $(call my-dir)

# HAL Shared library for the target. Used by libhardware.
include $(CLEAR_VARS)
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/gpt-utils/inc
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog libgptutils libcutils
LOCAL_HEADER_LIBRARIES := libhardware_headers libsystem_headers
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE_PATH_64 := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := bootctrl.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_OWNER := qcom
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Static library for the target. Used by update_engine_sideload from recovery.
include $(CLEAR_VARS)
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/gpt-utils/inc
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog libgptutils libcutils
LOCAL_HEADER_LIBRARIES := libhardware_headers libsystem_headers
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE_PATH_64 := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := bootctrl.$(TARGET_BOARD_PLATFORM)
include $(BUILD_STATIC_LIBRARY)

endif
endif