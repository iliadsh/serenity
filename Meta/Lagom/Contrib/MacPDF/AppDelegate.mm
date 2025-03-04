/*
 * Copyright (c) 2023, Nico Weber <thakis@chromium.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#import "AppDelegate.h"

#include <LibCore/ResourceImplementationFile.h>

@interface AppDelegate ()
@property (strong) IBOutlet NSWindow* window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification*)aNotification
{
    // FIXME: Copy the fonts to the bundle or something

    // Get from `Build/lagom/bin/MacPDF.app/Contents/MacOS/MacPDF` to `.`.
    NSString* source_root = [[NSBundle mainBundle] executablePath];
    for (int i = 0; i < 7; ++i)
        source_root = [source_root stringByDeletingLastPathComponent];
    auto source_root_string = DeprecatedString([source_root UTF8String]);
    Core::ResourceImplementation::install(make<Core::ResourceImplementationFile>(MUST(String::formatted("{}/Base/res", source_root_string))));
}

- (void)applicationWillTerminate:(NSNotification*)aNotification
{
}

- (BOOL)applicationSupportsSecureRestorableState:(NSApplication*)app
{
    return YES;
}

- (BOOL)application:(NSApplication*)sender openFile:(NSString*)filename
{
    [[NSDocumentController sharedDocumentController]
        openDocumentWithContentsOfURL:[NSURL fileURLWithPath:filename]
                              display:YES
                    completionHandler:^(NSDocument*, BOOL, NSError*) {}];
    return YES;
}

@end
