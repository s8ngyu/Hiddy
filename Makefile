include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Hiddy
Hiddy_FILES = Tweak.xm
Hiddy_EXTRA_FRAMEWORKS += Cephei
Hiddy_LIBRARIES = sparkapplist

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += Prefs

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
