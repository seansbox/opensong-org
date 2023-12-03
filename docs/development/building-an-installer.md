# Building an Installer

## Windows

The installer is written using [Inno Setup](http://www.jrsoftware.org/isinfo.php). You will need to download and install it before continuing. As of this writing the installer requires Inno Setup 5.5.2 (u) or later and the [Inno Setup Preprocessor (ISPP)](http://www.jrsoftware.org/ispphelp/).

### Setting Up The Installation

The installer script expects a certain layout of the compiling files. The following instructions explain how to create the folder structure.

- Download and install OpenSong. Be sure to install the features you wish to compile into your installer.
  - Alternatively, you can download the OpenSong source code and compile it yourself. See the [compiling directions](../documentation/installation.md) for more information.
- Copy the entire installation folder (usually located at *%ProgramFiles%\OpenSong*) to a different location.
- In your new folder, delete the file entitled unins000.exe.
- In the same folder, create a new folder called Inno Setup.
- Download the entire contents of the [Windows Installer](http://sourceforge.net/p/opensong/code/HEAD/tree/source/utilities/WindowsInstaller/) folder and save them to the root OpenSong folder. You can safely delete the Original-Installer as it is not used after OpenSong v2.1.

### Folder Structure

You should be now configured to build the OpenSong installer. Your directory structure should look like this.

```
 OpenSong
 |_ Inno Setup
 |_ OpenSong Defaults
 |  |_ Backgrounds
 |  |_ Sets
 |  |_ Settings
 |  |  |_MainSettings
 |  |_ Songs
 |_ OpenSong Portable
 |  |_ GlobalsInstall
 |  |_ GlobalsPortable
 |_ OpenSong Languages
 |_ OpenSong Scripture
 |_ OpenSong Settings
 |_ CustomMessages.iss
 |_ Installer-Icon.bmp
 |_ Installer-Sidebar.bmp
 |_ OpenSong2.ico
 |_ OpenSong2Uninstall.ico
 |_ Setup.iss
```

### Customize Your Installation

To customize your installation just add the backgrounds, sets, or songs into your OpenSong Defaults folder. The installer will automatically include these. In the Settings folder you can edit the configuration files to make them whatever default you would like.

### Build The Installer

1.  Start Inno Setup Compiler
2.  On the Open screen choose "Open an existing script file"
3.  Choose "More Files" from the list
4.  Click OK
5.  Browse to the Setup.iss file
6.  Click OK
7.  It will bring up an editor with the script. You can make any changes you would like.
8.  From the menu bar choose "Build"→"Compile"

It will run through the compile and tell you any errors if everything is OK then you will have the installer in the "OpenSong"→"Inno Setup"→"output" folder.
