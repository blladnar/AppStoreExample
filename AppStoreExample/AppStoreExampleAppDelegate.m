//
//  AppStoreExampleAppDelegate.m
//  AppStoreExample
//
//  Created by Randall Brown on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppStoreExampleAppDelegate.h"

@implementation AppStoreExampleAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
   [frontBackButtons removeFromSuperview];
   NSView *outerView = [[window contentView] superview];
   
   
   frontBackButtons.frame = NSMakeRect(frontBackButtons.frame.origin.x, window.frame.size.height - frontBackButtons.frame.size
                                       .height - 11, frontBackButtons.frame.size.width, frontBackButtons.frame.size.height);
   [outerView addSubview:frontBackButtons];
   
   [searchBar removeFromSuperview];
   
   searchBar.frame = NSMakeRect(searchBar.frame.origin.x, window.frame.size.height - searchBar.frame.size
                                       .height - 14, searchBar.frame.size.width, searchBar.frame.size.height);   
   [outerView addSubview:searchBar];
   [webView setMainFrameURL:@"http://google.com"];
}

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)proposedFrameSize
{
   NSButton *closeButton = [window standardWindowButton:NSWindowCloseButton];
   NSButton *zoomButton = [window standardWindowButton:NSWindowZoomButton];
   NSButton *minimizeButton = [window standardWindowButton:NSWindowMiniaturizeButton];
   
   closeButton.frame = NSMakeRect(closeButton.frame.origin.x+5, closeButton.frame.origin.y-12, closeButton.frame.size.height, closeButton.frame.size.width);
   zoomButton.frame = NSMakeRect(zoomButton.frame.origin.x+5, zoomButton.frame.origin.y-12, zoomButton.frame.size.height, zoomButton.frame.size.width);
   minimizeButton.frame = NSMakeRect(minimizeButton.frame.origin.x+5, minimizeButton.frame.origin.y-12, minimizeButton.frame.size.height, minimizeButton.frame.size.width);  
   
   return proposedFrameSize;
}

-(void)windowDidResize:(NSNotification *)notification
{
   NSButton *closeButton = [window standardWindowButton:NSWindowCloseButton];
   NSButton *zoomButton = [window standardWindowButton:NSWindowZoomButton];
   NSButton *minimizeButton = [window standardWindowButton:NSWindowMiniaturizeButton];
   
   closeButton.frame = NSMakeRect(closeButton.frame.origin.x+5, closeButton.frame.origin.y-12, closeButton.frame.size.height, closeButton.frame.size.width);
   zoomButton.frame = NSMakeRect(zoomButton.frame.origin.x+5, zoomButton.frame.origin.y-12, zoomButton.frame.size.height, zoomButton.frame.size.width);
   minimizeButton.frame = NSMakeRect(minimizeButton.frame.origin.x+5, minimizeButton.frame.origin.y-12, minimizeButton.frame.size.height, minimizeButton.frame.size.width);  
}

- (IBAction)searched:(id)sender 
{
   NSString *searchString = [@"http://google.com/search?q=" stringByAppendingString:[sender stringValue]];

   [webView setMainFrameURL:searchString];
   
}

- (IBAction)forwardOrBackPressed:(id)sender 
{
   NSLog(@"%i", [sender selectedSegment]);
   if( [sender selectedSegment] == 0 )
   {
      [webView goBack];
   }
   else
   {
      [webView goForward];
   }
}
@end
