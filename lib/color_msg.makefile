ifndef COLOR_MSG_INCLUDED
COLOR_MSG_INCLUDED = 1

mkfile_dir  := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(mkfile_dir)/terminal_ansi_colors.makefile

green-msg      = $(call color-str,$(Gre),$(1))
green-bold-msg = $(call color-str,$(BGre),$(1))
Green-msg      = $(call color-str,$(IGre),$(1))
Green-bold-msg = $(call color-str,$(BIGre),$(1))

red-msg      = $(call color-str,$(Red),$(1))
red-bold-msg = $(call color-str,$(BRed),$(1))
Red-msg      = $(call color-str,$(IRed),$(1))
Red-bold-msg = $(call color-str,$(BIRed),$(1))

blue-msg      = $(call color-str,$(Blu),$(1))
blue-bold-msg = $(call color-str,$(BBlu),$(1))
Blue-msg      = $(call color-str,$(IBlu),$(1))
Blue-bold-msg = $(call color-str,$(BIBlu),$(1))

yel-msg      = $(call color-str,$(Yel),$(1))
yel-bold-msg = $(call color-str,$(BYel),$(1))
Yel-msg      = $(call color-str,$(IYel),$(1))
Yel-bold-msg = $(call color-str,$(BIYel),$(1))

red-msg2    = $(call Red-bold-msg,$(1))$(call Red-msg,$(2))
yellow-msg2 = $(call Yel-bold-msg,$(1))$(call yel-msg,$(2))
green-msg2  = $(call Green-bold-msg,$(1))$(call Green-msg,$(2))
blue-msg2   = $(call Blue-bold-msg,$(1))$(call Blue-msg,$(2))

endif
