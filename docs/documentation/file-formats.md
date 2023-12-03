# File Formats

## Song File Format Specification

As of OpenSong v1.5.1. Copyright 2003-2009 Sean Lickfold. Released under the terms of the GPL.

### File Structure

OpenSong Song files are standard XML files with the following layout:

```
<song>
  <title></title>
  <author></author>
  <copyright></copyright>
  <presentation></presentation>
  <hymn_number></hymn_number>
  <capo print="false">
  <tempo></tempo>
  <timesig></timesig>
  <ccli></ccli>
  <theme></theme>
  <alttheme></alttheme>
  <user1></user1>
  <user2></user2>
  <user3></user3>
  <key></key>
  <aka></aka>
  <key_line></key_line>
  <lyrics></lyrics>
  <style index="default_style">
</song>
```

## Set File Format Specification

As of OpenSong v1.7. Copyright 2003-2009 Sean Lickfold. Released under the terms of the GPL.

### File Structure

OpenSong Set files are standard XML files with the following layout:

```
<?xml version="1.0" encoding="UTF-8"?>
<set>
  <slide_groups>
    <slide_group name="" type="custom" seconds="" loop="">
      <title></title>
      <subtitle></subtitle>
      <notes/>
      <slides>
        <slide>
          <body>
          </body>
       </slide>
     </slides>
  </slide_group>

  <slide_group name="" type="scripture">
    <title></title>
    <subtitle></subtitle>
    <slides>
      <slide>
        <body>
        </body>
      </slide>
    </slides>
    <notes/>
  </slide_group>

  <slide_group name="" type="song"/>
    </slide_group>
  </slide_groups>
</set>
```

## Bible File Format Specification

As of OpenSong v1.6.2. Copyright 2003-2010 Sean Lickfold. Released under the terms of the GPL.

### File Structure

OpenSong Scripture files are standard XML files with the following layout:

```
<?xml version="1.0" encoding="[W3C encoding code]"?>
<bible>
  <b n="[book name]">
    <c n="#">
      <v n="#"></v>
    </c>
  </b>
</bible>
```

## Notes

### Encoding

Any W3C encoding can be used. Generally western languages use ISO-8859-1. The best option, however, is to use UTF-8 encoding, to preserve any special characters.

### Book Name

Book names are the full-length name (e.g. "Genesis") They can be in the language that the Scripture file is saved in (e.g. in German Genesis would be "1. Mose"). Whatever the book names are is how they will be displayed in the index of the Scripture Lookup dialog.

### Chapter and Verse Numbers

The "#" sign refers to the chapter and verse number of a given book chapter and verse.
