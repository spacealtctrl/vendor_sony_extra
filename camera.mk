# Copyright (C) 2024 XperiaLabs Project
# SPDX-License-Identifier: Apache-2.0

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    vendor/sony/extra

# Camera Apps
PRODUCT_PACKAGES += \
    PhotoPro \
    CinemaPro \
    VideoPro \
    CameraCommon \
    CameraPanorama \
    MovieCreator \
    SomcCameraApp \
    SomcCameraCalibration

# Permissions
PRODUCT_PACKAGES += \
    privapp-permissions-sony-camera.xml

# Framework Libraries
PRODUCT_PACKAGES += \
    com.sonymobile.album.xml \
    com.sonymobile.album \
    com.google.protobuf-2.3.0.xml \
    com.google.protobuf-2.3.0