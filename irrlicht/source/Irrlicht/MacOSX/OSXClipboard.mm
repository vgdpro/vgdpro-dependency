// Copyright (C) 2005-2006 Etienne Petitjean
// Copyright (C) 2007-2012 Christian Stehno
// This file is part of the "Irrlicht Engine".
// For conditions of distribution and use, see copyright notice in Irrlicht.h

#include "irrString.h"
#include "OSXClipboard.h"
#import <Cocoa/Cocoa.h>

void OSXCopyToClipboard(const wchar_t *text)
{
	NSString *str;
	NSPasteboard *board;

	if ((text != NULL) && (wcslen(text) > 0))
	{
		str = [[NSString alloc] initWithBytes:text length:wcslen(text)*sizeof(*text) encoding:NSUTF32LittleEndianStringEncoding];
		board = [NSPasteboard generalPasteboard];
		[board declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:NSApp];
		[board setString:str forType:NSStringPboardType];
	}
}

wchar_t* OSXCopyFromClipboard()
{
	NSString* str;
	NSPasteboard* board;
	wchar_t* result;

	result = NULL;
	board = [NSPasteboard generalPasteboard];
	str = [board stringForType:NSStringPboardType];
	if (str != nil)
		result = (wchar_t*)[str cStringUsingEncoding:NSUTF32LittleEndianStringEncoding];
	return (result);
}

