//
//  HelloWorldUITestsObjectiveC.m
//  HelloWorldUITestsObjectiveC
//
//  Created by Anton Chuev on 2/28/18.
//  Copyright © 2018 Applitools. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <EyesXCUI/Eyes.h>

@interface HelloWorldUITestsObjectiveC : XCTestCase

@end

@implementation HelloWorldUITestsObjectiveC

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Initialize the eyes SDK and set your private API key.
    Eyes *eyes = [Eyes new];
    eyes.apiKey = @"STRSWItF105WBCWET8wAdWLMXft9pSQzeEBotIcoYZHNI110";
    
    // Start the test.
    [eyes openWithApplicationName:@"Hello World!" testName:@"My first Selenium Java test!!!!!!!!"];
    
    // Visual checkpoint #1.
    [eyes checkWindowWithTag:@"Hello!"];
    
    // Click the "Click me!" button.
    [[XCUIApplication new].buttons[@"Click me!"] tap];
    
    // Visual checkpoint #2.
    [eyes checkWindowWithTag:@"Click!"];
    
    @try {
        // End the test.
        [eyes close];
    } @finally {
        // If the test was aborted before eyes.close was called, ends the test as aborted.
        [eyes abortIfNotClosed];
    }
}

@end
