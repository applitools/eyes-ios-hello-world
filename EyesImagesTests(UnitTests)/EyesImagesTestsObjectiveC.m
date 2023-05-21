// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

#import <XCTest/XCTest.h>
@import EyesImages;

@interface EyesImagesTestsObjectiveC : XCTestCase

@end

@implementation EyesImagesTestsObjectiveC

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    Eyes *eyes = [Eyes new];
    eyes.apiKey = @"<#YOUR_API_KEY#>";
    
    // Start the test
    [eyes openWithApplicationName:@"Applitools site" testName:@"iOS Screenshot test!"];
    
    // Load image
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://applitools.com/blog/wp-content/uploads/2013/11/app-is-live-nov-2013.png"]];
    UIImage *image = [UIImage imageWithData:imageData];
    
    // Visual validation.
    [eyes checkImage:image tag:@"Applitools!"];
    
    // End visual testing.
    @try {
        [eyes close:nil];
    } @finally {
        [eyes abortIfNotClosed];
    }
}

@end
