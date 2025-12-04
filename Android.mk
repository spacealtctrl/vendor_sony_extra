LOCAL_PATH := $(call my-dir)

# Aurora Store
include $(CLEAR_VARS)
LOCAL_MODULE := AuroraStore
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRODUCT_MODULE := true
LOCAL_SRC_FILES := Aurora/AuroraStore.apk
LOCAL_ENFORCE_USES_LIBRARIES := false
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

# Sony Music - replaces Twelve
include $(CLEAR_VARS)
LOCAL_MODULE := SonyMusic
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRODUCT_MODULE := true
LOCAL_SRC_FILES := Music/music.apk
LOCAL_OVERRIDES_PACKAGES := Twelve Music Eleven
LOCAL_ENFORCE_USES_LIBRARIES := false
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

# PhotoPro - replaces Aperture
include $(CLEAR_VARS)
LOCAL_MODULE := PhotoPro
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRODUCT_MODULE := true
LOCAL_SRC_FILES := PhotoPro/PhotoPro.apk
LOCAL_OVERRIDES_PACKAGES := Aperture Snap Camera2
LOCAL_ENFORCE_USES_LIBRARIES := false
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

# Privapp Permissions
include $(CLEAR_VARS)
LOCAL_MODULE := privapp-permissions-sony-extra.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/permissions
LOCAL_SRC_FILES := permissions/privapp-permissions-sony-extra.xml
include $(BUILD_PREBUILT)

# Sysconfig
include $(CLEAR_VARS)
LOCAL_MODULE := sysconfig-sony-extra.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/sysconfig
LOCAL_SRC_FILES := permissions/sysconfig-sony-extra.xml
include $(BUILD_PREBUILT)

# Sony Permission Definition
include $(CLEAR_VARS)
LOCAL_MODULE := com.sonymobile.permission.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/permissions
LOCAL_SRC_FILES := permissions/com.sonymobile.permission.xml
include $(BUILD_PREBUILT)
