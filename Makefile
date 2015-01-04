PROJECT = notarianni

DEPS = lpad

dep_lpad = https://github.com/gar1t/lambdapad.git 

ERLC_OPTS = +debug_info

include erlang.mk

gen:
	bin/lpad-gen
