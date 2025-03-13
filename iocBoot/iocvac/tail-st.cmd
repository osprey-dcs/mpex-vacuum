#Reccaster db
dbLoadRecords("$(TOP)/db/reccaster.db", "P=$(IOCNAME)-$(PLCNAME):RecSync")

#IOCSTATS db
dbLoadRecords("$(TOP)/db/iocAdminSoft.db", "IOC=$(IOC)-$(PLCNAME)")

#Access security file to load
#asSetFilename("${ASCF}/ics-default.acf")
