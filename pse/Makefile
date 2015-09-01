pse := $(PSEHOME)
rnc := $(pse)/bin/pse_rnc
tgc := $(pse)/bin/pse_tgc
wlc := $(pse)/bin/pse_wlc
lib := $(pse)/lib
lib_dir := $(pse)/lib
LDFLAGS := -L$(lib_dir) -lRNS `pth-config --ldflags` `pth-config --libs` -lm
override includes += -I$(pse)/include
override CFLAGS += $(includes) -g -Winline -Wshadow `pth-config --cflags`

sim: TG_software.c swap_mac_app.c swap_mac_eo1.c packet_forward_app.c packet_forward_eo1.c packet_forward_eo2.c ipsec_app.c ipsec_eo1.c ipsec_eo2.c packet_input_submodel.c packet_process_submodel.c packet_output_submodel.c RN_hardware.c blade_submodel.c WL_workload.c $(lib)/rnc_runtime.o $(pse)/include/rnc_runtime.h $(lib_dir)/libRNS.a
#	gcc $(CFLAGS) -o sim blade_submodel.c packet_input_submodel.c packet_forward_app.c ipsec_app.c packet_process_submodel.c packet_output_submodel.c TG_software.c RN_hardware.c WL_workload.c $(pse)/lib/rnc_runtime.o $(LDFLAGS)
	gcc $(CFLAGS) -o sim \
	memread.c \
	swap_mac_eo1.c \
	swap_mac_app.c \
	packet_forward_app.c \
	packet_forward_eo1.c \
	packet_forward_eo2.c \
	ipsec_eo1.c \
	ipsec_eo2.c \
	ipsec_app.c \
	packet_input_submodel.c \
	packet_process_submodel.c \
	packet_output_submodel.c \
	TG_software.c \
	blade_submodel.c \
	RN_hardware.c \
	WL_workload.c \
	$(pse)/lib/rnc_runtime.o \
	$(LDFLAGS)

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

memwrite.c memwrite.h: software/memwrite.tg $(tgc) RN_hardware.h blade_submodel.h
	$(tgc) software/memwrite.tg memwrite.h memwrite.c -frame BLADE blade_submodel.h

memread.c memread.h: software/memread.tg $(tgc) RN_hardware.h blade_submodel.h
	$(tgc) software/memread.tg memread.h memread.c -frame BLADE blade_submodel.h

# swap_mac app
swap_mac_eo1.c swap_mac_eo1.h: software/swap_mac/eo1.tg $(tgc) blade_submodel.h memread.h memwrite.h
	$(tgc) software/swap_mac/eo1.tg swap_mac_eo1.h swap_mac_eo1.c -frame BLADE blade_submodel.h memread.h memwrite.h

swap_mac_app.c swap_mac_app.h: software/swap_mac/app.tg $(tgc) blade_submodel.h swap_mac_eo1.h
	$(tgc) software/swap_mac/app.tg swap_mac_app.h swap_mac_app.c -frame BLADE blade_submodel.h swap_mac_eo1.h

# packet_forward app
packet_forward_eo1.c packet_forward_eo1.h: software/packet_forward/eo1.tg $(tgc) blade_submodel.h memread.h memwrite.h
	$(tgc) software/packet_forward/eo1.tg packet_forward_eo1.h packet_forward_eo1.c -frame BLADE blade_submodel.h memread.h memwrite.h

packet_forward_eo2.c packet_forward_eo2.h: software/packet_forward/eo2.tg $(tgc) blade_submodel.h memread.h memwrite.h
	$(tgc) software/packet_forward/eo2.tg packet_forward_eo2.h packet_forward_eo2.c -frame BLADE blade_submodel.h memread.h memwrite.h

packet_forward_app.c packet_forward_app.h: software/packet_forward/app.tg $(tgc) blade_submodel.h packet_forward_eo1.h packet_forward_eo2.h
	$(tgc) software/packet_forward/app.tg packet_forward_app.h packet_forward_app.c -frame BLADE blade_submodel.h packet_forward_eo1.h packet_forward_eo2.h

# IPSec app
ipsec_eo1.c ipsec_eo1.h: software/IPSec/eo1.tg $(tgc) blade_submodel.h memread.h memwrite.h
	$(tgc) software/IPSec/eo1.tg ipsec_eo1.h ipsec_eo1.c -frame BLADE blade_submodel.h memread.h memwrite.h

ipsec_eo2.c ipsec_eo2.h: software/IPSec/eo2.tg $(tgc) blade_submodel.h memread.h memwrite.h
	$(tgc) software/IPSec/eo2.tg ipsec_eo2.h ipsec_eo2.c -frame BLADE blade_submodel.h memread.h memwrite.h

ipsec_app.c ipsec_app.h: software/IPSec/app.tg $(tgc) blade_submodel.h ipsec_eo1.h ipsec_eo2.h
	$(tgc) software/IPSec/app.tg ipsec_app.h ipsec_app.c -frame BLADE blade_submodel.h ipsec_eo1.h ipsec_eo2.h

packet_process_submodel.c packet_process_submodel.h: software/packet_process.tg $(tgc) blade_submodel.h swap_mac_app.h packet_forward_app.h ipsec_app.h
	$(tgc) software/packet_process.tg packet_process_submodel.h packet_process_submodel.c -frame BLADE blade_submodel.h swap_mac_app.h packet_forward_app.h ipsec_app.h

packet_output_submodel.c packet_output_submodel.h: software/packet_output.tg $(tgc) blade_submodel.h
	$(tgc) software/packet_output.tg packet_output_submodel.h packet_output_submodel.c -frame BLADE blade_submodel.h

TG_software.c TG_software.h: software.tg $(tgc) RN_hardware.h blade_submodel.h packet_input_submodel.h packet_process_submodel.h packet_output_submodel.h
	$(tgc) software.tg TG_software.h TG_software.c \
		-frame HARDWARE \
		RN_hardware.h \
		blade_submodel.h \
		packet_input_submodel.h \
		packet_process_submodel.h \
		packet_output_submodel.h

################################################################################
# WORKLOAD MODELS ##############################################################
################################################################################
WL_workload.c: workload.wl $(wlc) TG_software.h RN_hardware.h
	$(wlc) workload.wl WL_workload.h WL_workload.c HARDWARE TG_software.h RN_hardware.h blade_submodel.h


.PHONY: clean cleanmetric
clean:
	-rm ./*.c ./*.h sim
#	-rm WL_workload.c WL_workload.h RN_hardware.c RN_hardware.h TG_software.c TG_software.h blade_submodel.c blade_submodel.h memory_submodel.c memory_submodel.h packet_input_submodel.c packet_input_submodel.h packet_process_submodel.c packet_process_submodel.h packet_output_submodel.c packet_output_submodel.h sim

cleanmetric:
	-rm .output/*.log
