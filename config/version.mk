# Copyright (C) 2019 aosep ROM
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

#Extended Versioning
aosep_VERSION = v1.0

ifndef aosep_BUILD_TYPE
    aosep_BUILD_TYPE := UNOFFICIAL
endif

ifeq ($(aosep_BUILD_TYPE), OFFICIAL)

# aosepOTA
#$(call inherit-product-if-exists, vendor/aosep/config/ota.mk)

endif

TARGET_PRODUCT_SHORT := $(subst aosep_,,$(CUSTOM_BUILD))

aosep_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
aosep_MOD_VERSION := aosep-$(aosep_VERSION)-$(aosep_BUILD_DATE)-$(aosep_BUILD_TYPE)
aosep_FINGERPRINT := aosep/$(aosep_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(aosep_BUILD_DATE)


PRODUCT_GENERIC_PROPERTIES += \
  ro.aosep.version=$(aosep_VERSION) \
  ro.aosep.releasetype=$(aosep_BUILD_TYPE) \
  ro.modversion=$(aosep_MOD_VERSION)

aosep_DISPLAY_VERSION := aosep-$ (aosep_VERSION)-$(aosep_BUILD_TYPE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.aosep.display.version=$(aosep_DISPLAY_VERSION) \
  ro.aosep.fingerprint=$(aosep_FINGERPRINT)
