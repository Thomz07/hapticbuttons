include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HapticButtonsPrefs

HapticButtonsPrefs_FILES = HAPRootListController.m
HapticButtonsPrefs_INSTALL_PATH = /Library/PreferenceBundles
HapticButtonsPrefs_FRAMEWORKS = UIKit
HapticButtonsPrefs_PRIVATE_FRAMEWORKS = Preferences
HapticButtonsPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/HapticButtonsPrefs.plist$(ECHO_END)
