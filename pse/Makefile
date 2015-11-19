pse := $(PSEHOME)
rnc := $(pse)/bin/pse_rnc
tgc := $(pse)/bin/pse_tgc
wlc := $(pse)/bin/pse_wlc
lib := $(pse)/lib
lib_dir := $(pse)/lib
LDFLAGS := -L$(lib_dir) -lRNS `pth-config --ldflags` `pth-config --libs` -lm
override includes += -I$(pse)/include
override CFLAGS += $(includes) -g -Winline -Wshadow `pth-config --cflags`

sim: TG_software.c custom/sso_scheduler.c custom/memory_functions.c io_mem_access.c experiment_three_app.c experiment_three_eo1.c experiment_four_app.c experiment_four_eo1.c experiment_two_app.c experiment_two_eo1.c experiment_two_eo2.c experiment_one_app.c experiment_one_eo1.c experiment_one_eo2.c experiment_one_eo3.c packet_input_submodel.c packet_process_submodel.c packet_output_submodel.c RN_hardware.c blade_submodel.c WL_workload.c $(lib)/rnc_runtime.o $(pse)/include/rnc_runtime.h $(lib_dir)/libRNS.a
	gcc $(CFLAGS) -o sim \
	custom/memory_functions.c \
	custom/sso_scheduler.c \
	io_mem_access.c \
	experiment_one_eo1.c \
	experiment_one_eo2.c \
	experiment_one_eo3.c \
	experiment_one_app.c \
	experiment_two_app.c \
	experiment_two_eo1.c \
	experiment_two_eo2.c \
	experiment_three_app.c \
	experiment_three_eo1.c \
	experiment_four_app.c \
	experiment_four_eo1.c \
	packet_input_submodel.c \
	packet_process_submodel.c \
	packet_output_submodel.c \
	TG_software.c \
	blade_submodel.c \
	RN_hardware.c \
	WL_workload.c \
	$(pse)/lib/rnc_runtime.o \
	$(LDFLAGS)

SOFTWARE_APPS	:=	swap_mac	packet_forward \
			experiment_one	experiment_two

SOFTWARE_MODELS	:=	packet_input	packet_process \
			packet_output	io_mem_access

swap_mac_parts		:=	app	eo1
swap_mac_hardware	:=	blade

packet_forward_parts 	:=	app	eo1	eo2
packet_forward_hardware :=	blade

experiment_one_parts	:=	app	eo1	eo2	eo3
experiment_one_hardware	:=	blade

################################################################################
# HARDWARE MODELS ##############################################################
################################################################################
blade_submodel.c blade_submodel.h: hardware/blade.rn $(rnc)
	$(rnc) hardware/blade.rn blade_submodel.h blade_submodel.c

RN_hardware.c RN_hardware.h: hardware.rn $(rnc)
	$(rnc) hardware.rn RN_hardware.h RN_hardware.c

################################################################################
# SOFTWARE MODELS ##############################################################
################################################################################
packet_input_submodel.c packet_input_submodel.h: software/packet_input.tg $(tgc) blade_submodel.h
	$(tgc) software/packet_input.tg packet_input_submodel.h packet_input_submodel.c -frame BLADE blade_submodel.h

io_mem_access.c io_mem_access.h: software/memory/io_mem_access.tg $(tgc) RN_hardware.h blade_submodel.h
	$(tgc) software/memory/io_mem_access.tg io_mem_access.h io_mem_access.c -frame BLADE blade_submodel.h

# experiment_one app
experiment_one_eo1.c experiment_one_eo1.h: software/experiment_one/eo1.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_one/eo1.tg experiment_one_eo1.h experiment_one_eo1.c -frame BLADE blade_submodel.h

experiment_one_eo2.c experiment_one_eo2.h: software/experiment_one/eo2.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_one/eo2.tg experiment_one_eo2.h experiment_one_eo2.c -frame BLADE blade_submodel.h

experiment_one_eo3.c experiment_one_eo3.h: software/experiment_one/eo3.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_one/eo3.tg experiment_one_eo3.h experiment_one_eo3.c -frame BLADE blade_submodel.h

experiment_one_app.c experiment_one_app.h: software/experiment_one/app.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_one/app.tg experiment_one_app.h experiment_one_app.c -frame BLADE blade_submodel.h

# experiment_two app
experiment_two_eo1.c experiment_two_eo1.h: software/experiment_two/eo1.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_two/eo1.tg experiment_two_eo1.h experiment_two_eo1.c -frame BLADE blade_submodel.h

experiment_two_eo2.c experiment_two_eo2.h: software/experiment_two/eo2.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_two/eo2.tg experiment_two_eo2.h experiment_two_eo2.c -frame BLADE blade_submodel.h

experiment_two_app.c experiment_two_app.h: software/experiment_two/app.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_two/app.tg experiment_two_app.h experiment_two_app.c -frame BLADE blade_submodel.h

# experiment_three app
experiment_three_eo1.c experiment_three_eo1.h: software/experiment_three/eo1.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_three/eo1.tg experiment_three_eo1.h experiment_three_eo1.c -frame BLADE blade_submodel.h

experiment_three_app.c experiment_three_app.h: software/experiment_three/app.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_three/app.tg experiment_three_app.h experiment_three_app.c -frame BLADE blade_submodel.h

# experiment_four app
experiment_four_eo1.c experiment_four_eo1.h: software/experiment_four/eo1.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_four/eo1.tg experiment_four_eo1.h experiment_four_eo1.c -frame BLADE blade_submodel.h

experiment_four_app.c experiment_four_app.h: software/experiment_four/app.tg $(tgc) blade_submodel.h
	$(tgc) software/experiment_four/app.tg experiment_four_app.h experiment_four_app.c -frame BLADE blade_submodel.h

# swap_mac app
swap_mac_eo1.c swap_mac_eo1.h: software/swap_mac/eo1.tg $(tgc) blade_submodel.h
	$(tgc) software/swap_mac/eo1.tg swap_mac_eo1.h swap_mac_eo1.c -frame BLADE blade_submodel.h

swap_mac_app.c swap_mac_app.h: software/swap_mac/app.tg $(tgc) blade_submodel.h
	$(tgc) software/swap_mac/app.tg swap_mac_app.h swap_mac_app.c -frame BLADE blade_submodel.h

# packet_forward app
packet_forward_eo1.c packet_forward_eo1.h: software/packet_forward/eo1.tg $(tgc) blade_submodel.h
	$(tgc) software/packet_forward/eo1.tg packet_forward_eo1.h packet_forward_eo1.c -frame BLADE blade_submodel.h

packet_forward_eo2.c packet_forward_eo2.h: software/packet_forward/eo2.tg $(tgc) blade_submodel.h
	$(tgc) software/packet_forward/eo2.tg packet_forward_eo2.h packet_forward_eo2.c -frame BLADE blade_submodel.h

packet_forward_app.c packet_forward_app.h: software/packet_forward/app.tg $(tgc) blade_submodel.h
	$(tgc) software/packet_forward/app.tg packet_forward_app.h packet_forward_app.c -frame BLADE blade_submodel.h

packet_process_submodel.c packet_process_submodel.h: software/packet_process.tg $(tgc) blade_submodel.h
	$(tgc) software/packet_process.tg packet_process_submodel.h packet_process_submodel.c -frame BLADE blade_submodel.h

packet_output_submodel.c packet_output_submodel.h: software/packet_output.tg $(tgc) blade_submodel.h
	$(tgc) software/packet_output.tg packet_output_submodel.h packet_output_submodel.c -frame BLADE blade_submodel.h

TG_software.c TG_software.h: software.tg $(tgc)
	$(tgc) software.tg TG_software.h TG_software.c -frame HARDWARE RN_hardware.h

################################################################################
# WORKLOAD MODELS ##############################################################
################################################################################
WL_workload.c: workload.wl $(wlc) TG_software.h RN_hardware.h
	$(wlc) workload.wl WL_workload.h WL_workload.c HARDWARE TG_software.h RN_hardware.h

all: sim

.PHONY: clean cleanmetric
clean:
	-rm ./*.c ./*.h sim
#	-rm WL_workload.c WL_workload.h RN_hardware.c RN_hardware.h TG_software.c TG_software.h blade_submodel.c blade_submodel.h memory_submodel.c memory_submodel.h packet_input_submodel.c packet_input_submodel.h packet_process_submodel.c packet_process_submodel.h packet_output_submodel.c packet_output_submodel.h sim

cleanmetric:
	-rm .output/*.log
