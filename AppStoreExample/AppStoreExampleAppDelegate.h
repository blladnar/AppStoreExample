//
//  AppStoreExampleAppDelegate.h
//  AppStoreExample
//
//  Created by Randall Brown on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppStoreExampleAppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate> {
   NSWindow *window;
   IBOutlet NSSegmentedControl *frontBackButtons;
   IBOutlet NSSearchField *searchBar;
   IBOutlet WebView *webView;
}
- (IBAction)searched:(id)sender;
- (IBAction)forwardOrBackPressed:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end
