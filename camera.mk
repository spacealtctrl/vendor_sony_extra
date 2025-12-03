#
# Copyright (C) 2023 XperiaLabs Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    vendor/sony/extra

# Camera
PRODUCT_PACKAGES += \
    PhotoPro \
    CinemaPro \
    VideoPro \
    CameraCommon \
    CameraAddonPermission \
    CameraCommonPermission \
    CameraPanorama \
    MovieCreator \
    CameraApp \
    CameraCalibration

# Camera Permissions
PRODUCT_PACKAGES += \
    privapp-permissions-product-sony.xml \
    privapp-permissions-system-sony.xml \
    privapp-permissions-systemext-sony.xml

# Framework Libraries
PRODUCT_PACKAGES += \
    com.sonymobile.album.xml \
    com.sonymobile.album \
    com.sonymobile.album.internal \
    com.sonyericsson.colorextraction.xml \
    com.sonyericsson.colorextraction_impl \
    com.sonymobile.mmwdiapi.somc-mmwdiapi.xml \
    somc-ext-mmwdiapi \
    com.google.protobuf-2.3.0.xml \
    com.google.protobuf-2.3.0-dummy \
    com.sonyericsson.idd.xml \
    com.sonyericsson.idd_impl \
    com.sonymobile.home.resourceprovider.xml \
    com.sonymobile.home.resourceprovider \
    com.sonymobile.extmonitorapp.xml
