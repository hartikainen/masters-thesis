pse := $(PSEHOME)
rnc := $(pse)/bin/pse_rnc
tgc := $(pse)/bin/pse_tgc
wlc := $(pse)/bin/pse_wlc
lib := $(pse)/lib
lib_dir := $(pse)/lib
LDFLAGS := -L$(lib_dir) -lRNS `pth-config --ldflags` `pth-config --libs` -lm
override includes += -I$(pse)/include
override CFLAGS += $(includes) -g -Winline -Wshadow `pth-config --cflags`

sim: TG_software.c RN_hardware.c WL_workload.c $(lib)/rnc_runtime.o $(pse)/include/rnc_runtime.h $(lib_dir)/libRNS.a
	gcc $(CFLAGS) -o sim \
	TG_software.c \
	RN_hardware.c \
	WL_workload.c \
	$(pse)/lib/rnc_runtime.o \
	$(LDFLAGS)

################################################################################
# HARDWARE MODELS ##############################################################
################################################################################
RN_hardware.c RN_hardware.h: hardware.rn $(rnc)
	$(rnc) hardware.rn RN_hardware.h RN_hardware.c

################################################################################
# SOFTWARE MODELS ##############################################################
################################################################################
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
