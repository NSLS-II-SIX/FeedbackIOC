TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = feedback
# feedback.dbd will be created and installed
DBD += feedback.dbd

# feedback.dbd will be made up from these files:
feedback_DBD += base.dbd
feedback_DBD += menuScan.dbd

# Include dbd files from all support applications:
feedback_DBD += asSupport.dbd
feedback_DBD += caPutLog.dbd
feedback_DBD += system.dbd
feedback_DBD += devIocStats.dbd
feedback_DBD += stdSupport.dbd
feedback_DBD += calcSupport.dbd
feedback_DBD += busySupport.dbd
feedback_DBD += asyn.dbd
feedback_DBD += sseqRecord.dbd

# Add all the support libraries needed by this IOC
feedback_LIBS += autosave
feedback_LIBS += caPutLog
feedback_LIBS += devIocStats
feedback_LIBS += std
feedback_LIBS += calc
feedback_LIBS += asyn
feedback_LIBS += sscan
feedback_LIBS += busy

# feedback_registerRecordDeviceDriver.cpp derives from feedback.dbd
feedback_SRCS += feedback_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
feedback_SRCS_DEFAULT += feedbackMain.cpp
feedback_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#feedback_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
feedback_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

