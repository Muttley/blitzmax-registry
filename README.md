#About

This module provides a registry implementation that allows you to easily store
and retrieve objects from different parts of your applications.

#Dependencies

The main module has no dependencies other than core BlitzMax modules.

The Unit Tests for this module rely on Bruce Henderson's [bah.maxunit][6] module
available from his **maxmods** [Google Code project page][7].

#Installation

To install this module, copy the **registry.mod** directory into a folder
called **muttley.mod** in your **BlitzMax\mod** directory.

For example, on Windows:

	xcopy registry.mod C:\BlitzMax\mod\muttley.mod\. /E /I

On Linux:

	mkdir /opt/BlitzMax/mod/muttley.mod
	cp -r registry.mod /opt/BlitzMax/mod/muttley.mod/.

Then build the module as follows (assuming bmk is in your path):

	bmk makemods -a muttley.registry

#Unit Tests

Unit Tests for the module are included in the **registry.mod\UnitTests**
folder, and these can be run as follows:

	bmk makeapp -a -r -t console -x registry.mod\UnitTests\Main.bmx

#Example

The **registry.mod\Example** directory contains a small  application that shows
how this module can be used.  This can be compiled and run as follows:

	bmk makeapp -a -r -t console -x registry.mod\Example\Main.bmx

#Sublime Project

For [Sublime Text][2] users there is a project file which can be used if you
wish modify this module in any way.  The project file includes build systems
for building the module, and building and running both the Unit Tests and
Example application.  These build systems rely on the [Gradle][3] build
automation system.

#License

Copyright (c) 2012-2015 Paul Maskelyne ([muttley@muttleyville.org][4]).

All rights reserved. Use of this code is allowed under the Artistic License
2.0 terms, as specified in the LICENSE file distributed with this code, or
available from [http://www.opensource.org/licenses/artistic-license-2.0.php][5]

[2]: http://www.sublimetext.com/
[3]: http://www.gradle.org/
[4]: mailto:muttley@muttleyville.org
[5]: http://www.opensource.org/licenses/artistic-license-2.0.php
[6]: https://code.google.com/p/maxmods/wiki/MaxUnitModule
[7]: https://code.google.com/p/maxmods/
