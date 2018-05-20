ifndef SHELL_COMMANDS_INCLUDED
SHELL_COMMANDS_INCLUDED = 1

mkfile_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(mkfile_dir)/color_msg.makefile

shell_find_ext = $(shell find $(1) -type f -name '*.$(2)')

endif
