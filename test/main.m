#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSApplication* app = [NSApplication sharedApplication];
        id tmp = [AppDelegate alloc];
        AppDelegate* appDelegate = [tmp init];
        
        [app setDelegate:appDelegate];
        
        [app run];
    }
    
    return EXIT_SUCCESS;
}
