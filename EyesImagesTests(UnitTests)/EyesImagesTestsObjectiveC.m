// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

@import XCTest;
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
    // Initialize the eyes SDK and set your private API key.
    Eyes *eyes = [Eyes new];
    eyes.apiKey = @"<#YOUR_API_KEY#>";
    
    // Start the test
    [eyes openWithApplicationName:@"Hello World iOS" testName:@"iOS Screenshot test!"];
    
    // Create image
    NSPredicate *isKeyWindow = [NSPredicate predicateWithFormat:@"isKeyWindow == YES"];
    UIView *view = [UIApplication.sharedApplication.windows filteredArrayUsingPredicate:isKeyWindow].lastObject;
    UIGraphicsImageRendererFormat *format = [UIGraphicsImageRendererFormat new];
    format.scale = 1;
    UIGraphicsImageRenderer *renderer = [[UIGraphicsImageRenderer alloc] initWithBounds:view.bounds format:format];
    UIImage *image = [renderer imageWithActions:^(UIGraphicsImageRendererContext *context) {
        [view.layer renderInContext:context.CGContext];
    }];

    // Visual validation.
    [eyes checkImage:image tag:@"Main Screen"];
    
    // End visual testing.
    [eyes close:nil];
}

@end
