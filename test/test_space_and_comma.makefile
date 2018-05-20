mkfile_dir  := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(mkfile_dir)/../lib/color_msg.makefile
include $(mkfile_dir)/../lib/space_and_comma.makefile

.PHONY: test_space_and_comma
test_space_and_comma: test_space2comma

.PHONY: test_space2comma
test_space2comma: array := "a b  c   d "
test_space2comma:
	@echo $(call green-msg2,"Testing ","space2comma...")
	@echo From: $(array)
	@echo To: $(call space2comma,$(array))
	test $(call space2comma,"a b  c   d") = "a,b,c,d"

