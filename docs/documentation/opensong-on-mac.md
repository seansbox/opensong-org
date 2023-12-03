# OpenSong on macOS

With the release of [OS X 10.8 Mountain Lion](http://www.apple.com/osx/), the new GateKeeper functionality is now in effect.

This means that new apps like OpenSong that are downloaded or copied to a Mac with Mountain Lion, but that are not digitally signed, display a 'Mountain Lion Error for Unsigned Applications' error. This error can be overridden in System Preferences, by changing the "Allow applications downloaded from" setting to "Anywhere".

![MacOS Install from Anywhere](../images/macos_install_from_anywhere.png)

If you wish to continue using the security features offered by Gatekeeper, you may opt to enable Opensong as an exception. If you are comfortable using the Terminal, this may be done with the following command:

```
spctl --add --label "OpenSong" /path/to/program
```
