BASE=kbdneo2
all: $(BASE)32.dll $(BASE)64.dll $(BASE)ww.dll $(BASE).exe

clean:
	-for %a in (res ddf cab exe) do @if exist $(BASE).%a del $(BASE).%a
	-for %a in (32 64 ww) do @for %b in (dll obj lib exp) do @if exist $(BASE)%a.%b del $(BASE)%a.%b
	-if exist vc*.pdb @del vc*.pdb
	-for %a in (obj exe pdb) do @if exist launcher.%a del launcher.%a

CL32="$(BIN32)\cl.exe"
LINK32="$(BIN32)\link.exe" -machine:ix86
CL64="$(BIN64)\cl.exe"
LINK64="$(BIN64)\link.exe" -machine:amd64

CFLAGS=-Zp8 -Gy -W3 -WX -Gz -Gm- -EHs-c- -GR- -GF -Zl -Oxs -D_WIN32_WINNT=0x0501

# http://www.levicki.net/articles/tips/2006/09/29/How_to_build_keyboard_layouts_for_Windows_x64.php
$(BASE)64.obj: $(BASE).c
	$(CL64) -nologo -c -I..\inc $(CFLAGS) -Fo$@ $**

$(BASE)32.obj: $(BASE).c
	$(CL32) -nologo -c -I..\inc $(CFLAGS) -Fo$@ $**

$(BASE)ww.obj: $(BASE).c
	$(CL32) -nologo -c -I..\inc $(CFLAGS) -DBUILD_WOW6432 -Fo$@ $**

$(BASE).res: $(BASE).rc
	    rc $**

LFLAGS=-subsystem:native -def:$(BASE).def -noentry \
 -merge:.edata=.data -merge:.rdata=.data -merge:.text=.data -merge:.bss=.data -section:.data,re \
 -ignore:4078,4070,4108,4254 -align:512 -stack:0x40000,0x1000 -opt:ref,icf -release

# ignore that sections had different attributes before they were merged
# msvcrt in XP DDK has a directive to merge .CRT and .rdata
$(BASE)32.dll: $(BASE)32.obj $(BASE).res
	$(LINK32) -nologo -dll -base:0x5FFF0000 $(LFLAGS) -out:$@ $**

$(BASE)ww.dll: $(BASE)ww.obj $(BASE).res
	$(LINK32) -nologo -dll -base:0x5FFF0000 $(LFLAGS) -out:$@ $**

# different from the 32-bit version is the base address and the machine flag
$(BASE)64.dll: $(BASE)64.obj $(BASE).res
	$(LINK64) -nologo -dll -base:0x5FFE0000 $(LFLAGS) -out:$@ $**

launcher.obj: launcher.c
	$(CL32) -nologo -c -Fo$@ -Oy- -Zi $(NO_GS) $**

# we don't need to link with libc (or libcmt) since we don't use the CRT!
# must have default alignment, or we'll get 0xC0000018 on Win8.1 x64
launcher.exe: launcher.obj
	$(LINK32) -nologo -subsystem:windows -release -nodefaultlib -out:$@ \
		 -debug -debugtype:cv -pdb:$*.pdb $** kernel32.lib user32.lib shell32.lib

# use makecab instead of cabarc since this is a system command:
# <http://msdn.microsoft.com/en-us/library/bb267310.aspx#microsoftmakecabusersguide>
# <http://www.mdgx.com/INF_web/diamond.htm#DIRECTIVE>
$(BASE).cab: $(BASE)32.dll $(BASE)64.dll $(BASE)ww.dll $(BASE).inf launcher.exe
	@copy /y NUL $(BASE).ddf
	@echo .Option Explicit >> $(BASE).ddf
	@echo .Set CabinetNameTemplate=$@ >> $(BASE).ddf
	@echo .Set CompressionType=LZX >> $(BASE).ddf
	@echo .Set CompressionMemory=21 >> $(BASE).ddf
	@echo .Set DiskDirectoryTemplate=. >> $(BASE).ddf
	@echo .Set InfFileName=NUL >> $(BASE).ddf
	@echo .Set RptFileName=NUL >> $(BASE).ddf
	@for %a in ($**) do @echo %a >> $(BASE).ddf
	makecab /F $(BASE).ddf
	
# http://www.msfn.org/board/SED-INF-DDF-file-format-t49202.html		 
# http://www.mdgx.com/INF_web/iexpress.htm
$(BASE).exe: $(BASE).sed $(BASE).cab
	iexpress /N /Q /M $(BASE).sed
