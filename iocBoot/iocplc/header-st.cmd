#--
epicsEnvSet("ENGINEER",  "Michael Dalesio")
epicsEnvSet("LOCATION",  "")
epicsEnvSet("WIKI", "")
#-- 
epicsEnvSet("IOCNAME", "vac")
epicsEnvSet("IOC", "iocvac")
#--

## Register all support components
dbLoadDatabase "../../dbd/vac.dbd"
vac_registerRecordDeviceDriver(pdbbase) 

# Initialize EtherIP driver, define PLCs
drvEtherIP_init()

EIP_verbosity(7)
# EIP_timeout(5000)