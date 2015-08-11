pse := $(PSEHOME)
rnc := $(pse)/bin/pse_rnc
tgc := $(pse)/bin/pse_tgc
wlc := $(pse)/bin/pse_wlc
lib := $(pse)/lib
lib_dir := $(pse)/lib
LDFLAGS := -L$(lib_dir) -lRNS `pth-config --ldflags` `pth-config --libs` -lm
override includes += -I$(pse)/include
override CFLAGS += $(includes) -g -Winline -Wshadow `pth-config --cflags`

sim: TG_software.c blade_submodel.c packet_input_submodel.c memory_submodel.c RN_hardware.c WL_workload.c $(lib)/rnc_runtime.o $(pse)/include/rnc_runtime.h $(lib_dir)/libRNS.a
	gcc $(CFLAGS) -o sim blade_submodel.c packet_input_submodel.c memory_submodel.c TG_software.c RN_hardware.c WL_workload.c $(pse)/lib/rnc_runtime.o $(LDFLAGS)

blade_submodel.c blade_submodel.h: blade.rn $(rnc)
	$(rnc) blade.rn blade_submodel.h blade_submodel.c

memory_submodel.c memory_submodel.h: memory_submodel.rn $(rnc)
	$(rnc) memory_submodel.rn memory_submodel.h memory_submodel.c

RN_hardware.c RN_hardware.h: hardware.rn $(rnc)
	$(rnc) hardware.rn RN_hardware.h RN_hardware.c

packet_input_submodel.c packet_input_submodel.h: packet_input.tg $(tgc) RN_hardware.h blade_submodel.h
	$(tgc) packet_input.tg packet_input_submodel.h packet_input_submodel.c -frame BLADE RN_hardware.h blade_submodel.h

TG_software.c TG_software.h: software.tg $(tgc) RN_hardware.h blade_submodel.h packet_input_submodel.h
	$(tgc) software.tg TG_software.h TG_software.c -frame HARDWARE RN_hardware.h blade_submodel.h packet_input_submodel.h

WL_workload.c: workload.wl $(wlc) TG_software.h RN_hardware.h
	$(wlc) workload.wl WL_workload.h WL_workload.c HARDWARE TG_software.h RN_hardware.h blade_submodel.h packet_input_submodel.h

.PHONY: clean cleanmetric
clean:
	-rm WL_workload.c WL_workload.h RN_hardware.c RN_hardware.h TG_software.c TG_software.h blade_submodel.c blade_submodel.h memory_submodel.c memory_submodel.h packet_input_submodel.c packet_input_submodel.h sim

cleanmetric:
	-rm avg_cpu_queue avg_cpu_req_queue avg_cpu_util avg_cpu_req_util cpu_req_queue cpu_req_util cpu_util L1_queue L1_util ram_queue ram_util cpu_queue output
