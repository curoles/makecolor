mkfile_dir  := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

ifneq (,$(findstring guile,$(.FEATURES)))
  $(guile (load "$(mkfile_dir)/../lib/lottery.scm"))
  $(guile (load "$(mkfile_dir)/../lib/serial_number.scm"))
else
  $(info Features: $(FEATURES))
  $(info To get make with Guile on Ubuntu: sudo apt-get install make-guile)
  $(error This make does not have support for embedded Guile)
endif

#https://blog.melski.net/2013/11/29/whats-new-in-gnu-make-4-0/

include $(mkfile_dir)/../lib/color_msg.makefile

.PHONY: test_lottery
test_lottery: nums = $(guile (lottery-numbers 10))
test_lottery: nums8 = $(guile (lottery-numbers 8))
test_lottery:
	@echo $(call green-msg2,"Testing ","lottery numbers generator...")
	@echo Lottery numbers [0..14]: $(guile (lottery-numbers 15))
	@echo Lottery numbers [0..9]: $(nums)
	@echo Lottery numbers [0..9]: $(nums)
	@echo Lottery [0..8]: $(foreach n,$(nums8),"\033[1;3$(n)m$(n)\033[0m")

.PHONY: test_serial_number
test_serial_number:
	@echo $(call green-msg2,"Testing ","serial numbers generator...")
	$(guile (define sn-generator (make-serial-number-generator)))
	$(eval n:=$(guile (sn-generator)))
	@echo Serial number: $(n)
	@test $(n) = 1
	$(eval n:=$(guile (sn-generator)))
	@echo Serial number: $(n)
	@test $(n) = 2
	@for i in 3 4 5; do echo "Serial number: $(guile (sn-generator)) = $$i"; done

