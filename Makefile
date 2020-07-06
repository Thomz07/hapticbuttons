INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HapticButtons

HapticButtons_FILES = Tweak.x
HapticButtons_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
