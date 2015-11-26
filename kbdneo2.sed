[Version]
Class=IEXPRESS
SEDVersion=3
[Options]
PackagePurpose=InstallApp
ShowInstallProgramWindow=0
HideExtractAnimation=0
UseLongFileName=1
InsideCompressed=1
CAB_FixedSize=0
CAB_ResvCodeSigning=0
RebootMode=N
InstallPrompt=%InstallPrompt%
DisplayLicense=%DisplayLicense%
FinishMessage=%FinishMessage%
TargetName=%TargetName%
FriendlyName=%FriendlyName%
AppLaunched=%AppLaunched%
PostInstallCmd=%PostInstallCmd%
AdminQuietInstCmd=%AdminQuietInstCmd%
UserQuietInstCmd=%UserQuietInstCmd%
SourceFiles=SourceFiles
VersionInfo=VersionSection
[VersionSection]
FromFile=kbdneo232.dll
[Strings]
InstallPrompt=Install Neo ergonomisch optimiert?
DisplayLicense=
FinishMessage=Neo ergonomisch optimiert installation complete
TargetName=kbdneo2.exe
FriendlyName=Neo ergonomisch optimiert
AppLaunched=.\launcher.exe kbdneo2.inf
PostInstallCmd=<None>
AdminQuietInstCmd=
UserQuietInstCmd=
FILE0="kbdneo232.dll"
FILE1="kbdneo264.dll"
FILE2="kbdneo2ww.dll"
FILE3="kbdneo2.inf"
FILE4="launcher.exe"
[SourceFiles]
SourceFiles0=.\
[SourceFiles0]
%FILE0%=
%FILE1%=
%FILE2%=
%FILE3%=
%FILE4%=
