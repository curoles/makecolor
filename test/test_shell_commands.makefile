mkfile_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(mkfile_dir)/../lib/color_msg.makefile
include $(mkfile_dir)/../lib/shell_commands.makefile

.PHONY: test_shell_commands
test_shell_commands: test_find_ext

.PHONY: test_find_ext
test_find_ext:
	@echo $(call green-msg2,"Testing ","shell_find_ext...")
	@echo $(call blue-msg,"Find files with extention .makefile")
	@echo $(call shell_find_ext,./,makefile)

