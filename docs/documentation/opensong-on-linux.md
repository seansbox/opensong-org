# OpenSong on Linux

If you're using OpenSong on Linux please consider adding useful links or making an edit to add tips or information that will help other users of OpenSong.

Note: Always download the newest release of OpenSong from the Downloads page before trying any of the methods listed on this page. OpenSong is able to run on Linux using a variety of methods, including:

## Ubuntu

### Version 1.2.0

Version 1.2.0 ([link to sourceforge download](http://downloads.sourceforge.net/opensong/OpenSongLinux-V1.2.tgz)) is available as a "tgz" file. This has been confirmed to work on the Ubuntu based Kubuntu "Edgy Eft" 6.10 and "Feisty Fawn" 7.04.

A guide to installing both Kubuntu and OpenSong (by compilation and from tarball) is available. At the time of writing information there has been used to enable xinerama and have "single screen" presentation mode used across two physical displays.

### Version 1.5.1

Version 1.5.1 ([link to sourceforge download](http://sourceforge.net/project/showfiles.php?group_id=108754&package_id=117409)) is a .deb file and works well with Ubuntu 9.04. Installs just like any other .deb file.

The dual screen option (control panel on laptop and presentation on 2nd screen) does work, It can take a bit of playing with Ubuntu's screen manager to get it to recognize it. (See tips below).

The single screen on 2 displays works, under ubuntu with the 2nd monitor enabled and mirror checked.

The only real issue we have with the Linux version at this time is the background images for each slide using "override style" This can be worked around by using the "change style" / "revert style". Our testing has been on a Dell Latitude Laptop.

### Tips

#### Using Windows TTF Fonts

When using both Windows and Linux computers to edit the same set, you might be using True Type Fonts. The presentation of a set may not look correct on Linux when the chosen fonts are not available. The ttf-mscorefonts-installer is a package for Linux distributions that allows easy installation of Microsoft True Type Core Fonts, like Andale Mono, Arial Black, Arial (Bold, Italic, Bold Italic), Comic Sans MS (Bold), Courier New (Bold, Italic, Bold Italic), Georgia (Bold, Italic, Bold Italic), Impact, Times New Roman (Bold, Italic, Bold Italic), Verdana (Bold, Italic, Bold Italic) and some others.

You can either install this tool in Ubuntu from the Ubuntu Software Center, or by entering the following command in a console: sudo apt-get install ttf-mscorefonts-installer

#### Ubuntu Dual Screen Display

We could move the mouse across to the second screen but Opensong would not see the second screen. We noticed that the desktop switcher icon at the bottom of the screen was still narrow like a single monitor. Ubuntu's display manager showed both screens as active and extended.

After some playing we noticed if we simply changed the resolution to something else, (800x600) and then back to native (1024x768) The system would finally enlighten itself to the fact it had 2 monitors extended desktop. At this point the desktop changer icon at the bottom left shows wider desktops, and now OpenSong recognized the dual monitor option.

If the application tool bars and icons are on your projector instead of your laptop. Open display manager and drag the laptop screen to the left of the 2nd screen and hit apply.

#### Display and Effects Refresh Speed-Up

When using OpenSong in combination with the Intel graphics driver, slow(er) refresh rates may be experienced. (The framerate should be approximately the same as the monitor refresh rate.) The graphics driver supports two acceleration methods:

- UXA - (Unified Acceleration Architecture) is the mature backend that was introduced to support the GEM driver model.
- SNA - (Sandybridge's New Acceleration) is the faster successor for hardware supporting it.

The default method is UXA, which is more stable but slower than SNA. SNA has improved performance, but still considered experimental. These can be found here for Sandy Bridge and here for Ivy Bridge. UXA is still a solid option, if experiencing trouble with SNA. If you are having trouble with UXA though you might have better luck with SNA.

To use the new SNA method, create /etc/X11/xorg.conf.d/20-intel.conf with the following content:

```
Section "Device"
  Identifier "Intel Graphics"
  Driver "intel"
  Option "AccelMethod" "sna"
EndSection
```

You might need to make the directory xorg.conf.d/ yourself.

## PCLinuxOS Gnome 2008

This was for the PCLinuxos Gnome 2008 distro. <http://www.getpclinuxos.com/GNOME/>

I make no assertion that it will be as straightforward for other PCLinuxos derivatives. It may be the gnome specific files that made the install easy. Or it may just be as easy on all versions of PCLinuxos 2007 (and up). <http://www.pclinuxos.com/>

Downloaded the OpenSongLinux-V1.2.tgz and opened it in Krusader. Copied the entire folder structure in the tarball to my /home/[username]/ folder. Executed the 'opensong' file. Initial error message; clicked ok [which exited the program].

Executed 'opensong' file again. This time it wanted to know where to store the opensong [user] settings. It suggested a folder under /home/[username]/Documents. So I then created a sub-folder called 'opensong'. The program continued its setup properly. Exit the program. (Opensong creates a ".OpenSong" folder in your /home/[username]/ folder where it stores its preferences in a file called preferences.plist)

I copied sets and songs and scriptures across from my windows partition to the appropriate subfolders under /home/[username]/Documents/opensong/, executed 'opensong' again and it now works properly. To get it to recognise the added scripture file [which I copied across before (added NIV translation)], all I had to do is create a new set with a scripture, then choose the NIV version, at which stage opensong creates an index for that version.

I have seen the dual screen option but haven't tested it yet [running this from a Lenovo r61 Thinkpad]. The subtitle font for a custom slide show as little ascii blocks, but on screen display properly. It's the helvetica font that is being used for all text elements.

## Puppy Linux (Live CD)

This was dead easy. I downloaded the tarball, unzipped it, and it "just worked". I was prompted for a location for the song files and it created the database there. Dual Screen not attempted or tested.

I noticed two problems. Firstly I could only get solid background colours, no pictures. Secondly a certain apostrophe in the text of a song threw the rendering out (I only noticed this on one song). Both non critical! It's great to know that if I have a USB stick with my "set" on, and a puppy linux live CD I could get an emergency opensong running on a laptop with a failed hard disk.

## Other Distributions

There is currently no other specifically targeted distribution however users may find that the release tar.gz (aka "tarball") will run on their distribution. Please add a report to the wiki for any unmentioned distribution on which you have OpenSong running.

Mandriva 2009 works well with the compiled source.

### OpenSong on Linux Using Wine

[WINE](http://www.winehq.org/) is a compatibility layer that enables API calls for Windows to work on Linux (and other x86 based unixes). This means that the OpenSong MS Windows executable files can be used with a Linux distro. Dual screen has been confirmed to work using WINE 1.0.1 and Xinerama on Ubuntu 8.10. Issues: No picture backgrounds, only solid colors.

### Problems

When trying the find option it types backwards, so automatically deletes the word you are trying to type in. Have to hit space on keyboard and the the letter, then you need then space then key until you have typed the word you want. OS Ubuntu 9.10, OpenSong 1.6.
