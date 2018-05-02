//
//  ObjectiveCTestExample.m
//  UITests
//
//  Created by Anton Chuev on 5/2/18.
//  Copyright © 2018 Applitools. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <EyesXCUI/EyesXCUI.h>

@interface ObjectiveCTestExample : XCTestCase

@end

@implementation ObjectiveCTestExample

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)testExample {
    // Initialize the eyes SDK and set your private API key.
    Eyes *eyes = [Eyes new];
    eyes.apiKey = @"STRSWItF105WBCWET8wAdWLMXft9pSQzeEBotIcoYZHNI110";
    
    // Start the test.
    [eyes openWithApplicationName:@"Hello World!" testName:@"My first test using EyesXCUI SDK!"];
    
    // Visual checkpoint #1.
    [eyes checkWithTag:@"Hello!" andSettings:[[Target window] timeoutInSeconds:5]];
    
    // Click the "Click me!" button.
    [[XCUIApplication new].buttons[@"Click me!"] tap];
    
    // Visual checkpoint #2.
    [eyes checkWindowWithTag:@"Click!"];
    
    NSError *error = nil;
    [eyes close:&error];
    if ( error ) {
        [eyes abortIfNotClosed];
        XCTAssertNil(error);
    }
}

@end
