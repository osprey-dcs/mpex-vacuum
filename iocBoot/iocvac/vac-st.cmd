#!../../bin/linux-x86_64/vac

#- You may have to change vac to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("IOCNAME", "vac")
epicsEnvSet("IOC", "iocvac")
epicsEnvSet("PREFIX", "VAC")

epicsEnvSet("AS_PATH", "$(TOP)/iocBoot/$(IOC)/autosave")

## Register all support components
dbLoadDatabase "../../dbd/vac.dbd"
vac_registerRecordDeviceDriver(pdbbase) 

# Initialize EtherIP driver, define PLCs
drvEtherIP_init()

#Variables unique to this IOC
#epicsEnvSet("PLCIP","10.112.8.13")
#epicsEnvSet("PLCNAME","vcs")
#epicsEnvSet("PLCSLOT", 4)

# Attach port "name" to the IP and CPU slot number
#drvEtherIP_define_PLC($(PLCNAME), $(PLCIP), $(PLCSLOT))

## Load record instances and send port "name" as parameter
dbLoadRecords("../../db/vac.db")

## Set Autosave paths
set_requestfile_path("$(AS_PATH)")
set_savefile_path("$(AS_PATH)")

## Reccaster db
dbLoadRecords("$(TOP)/db/reccaster.db", "P=$(PREFIX):RecSync")

## IOCSTATS db
dbLoadRecords("$(TOP)/db/iocAdminSoft.db", "IOC=$(VAC)")

#Access security file to load
#asSetFilename("${ASCF}/ics-default.acf")

iocInit()

save_restoreSet_Debug(0)
makeAutosaveFileFromDbInfo("$(AS_PATH)/info_settings.req", "autosaveFields")
create_monitor_set("info_settings.req", 30, "")