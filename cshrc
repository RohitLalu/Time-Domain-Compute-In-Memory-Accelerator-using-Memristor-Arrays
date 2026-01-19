#!/bin/csh
setenv CDS_Netlisting_Mode Analog
setenv QRC_ENABLE_QRCRACTION "1"
setenv CDS_AUTO_64BIT ALL
setenv CDS_AHDLCMI_ENABLE YES	
setenv EDITOR gedit 

setenv LM_LICENSE_FILE 5280@14.139.1.126
setenv CDS_LIC_FILE $LM_LICENSE_FILE
setenv LANG en_US

###########################################################


setenv LIBERATEHOME 	/home/install/LIBERATE217


###########################################################
#####################  CIC     ############################

setenv CDSHOME	 	/home/install/IC618
#setenv CDSHOME	 	/home/install/ICADVM201
setenv ASSURAHOME	/home/install/ASSURA41
setenv QRC_HOME     	/home/install/QUANTUS212
setenv PVSHOME  	/home/install/PVS222
setenv MMSIMHOME  	/home/install/SPECTRE211

###########################################################
#####################  ASIC    ############################

setenv IUSHOME  	/home/install/INCISIVE152
setenv LECHOME 		/home/install/CONFRML211
setenv INNOVUSHOME	/home/install/INNOVUS211
setenv GENUSHOME	/home/install/GENUS211
setenv MODUSHOME	/home/install/MODUS221
setenv SSVHOME		/home/install/SSV221

###################NEW#################3

setenv JASPERHOME	/home/install/JASPER2022
setenv MVSHOME	        /home/install/MVS211
setenv PEGASUSHOME      /home/install/PEGASUSDFM221
setenv SIGRITYHOME      /home/install/SIGRITY20211
setenv STRATUSHOME	/home/install/STRATUS2202
setenv XCELIUMHOME	/home/install/XCELIUM2209
setenv ULTRASIMHOME     /home/install/ULTRASIM181
setenv VMANAGERHOME     /home/install/VMANAGER2209
setenv INTEGRANDHOME    /home/install/INTEGRAND63
setenv JLSHOME	        /home/install/JLS201
###########################################################
#####################  PCB  ###############################

setenv SPBHOME 		/home/install/SPB221

###########################################################
#####################  LIBRARIES  #########################

setenv FOUNDRY 		/home/install/FOUNDRY
setenv ANALOG		/home/install/FOUNDRY/analog
setenv STDCELL		/home/install/FOUNDRY/stdcell
setenv FINFET           /home/install/FOUNDRY/cds_ff_mpt_v_1.0
###########################################################

setenv DIGITAL		/home/install/FOUNDRY/digital
setenv dig_45nm		$DIGITAL/45nm

###########################################################

setenv CDS_INST_DIR 	$CDSHOME
setenv CDSHOME 		$CDS_INST_DIR
setenv AMSHOME 		$IUSHOME
setenv LD_LIBRARY_PATH 	$CDS_INST_DIR/tools/lib:$CDS_INST_DIR/tools/dfII/lib
setenv LD_LIBRARY_PATH 	$IUSHOME/tools/lib

###########################################################

set path = ($CDS_INST_DIR/bin $CDS_INST_DIR/tools/bin $MMSIMHOME/tools.lnx86/bin $MMSIMHOME/tools.lnx86/dfII/bin $MMSIMHOME/bin $MMSIMHOME/tools.lnx86/bin $IUSHOME/bin $IUSHOME/tools.lnx86/bin $IUSHOME/tools/dfII/bin $IUSHOME/tools.lnx86/dfII/bin $IUSHOME/tools.lnx86/dfII/bin $IUSHOME/share/bin $ASSURAHOME/bin $ASSURAHOME/tools/bin $ASSURAHOME/tools/dfII/bin $ASSURAHOME/tools.lnx86/dfII/bin $ASSURAHOME/tools.lnx86/dfII/bin $ASSURAHOME/share/bin $PVSHOME/tools/assura/bin $PVSHOME/tools/bin $PVSHOME/bin $PVSHOME/tools.lnx86/bin $PVSHOME/tools/dfII/bin $QRC_HOME/tools/bin $SPBHOME/bin $SPBHOME/tools.lnx86/pcb/bin $SPBHOME/tools.lnx86/dfII/bin $SPBHOME/tools.lnx86/dfII/bin $SPBHOME/tools.lnx86/dfII/bin $SPBHOME/tools.lnx86/pcb/bin $SPBHOME/tools.lnx86/bin $LECHOME/bin $LECHOME/tools.lnx86/bin $LECHOME/tools.lnx86/dfII/bin $LECHOME/tools.lnx86/dfII/bin $LECHOME/tools.lnx86/dfII/bin $LECHOME/share/bin $LIBERATEHOME/tools.lnx86/bin $LIBERATEHOME/tools.lnx86/dfII/bin $LIBERATEHOME/bin $LIBERATEHOME/tools.lnx86/dfII/bin $LIBERATEHOME/tools.lnx86/dfII/bin $GENUSHOME/bin $GENUSHOME/share/bin $GENUSHOME/tools.lnx86/dfII/bin $GENUSHOME/tools.lnx86/dfII/bin $GENUSHOME/tools.lnx86/bin $GENUSHOME/tools.lnx86/bin $INNOVUSHOME/bin $INNOVUSHOME/tools/bin $INNOVUSHOME/tools/dfII/bin $INNOVUSHOME/share/bin $SSVHOME/bin $SSVHOME/tools.lnx86/bin $SSVHOME/tools.lnx86/dfII/bin $SSVHOME/tools.lnx86/dfII/bin $SSVHOME/tools.lnx86/dfII/bin $SSVHOME/share/bin $XCELIUMHOME/tools.lnx86/dfII/bin $XCELIUMHOME/share/bin $XCELIUMHOME/bin $XCELIUMHOME/tools/bin $XCELIUMHOME/tools/dfII/bin $XCELIUMHOME/tools.lnx86/bin $XCELIUMHOME/tools.lnx86/dfII/bin  $MODUSHOME/bin   $MODUSHOME/tools.lnx86/bin $MODUSHOME/tools.lnx86/dfII/bin $MODUSHOME/tools.lnx86/bin $MODUSHOME/tools.lnx86/dfII/bin $JASPERHOME/bin $JASPERHOME/tools.lnx86/bin $JASPERHOME/tools.lnx86/dfII/bin $JASPERHOME/tools.lnx86/dfII/bin $JASPERHOME/tools.lnx86/dfII/bin $JASPERHOME/share/bin $MVSHOME/tools.lnx86/dfII/bin $MVSHOME/share/bin $MVSHOME/bin   $MVSHOME/tools.lnx86/bin $MVSHOME/tools.lnx86/dfII/bin $MVSHOME/tools.lnx86/bin $MVSHOME/tools.lnx86/dfII/bin $PEGASUSHOME/bin $PEGASUSHOME/tools.lnx86/bin $PEGASUSHOME/tools.lnx86/dfII/bin $PEGASUSHOME/tools.lnx86/dfII/bin $PEGASUSHOME/tools.lnx86/dfII/bin $PEGASUSHOME/share/bin $SIGRITYHOME/tools.lnx86/dfII/bin $SIGRITYHOME/share/bin $SIGRITYHOME/bin $SIGRITYHOME/tools.lnx86/bin $SIGRITYHOME/tools.lnx86/dfII/bin $SIGRITYHOME/tools.lnx86/bin $SIGRITYHOME/tools.lnx86/dfII/bin $STRATUSHOME/bin $STRATUSHOME/tools.lnx86/bin $STRATUSHOME/tools.lnx86/dfII/bin $STRATUSHOME/tools.lnx86/dfII/bin $STRATUSHOME/tools.lnx86/dfII/bin $STRATUSHOME/share/bin  $ULTRASIMHOME/tools.lnx86/dfII/bin $ULTRASIMHOME/share/bin $ULTRASIMHOME/bin $ULTRASIMHOME/tools.lnx86/bin $ULTRASIMHOME/tools.lnx86/dfII/bin $ULTRASIMHOME/tools.lnx86/bin $ULTRASIMHOME/tools.lnx86/dfII/bin $VMANAGERHOME/tools.lnx86/dfII/bin $VMANAGERHOME/share/bin $VMANAGERHOME/bin $VMANAGERHOME/tools.lnx86/bin $VMANAGERHOME/tools.lnx86/dfII/bin $VMANAGERHOME/tools.lnx86/bin $VMANAGERHOME/tools.lnx86/dfII/bin $INTEGRANDHOME/tools.lnx86/dfII/bin $INTEGRANDHOME/share/bin $INTEGRANDHOME/bin $INTEGRANDHOME/tools.lnx86/bin $INTEGRANDHOME/tools.lnx86/dfII/bin $INTEGRANDHOME/tools.lnx86/bin $INTEGRANDHOME/tools.lnx86/dfII/bin $JLSHOME/tools.lnx86/dfII/bin $JLSHOME/share/bin $JLSHOME/bin $JLSHOME/tools.lnx86/bin $JLSHOME/tools.lnx86/dfII/bin $JLSHOME/tools.lnx86/bin $JLSHOME/tools.lnx86/dfII/bin $path)


###########################################################

clear
echo ""
echo "Welcome to Cadence tools Suite"
echo ""

