#
# Copyright (C) 2015 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_SHIPPING_API_LEVEL := 25

# Camera App
PRODUCT_PACKAGES += \
	Camera

PRODUCT_COPY_FILES += \
	device/nexell/cluster/init.cluster.rc:root/init.cluster.rc \
	device/nexell/cluster/init.cluster.usb.rc:root/init.cluster.usb.rc \
	device/nexell/cluster/fstab.cluster:root/fstab.cluster \
	device/nexell/cluster/ueventd.cluster.rc:root/ueventd.cluster.rc \
	device/nexell/cluster/init.recovery.cluster.rc:root/init.recovery.cluster.rc \
    device/nexell/cluster/busybox:system/bin/busybox \
    device/nexell/cluster/hwreg_cmd:system/bin/hwreg_cmd \
    device/nexell/cluster/memtester:system/bin/memtester \
    device/nexell/cluster/memtester:root/memtester

PRODUCT_COPY_FILES += \
    device/nexell/cluster/nx_3d_avm/nx_3d_avm:system/bin/nx_3d_avm/nx_3d_avm \
    device/nexell/cluster/nx_3d_avm/3DS/gtr3ds_complexed/GTR.3ds:system/bin/nx_3d_avm/3DS/gtr3ds_complexed/GTR.3ds \
    device/nexell/cluster/nx_3d_avm/3DS/gtr3ds_complexed/body.bmp:system/bin//nx_3d_avm/3DS/gtr3ds_complexed/body.bmp \
    device/nexell/cluster/nx_3d_avm/3DS/gtr3ds/GTR.3ds:system/bin//nx_3d_avm/3DS/gtr3ds/GTR.3ds \
    device/nexell/cluster/nx_3d_avm/3DS/gtr3ds/body.bmp:system/bin//nx_3d_avm/3DS/gtr3ds/body.bmp \
    device/nexell/cluster/nx_3d_avm/3DS/spot_light_256x256.BMP:system/bin//nx_3d_avm/3DS/spot_light_256x256.BMP \
    device/nexell/cluster/nx_3d_avm/avm/input_image/avm_full_data.yuv:system/bin//nx_3d_avm/avm/input_image/avm_full_data.yuv \
    device/nexell/cluster/nx_3d_avm/avm/avm_info_3dview.data:system/bin//nx_3d_avm/avm/avm_info_3dview.data \
    device/nexell/cluster/nx_3d_avm/avm/avm_info_topview.data:system/bin//nx_3d_avm/avm/avm_info_topview.data


PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# audio

PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	device/nexell/cluster/media_codecs.xml:system/etc/media_codecs.xml \
	device/nexell/cluster/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# input
PRODUCT_COPY_FILES += \
	device/nexell/cluster/gpio_keys.kl:system/usr/keylayout/gpio_keys.kl \
	device/nexell/cluster/gpio_keys.kcm:system/usr/keychars/gpio_keys.kcm

# hardware features
PRODUCT_COPY_FILES += \
	device/nexell/cluster/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml

# Recovery
PRODUCT_PACKAGES += \
	librecovery_updater_nexell

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_CONFIG += mdpi xlarge large
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi ldpi
PRODUCT_CHARACTERISTICS := tablet

# OpenGL ES API version: 2.0
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

# density
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160

# libion needed by gralloc, ogl
PRODUCT_PACKAGES += libion iontest

PRODUCT_PACKAGES += libdrm

# HAL
PRODUCT_PACKAGES += \
	gralloc.cluster \
	libGLES_mali \
	hwcomposer.cluster \
	audio.primary.cluster \
	memtrack.cluster \
	camera.cluster

PRODUCT_PACKAGES += fs_config_files

# omx
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libnx_video_api \
	libNX_OMX_VIDEO_DECODER \
	libNX_OMX_VIDEO_ENCODER \
	libNX_OMX_Base \
	libNX_OMX_Core \
	libNX_OMX_Common

# stagefright FFMPEG compnents
ifeq ($(EN_FFMPEG_AUDIO_DEC),true)
PRODUCT_PACKAGES += libNX_OMX_AUDIO_DECODER_FFMPEG
endif

ifeq ($(EN_FFMPEG_EXTRACTOR),true)
PRODUCT_PACKAGES += libNX_FFMpegExtractor
endif

DEVICE_PACKAGE_OVERLAYS := device/nexell/cluster/overlay

# increase dex2oat threads to improve booting time
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.boot-dex2oat-threads=4 \
	dalvik.vm.dex2oat-threads=4 \
	dalvik.vm.image-dex2oat-threads=4

#Enabling video for live effects
-include frameworks/base/data/videos/VideoPackage1.mk

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

# HWUI common settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

#skip boot jars check
SKIP_BOOT_JARS_CHECK := true

#bootanimation
PRODUCT_COPY_FILES += \
	device/nexell/cluster/bootanimation.zip:system/media/bootanimation.zip


$(call inherit-product, frameworks/base/data/fonts/fonts.mk)
