#
# Copyright (C) 2024 spacealtctrl
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    vendor/sony/extra

# Packages
PRODUCT_PACKAGES += \
    AuroraStore \
    SonyMusic \
    PhotoPro \
    privapp-permissions-sony-extra.xml \
    sysconfig-sony-extra.xml \
    com.sonymobile.permission.xml

# Override LineageOS camera and music
PRODUCT_PACKAGES += \
    PhotoPro \
    SonyMusic

# Properties
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.sony.camera=true
