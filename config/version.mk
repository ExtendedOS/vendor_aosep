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
AOSEP_VERSION = v1.0

ifndef AOSEP_BUILD_TYPE
    AOSEP_BUILD_TYPE := UNOFFICIAL
endif

ifeq ($(AOSEP_BUILD_TYPE), OFFICIAL)

# aosepOTA
#$(call inherit-product-if-exists, vendor/aosep/config/ota.mk)

endif

TARGET_PRODUCT_SHORT := $(subst aosep_,,$(CUSTOM_BUILD))

AOSEP_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
AOSEP_MOD_VERSION := aosep-$(AOSEP_VERSION)-$(AOSEP_BUILD_DATE)-$(AOSEP_BUILD_TYPE)
AOSEP_FINGERPRINT := aosep/$(AOSEP_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(AOSEP_BUILD_DATE)


PRODUCT_GENERIC_PROPERTIES += \
  ro.aosep.version=$(AOSEP_VERSION) \
  ro.aosep.releasetype=$(AOSEP_BUILD_TYPE) \
  ro.modversion=$(AOSEP_MOD_VERSION)

AOSEP_DISPLAY_VERSION := aosep-$ (AOSEP_VERSION)-$(AOSEP_BUILD_TYPE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.aosep.display.version=$(AOSEP_DISPLAY_VERSION) \
  ro.aosep.fingerprint=$(AOSEP_FINGERPRINT)
