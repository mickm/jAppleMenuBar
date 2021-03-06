/*
 Part of jAppleMenuBar
 
 Copyright (c) 2006-09 Hansi Raber
 
 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public
 License as published by the Free Software Foundation; either
 version 3 of the License, or (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.
 
 You should have received a copy of the GNU General
 Public License along with this library; if not, write to the
 Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 Boston, MA  02111-1307  USA
 */

#import "jAppleMenuBar.h"
#import <JavaNativeFoundation/JavaNativeFoundation.h> // helper framework for Cocoa and JNI development
#import <Carbon/Carbon.h> // helper framework for Cocoa and JNI development


JNIEXPORT void JNICALL Java_japplemenubar_JAppleMenuBar_setVisible
(JNIEnv *env, jclass clazz, jboolean visible, jboolean kioskMode)
{
	if( visible == JNI_TRUE ){
        SetSystemUIMode(kUIModeNormal, 0);
	}
	else{
        SetSystemUIMode(kUIModeAllHidden, (kioskMode == JNI_TRUE) ?
						( kUIOptionDisableAppleMenu
						| kUIOptionDisableProcessSwitch
						| kUIOptionDisableForceQuit
						| kUIOptionDisableSessionTerminate) : 0);						
	}
}
