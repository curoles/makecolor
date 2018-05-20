mkfile_dir  := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

ifneq (,$(findstring guile,$(.FEATURES)))
  $(guile (load "$(mkfile_dir)/../lib/lottery.scm"))
else
  $(info Features: $(FEATURES))
  $(info To get make with Guile on Ubuntu: sudo apt-get install make-guile)
  $(error This make does not have support for embedded Guile)
endif

#https://blog.melski.net/2013/11/29/whats-new-in-gnu-make-4-0/

include $(mkfile_dir)/../lib/color_msg.makefile

.PHONY: test_lotttery
test_lottery: nums = $(guile (lottery-numbers 10))
test_lottery: nums8 = $(guile (lottery-numbers 8))
test_lottery:
	@echo $(call green-msg2,"Testing ","lottery numbers generator...")
	@echo Lottery numbers [0..14]: $(guile (lottery-numbers 15))
	@echo Lottery numbers [0..9]: $(nums)
	@echo Lottery numbers [0..9]: $(nums)
	@echo Lottery [0..8]: $(foreach n,$(nums8),"\033[1;3$(n)m$(n)\033[0m")

