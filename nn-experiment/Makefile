pse := $(PSEHOME)
rnc := $(pse)/bin/pse_rnc
tgc := $(pse)/bin/pse_tgc
wlc := $(pse)/bin/pse_wlc
lib := $(pse)/lib
lib_dir := $(pse)/lib
LDFLAGS := -L$(lib_dir) -lRNS `pth-config --ldflags` `pth-config --libs` -lm
override includes += -I$(pse)/include
override CFLAGS += $(includes) -g -Winline -Wshadow `pth-config --cflags`

BUILD_DIR = ./build

## RESOURCES
RESOURCES:=	hardware	main-datacenter	edge-datacenter
MAIN_FRAME:=	RN_HARDWARE
MAIN_RESOURCE_H:=	$(BUILD_DIR)/RN_hardware.h
RN_CODEFILES:= $(foreach model, $(RESOURCES), $(BUILD_DIR)/RN_$(model).c)

## TASKS
TASKS:=		classification	retrain	\
		edge-datacenter	main-datacenter	image
MAIN_TASK_H:= 	$(BUILD_DIR)/TG_image.h
image_FRAME:=	RN_HARDWARE RN_hardware.h
classification_FRAME:=	RN_MAIN_DATACENTER RN_main-datacenter.h
retrain_FRAME:=	RN_MAIN_DATACENTER RN_main-datacenter.h
edge-datacenter_FRAME:=	RN_EDGE_DATACENTER RN_edge-datacenter.h
main-datacenter_FRAME:=	RN_MAIN_DATACENTER RN_main-datacenter.h
TG_CODEFILES:= $(foreach model, $(TASKS), $(BUILD_DIR)/TG_$(model).c)

## WORKLOADS
WORKLOADS:=	workload
WL_CODEFILES:= $(foreach model, $(WORKLOADS), $(BUILD_DIR)/WL_$(model).c)

sim: $(TG_CODEFILES) $(RN_CODEFILES)$(WL_CODEFILES) $(lib)/rnc_runtime.o $(pse)/include/rnc_runtime.h $(lib_dir)/libRNS.a
	gcc $(CFLAGS) -o sim \
	$(TG_CODEFILES) \
	$(RN_CODEFILES) \
	$(WL_CODEFILES) \
	$(pse)/lib/rnc_runtime.o \
	$(LDFLAGS)

################################################################################
# RESOURCE MODELS ##############################################################
################################################################################
#.PHONY: $(RN_CODEFILES)
$(RN_CODEFILES): $(BUILD_DIR)/RN_%.c: %.rn $(rnc)
	$(rnc) $*.rn $(BUILD_DIR)/RN_$*.h $(BUILD_DIR)/RN_$*.c
	@echo $*

################################################################################
# TASK MODELS ##################################################################
################################################################################
#.PHONY: $(TG_CODEFILES)
$(TG_CODEFILES): $(BUILD_DIR)/TG_%.c: %.tg $(tgc)
	$(tgc) $*.tg $(BUILD_DIR)/TG_$*.h $(BUILD_DIR)/TG_$*.c -frame $($*_FRAME)
	@echo $*

################################################################################
# WORKLOAD MODELS ##############################################################
################################################################################
#.PHONY: $(WL_CODEFILES)
$(WL_CODEFILES): $(BUILD_DIR)/WL_%.c: %.wl $(MAIN_TASK_H) $(MAIN_RESOURCE_H) $(wlc)
	$(wlc) $*.wl $(BUILD_DIR)/WL_$*.h $(BUILD_DIR)/WL_$*.c \
	$(MAIN_FRAME) $(MAIN_TASK_H) $(MAIN_RESOURCE_H)
	@echo $*

all: sim

.PHONY: cleanall clean cleanmetric
cleanall: clean cleanmetric

clean:
	-rm $(BUILD_DIR)/*.c $(BUILD_DIR)/*.h sim

cleanmetric:
	-rm ./output/*.log
