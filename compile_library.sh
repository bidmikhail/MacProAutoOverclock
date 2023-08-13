#!/bin/sh

cd "$( dirname "${BASH_SOURCE[0]}" )"

g++  -dynamiclib -arch i386 -isysroot /Developer/SDKs/MacOSX10.5.sdk -framework Cocoa ./injection.mm -o ./inject.dylib
