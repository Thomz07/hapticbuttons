ARCHS = arm64 arm64e

TARGET = iphone:clang::13.4

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HapticButtons

HapticButtons_FILES = Tweak.x
HapticButtons_CFLAGS = -fobjc-arc
HapticButtons_FRAMEWORKS = AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += hapticbuttonsprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
