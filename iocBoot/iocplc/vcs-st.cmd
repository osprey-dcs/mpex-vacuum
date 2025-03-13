#!../../bin/linux-x86_64/vac

#- You may have to change vac to something else
#- everywhere it appears in this file

< envPaths

#load header info common to all IOCs
< header-st.cmd

#Variables unique to this IOC
#epicsEnvSet("PLCIP","10.112.8.13")
#epicsEnvSet("PLCNAME","vcs")
#epicsEnvSet("PLCSLOT", 4)

# Attach port "name" to the IP and CPU slot number
#drvEtherIP_define_PLC($(PLCNAME), $(PLCIP), $(PLCSLOT))

## Load record instances and send port "name" as parameter
dbLoadRecords("../../db/vac.db")

#load tail info common to all IOCs
< tail-st.cmd

iocInit()
