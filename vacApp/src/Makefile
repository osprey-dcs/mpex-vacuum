TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = vac
# vac.dbd will be created and installed
DBD += vac.dbd

Common_DBDs += base.dbd
Common_DBDs += system.dbd

Common_SRCs +=

ifneq ($(PMAC),)
Common_DBDs += drvAsynPowerPMACPort.dbd 
Common_DBDs += pmacAsynIPPort.dbd 
Common_DBDs += pmacAsynMotorPort.dbd
Common_LIBs += pmacAsynIPPort
Common_LIBs += pmacAsynMotorPort
Common_LIBs += powerPmacAsynPort
endif

ifneq ($(MOTOR),)
Common_DBDs += motorSupport.dbd
Common_DBDs += devSoftMotor.dbd
Common_LIBs += motor
Common_LIBs += softMotor
endif

ifneq ($(ASYN),)
Common_DBDs += asyn.dbd
Common_DBDs += drvAsynIPPort.dbd
Common_DBDs += drvAsynSerialPort.dbd
Common_LIBs += asyn
endif

ifneq ($(MODBUS),)
Common_DBDs += modbusSupport.dbd
Common_LIBs += modbus
endif

ifneq ($(SNMP),)
Common_DBDs += devSnmp.dbd
Common_LIBs += devSnmp
SYS_PROD_LIBS += netsnmp
endif

ifneq ($(STD),)
Common_DBDs += stdSupport.dbd
Common_LIBs += std
endif

ifneq ($(CALC),)
Common_DBDs += calcSupport.dbd
Common_LIBs += calc
endif

ifneq ($(AUTOSAVE),)
Common_DBDs += asSupport.dbd
Common_LIBs += autosave
endif

ifneq ($(IOCSTATS),)
Common_DBDs += devIocStats.dbd
Common_LIBs += devIocStats
endif

ifneq ($(RECCASTER),)
Common_DBDs += reccaster.dbd
Common_LIBs += reccaster
endif

ifneq ($(SNCSEQ),)
 sncExample_SNCFLAGS += +r
 #Common_DBDs += sncExample.dbd
 #A .stt sequence program is *not* pre-processed:
 #Common_SRCs += sncExample.stt
 Common_LIBs += seq pv
endif

ifneq ($(STREAM),)
Common_DBDs += stream.dbd
Common_LIBs += stream
endif

ifneq ($(RETOOLS),)
Common_DBDs += retools.dbd
Common_LIBs += retools
endif

ifneq ($(CAPUTLOG),)
Common_DBDs += caPutLog.dbd
Common_LIBs += caPutLog
endif

ifneq ($(MEASCOMP),)
Common_DBDs += measCompSupport.dbd
Common_LIBs += measComp
mot_SYS_LIBS += uldaq
endif

ifneq ($(SSCAN),)
Common_DBDs += sscanSupport.dbd
Common_LIBs += sscan
endif

ifneq ($(BUSY),)
Common_DBDs += busySupport.dbd
Common_LIBs += busy
endif

ifneq ($(SCALER),)
Common_DBDs += scalerSupport.dbd
Common_LIBs += scaler
endif

ifneq ($(MCA),)
Common_DBDs += mcaSupport.dbd
Common_LIBs += mca
endif

ifneq ($(ETHER_IP),)
Common_DBDs += ether_ip.dbd
Common_LIBs += ether_ip
endif

# https://epics.anl.gov/tech-talk/2024/msg00460.php
# QSRV2
ifdef PVXS_MAJOR_VERSION # prefer QSRV2 :)
Common_DBDs += pvxsIoc.dbd
Common_LIBs += pvxsIoc pvxs
else
ifdef EPICS_QSRV_MAJOR_VERSION # fallback to QSRV1
Common_LIBs += qsrv
Common_LIBs += $(EPICS_BASE_PVA_CORE_LIBS)
Common_DBDs += PVAServerRegister.dbd
Common_DBDs += qsrv.dbd
endif
endif

# Include dbd files from all support applications:
#vac_DBD += xxx.dbd
vac_DBD += $(Common_DBDs)
vac_LIBS += $(Common_LIBs)
vac_SRCS += $(Common_SRCs)

# vac_registerRecordDeviceDriver.cpp derives from vac.dbd
vac_SRCS += vac_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
vac_SRCS_DEFAULT += vacMain.cpp
vac_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#vac_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
vac_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

