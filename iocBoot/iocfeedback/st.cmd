#!../../bin/linux-x86_64/feedback

## You may have to change feedback to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.23.0.255")

## Register all support components
dbLoadDatabase("$(TOP)/dbd/feedback.dbd",0,0)
feedback_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadTemplate("$(TOP)/db/fb_epid.substitution")

## autosave/restore machinery
save_restoreSet_Debug(0)
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

set_pass0_restoreFile("info_positions.sav")
set_pass0_restoreFile("info_settings.sav")
set_pass1_restoreFile("info_settings.sav")

asSetFilename("/epics/xf/23id/xf23id.acf")


iocInit()

caPutLogInit("xf23id-ca:7004", 0)

## more autosave/restore machinery

cd ${TOP}/as/req

makeAutosaveFiles()
create_monitor_set("info_positions.req", 5 , "")
create_monitor_set("info_settings.req", 15 , "")

dbl > "/cf-update/xf23id2-ioc1.feedback.dbl"
