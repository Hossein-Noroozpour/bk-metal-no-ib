#import <Metal/Metal.h>

#import "AppDelegate.h"

#import "GameViewController.h"
#import "game.hpp"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (id)init {
    if (self = [super init]) {
        NSScreen* mainScreen = [NSScreen mainScreen];
        NSRect f = [mainScreen frame];
        
        NSRect frame = NSMakeRect(0, 0, mainScreen.frame.size.width / 2, mainScreen.frame.size.height / 2);
        
        NSUInteger styleMask =
        NSWindowStyleMaskTitled |
        NSWindowStyleMaskResizable |
        NSWindowStyleMaskClosable |
        NSWindowStyleMaskMiniaturizable;
        
        NSBackingStoreType backing = NSBackingStoreBuffered;
        
        
        window = [[NSWindow alloc] initWithContentRect:frame styleMask:styleMask backing:backing defer:YES];
        [window center];
        
        id<MTLDevice> my_device = MTLCreateSystemDefaultDevice();
        
        GameViewController* gvc = [[GameViewController alloc] init];
        gvc->my_device = my_device;
        
        MTKView* metalView = [[MTKView alloc] initWithFrame:frame device:my_device];
        
        [metalView setClearColor:MTLClearColorMake(0, 0, 0, 1)];
        [metalView setColorPixelFormat:MTLPixelFormatBGRA8Unorm];
        [metalView setDepthStencilPixelFormat:MTLPixelFormatDepth32Float];
        [metalView setDelegate:gvc];
        
        [gvc setView:metalView];
        
        [window setContentView:metalView];
        [window setContentViewController: gvc];
        [gvc viewDidLoad];
        
    }
    return self;
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    [window makeKeyAndOrderFront:self];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    //print();
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
