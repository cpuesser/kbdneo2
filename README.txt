Compile the project using the command:

   build-layout && build-installer

You can clean the build directory with:

   build-layout clean && build-installer clean

The supported toolchains are:

   * DDK for Windows 2003 Server SP1 (3790.1830)
   * Visual Studio 2015 

If you are using a toolchain other than these, you must set
the paths correctly in the build-layout.bat script.

Update the version number in kbdneo2.inf (1), kbdneo2.rc (4) and kbdneo2.zap (3)
