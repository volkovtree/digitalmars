ORIGIN		= Symantec C++
ORIGIN_VER	= Version 7.22
VERSION		= DEBUG

!IFDEF SUB_DEBUG
DEBUG		= $(SUB_DEBUG)
NDEBUG		= !$(SUB_DEBUG)
!ELSE
DEBUG		= 1
NDEBUG		= 0
!ENDIF

PROJ		= GBDEMO
APPTYPE		= WINDOWS EXE
PROJTYPE	= EXE

CC		= SC
CPP		= SPP
JAVAC		= sj
MAKE		= SMAKE
RC		= RCC
HC		= HC31
ASM		= SC
DISASM		= OBJ2ASM
LNK		= LINK
DLLS		= 

HEADERS		= ..\..\..\..\include\windows.h ..\..\..\..\include\win16\WINDOWS.H ..\..\..\..\include\commdlg.h  \
		..\..\..\..\include\win16\COMMDLG.H ..\..\..\..\include\memory.h ..\..\..\..\include\string.h gbdemo.h  \
		..\..\include\bttncur.h ..\gizmobar.h ..\..\include\win1632.h 

DEFFILE		= gbdemo.def

!IF $(DEBUG)
OUTPUTDIR	= .
!IF EXIST (.)
CREATEOUTPUTDIR	=
!ELSE
CREATEOUTPUTDIR	= if not exist $(OUTPUTDIR)\*.* md $(OUTPUTDIR)
!ENDIF
TARGETDIR	= .
!IF EXIST (.)
CREATETARGETDIR	=
!ELSE
CREATETARGETDIR	= if not exist $(TARGETDIR)\*.* md $(TARGETDIR)
!ENDIF

SYMROOT		= 
SYMS		= 
LIBS		= gizmobar.lib bttncur.lib LIBW.LIB COMMDLG.LIB SHELL.LIB 

CFLAGS		=  -ms -C -WA -S -2 -a2 -c -w- -w2 -w6 -w7 -g 
LFLAGS		=  /CO /DE /PACKF /XU /A:16 /RC  -31 :.\gbdemo.RES
DEFINES		= 
!ELSE
OUTPUTDIR	= .
!IF EXIST (.)
CREATEOUTPUTDIR	=
!ELSE
CREATEOUTPUTDIR	= if not exist $(OUTPUTDIR)\*.* md $(OUTPUTDIR)
!ENDIF
TARGETDIR	= .
!IF EXIST (.)
CREATETARGETDIR	=
!ELSE
CREATETARGETDIR	= if not exist $(TARGETDIR)\*.* md $(TARGETDIR)
!ENDIF

SYMROOT		= 
SYMS		= 
LIBS		= gizmobar.lib bttncur.lib LIBW.LIB COMMDLG.LIB SHELL.LIB 

CFLAGS		=  -ms -C -o+time -WA -2 -a2 -c -w- -w2 -w6 -w7 
LFLAGS		=  /DE /PACKF /XU /A:16 /RC  -31 :.\gbdemo.RES
DEFINES		= 
!ENDIF

HFLAGS		= $(CFLAGS) 
MFLAGS		= MASTERPROJ=$(PROJ) 
LIBFLAGS	=  /C 
RESFLAGS	=  
DEBUGGERFLAGS	=  
AFLAGS		= $(CFLAGS) 
HELPFLAGS	= 

MODEL		= S

PAR		= PROJS BATS OBJS

RCDEFINES	= 

INCLUDES	= -I.

INCLUDEDOBJS	= 

OBJS		=  $(OUTPUTDIR)\gbdemo.OBJ  $(OUTPUTDIR)\init.OBJ 

RCFILES		= $(OUTPUTDIR)\gbdemo.RES

RESFILES	= 

HELPFILES	= 

PROJS		= ..\gizmobar.prj 

BATS		= 

PRECOMPILE	=  ?P?P?Bgizmobar?Pprj 

POSTCOMPILE	= 

POSTLINK	= 

.SUFFIXES: .C .CP .CPP .CXX .CC .H .HPP .HXX .COM .EXE .DLL .LIB .RTF .DLG .ASM .RES .RC .OBJ 

.C.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.c

.CPP.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cpp

.CXX.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cxx

.CC.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cc

.CP.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cp

.H.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o$(*B).sym $*.h

.HPP.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o$(*B).sym $*.hpp

.HXX.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o$(*B).sym $*.hxx

.C.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)   $*.c   -o$*.lst

.CPP.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.cpp -o$*.lst

.CXX.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.cxx -o$*.lst

.CP.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)  $*.cp  -o$*.lst

.CC.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)  $*.cc  -o$*.lst

.ASM.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.asm -o$*.lst

.OBJ.COD:
	$(DISASM) $*.OBJ -c

!IF $(DEBUG)
.OBJ.EXE:
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\gbdemo.OBJ+
.\init.OBJ
.\$$SCW$$.EXE
NUL
..\..\lib\ gizmobar.lib bttncur.lib LIBW.LIB COMMDLG.LIB SHELL.LIB 
gbdemo.def;
<<
!ELSE
.OBJ.EXE:
		$(LNK) $(LFLAGS) @$(PROJ).LNK<<
.\gbdemo.OBJ+
.\init.OBJ
.\$$SCW$$.EXE
NUL
..\..\lib\ gizmobar.lib bttncur.lib LIBW.LIB COMMDLG.LIB SHELL.LIB 
gbdemo.def;
<<
!ENDIF

.RTF.HLP:
	$(HC) $(HELPFLAGS) $*.HPJ

.ASM.OBJ:
	$(ASM) $(AFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.asm

.RC.RES: 
	$(RC) $(RCDEFINES) $(RESFLAGS) $(INCLUDES) $*.rc -o$*.res

.DLG.RES:
	echo ^#include "windows.h" >$$$*.rc
	echo ^IF EXIST "$*.h" >>$$$*.rc
	echo ^#include "$*.h" >>$$$*.rc
	echo ^#include "$*.dlg" >>$$$*.rc
	$(RC) $(RCDEFINES) $(RESFLAGS) $(INCLUDES) $$$*.rc
	-del $*.res
	-ren $$$*.res $*.res



all:	noteout createdir $(PRECOMPILE) $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(POSTCOMPILE) $(TARGETDIR)\$(PROJ).$(PROJTYPE) $(POSTLINK) _done


all2:	createdir $(PRECOMPILE) $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(POSTCOMPILE) $(TARGETDIR)\$(PROJ).$(PROJTYPE) $(POSTLINK) _done

noteout:
	REM Output to $(OUTPUTDIR)

createdir:
	$(CREATEOUTPUTDIR)
	$(CREATETARGETDIR)
	
$(TARGETDIR)\$(PROJ).$(PROJTYPE): $(OBJS) $(INCLUDEDOBJS) $(RCFILES) $(RESFILES) $(HELPFILES) $(DEFFILE)
			-del $(TARGETDIR)\$(PROJ).$(PROJTYPE)
!IF $(DEBUG)
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\gbdemo.OBJ+
.\init.OBJ
.\$$SCW$$.EXE
NUL
..\..\lib\ gizmobar.lib bttncur.lib LIBW.LIB COMMDLG.LIB SHELL.LIB 
gbdemo.def;
<<
!ELSE
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\gbdemo.OBJ+
.\init.OBJ
.\$$SCW$$.EXE
NUL
..\..\lib\ gizmobar.lib bttncur.lib LIBW.LIB COMMDLG.LIB SHELL.LIB 
gbdemo.def;
<<
!ENDIF

			-ren $(TARGETDIR)\$$SCW$$.$(PROJTYPE) $(PROJ).$(PROJTYPE)
			-echo $(TARGETDIR)\$(PROJ).$(PROJTYPE) built

_done:
		REM  Project is up to date

buildall:	clean	all


clean:
		-del $(TARGETDIR)\$$SCW$$.$(PROJTYPE)
		-del $(PROJ).CLE
		-del $(OUTPUTDIR)\SCPH.SYM
		-del GBDEMO.dpd
		-del $(OBJS)
		-del $(OUTPUTDIR)\gbdemo.RES
		cd ..\.
		$(MAKE) -fgizmobar.mak $(MFLAGS) "SUB_DEBUG=$(DEBUG)" $@

cleanres:
		-del $(OUTPUTDIR)\gbdemo.RES

res:		cleanres $(RCFILES) all


link:
!IF $(DEBUG)
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\gbdemo.OBJ+
.\init.OBJ
.\$$SCW$$.EXE
NUL
..\..\lib\ gizmobar.lib bttncur.lib LIBW.LIB COMMDLG.LIB SHELL.LIB 
gbdemo.def;
<<
!ELSE
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\gbdemo.OBJ+
.\init.OBJ
.\$$SCW$$.EXE
NUL
..\..\lib\ gizmobar.lib bttncur.lib LIBW.LIB COMMDLG.LIB SHELL.LIB 
gbdemo.def;
<<
!ENDIF

		-del $(TARGETDIR)\$(PROJ).$(PROJTYPE)
		-ren $(TARGETDIR)\$$SCW$$.$(PROJTYPE) $(PROJ).$(PROJTYPE)


?P?P?Bgizmobar?Pprj:
		cd ..\.
		$(MAKE) -fgizmobar.mak "SUB_DEBUG=$(DEBUG)"





!IF EXIST (GBDEMO.dpd)
!INCLUDE GBDEMO.dpd
!ENDIF



$(OUTPUTDIR)\gbdemo.OBJ:	gbdemo.c
		$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$(OUTPUTDIR)\gbdemo.obj gbdemo.c



$(OUTPUTDIR)\init.OBJ:	init.c
		$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$(OUTPUTDIR)\init.obj init.c



$(OUTPUTDIR)\gbdemo.RES:	gbdemo.rc
		$(RC) $(RESFLAGS) $(RCDEFINES) $(INCLUDES) -o$(OUTPUTDIR)\gbdemo.res gbdemo.rc




