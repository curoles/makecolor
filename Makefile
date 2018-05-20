#include terminal_ansi_colors.makefile
#include color_msg.makefile
#include shell_commands.makefile
#include space_and_comma.makefile
#
#define this-show-colors
#  @echo $(call color-str,$(BIGre),bold intense green)
#  @echo $(call green-msg,"green")
#  @echo $(call green-bold-msg,"bold green")
#  @echo $(call Green-msg,"intense green")
#  @echo $(call Green-bold-msg,"bold intense green")
#  @echo $(call Red-bold-msg,"bold intense red")
#  @echo $(call red-msg2,"error ","message")
#  @echo $(call yellow-msg2,"warning ","message")
#  @echo $(call green-msg2,"info ","message")
#  @echo $(call blue-msg2,"note ","message")
#endef
#

# test target
include test/test.makefile
