TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Musixmatch

THEOS_DEVICE_IP = 172.20.10.1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Musixmatch

Musixmatch_FILES = Tweak.x
Musixmatch_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
