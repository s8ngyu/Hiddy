include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HiddyPrefs
HiddyPrefs_FILES = HDYRootListController.m
HiddyPrefs_INSTALL_PATH = /Library/PreferenceBundles
HiddyPrefs_FRAMEWORKS = UIKit
HiddyPrefs_PRIVATE_FRAMEWORKS = Preferences
HiddyPrefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/HiddyPrefs.plist$(ECHO_END)
