mkfile_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

TEST_LIST := test_lottery test_serial_number
TEST_LIST += test_space_and_comma test_shell_commands

.PHONY: test $(TEST_LIST)
test: $(TEST_LIST)
	@echo $(call Green-bold-msg,Tested targets:)
	@for i in $^; do echo "Target: $$i"; done

test_dir := $(mkfile_dir)
include $(test_dir)/test_lottery.makefile
include $(test_dir)/test_space_and_comma.makefile
include $(test_dir)/test_shell_commands.makefile

