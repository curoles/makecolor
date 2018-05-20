ifndef SPACE_AND_COMMA_INCLUDED
SPACE_AND_COMMA_INCLUDED = 1

comma:= ,
empty:=
space:= $(empty) $(empty)

space2comma = $(subst $(space),$(comma),$(strip $(1)))

endif
