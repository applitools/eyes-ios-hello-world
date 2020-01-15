//
//  EyesEarlGreyTestsObjectiveC.m
//  UnitTests
//
//  Created by Anton Chuev on 14.01.2020.
//  Copyright © 2020 Applitools. All rights reserved.
//

#import <XCTest/XCTest.h>
@import EyesEarlGrey;

static const NSInteger SleepDurationInSeconds = 2;

@interface EyesEarlGreyTestsObjectiveC : XCTestCase

@end

@implementation EyesEarlGreyTestsObjectiveC

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Initialize configuration
    Configuration *config = [Configuration new];
    config.apiKey = @"YOUR_API_KEY";
    
    // Initialize the eyes SDK and set up with configuration.
    Eyes *eyes = [Eyes new];
    eyes.configuration = config;
    
    // Start the test.
    [eyes openWithApplicationName:@"Hello World!" testName:@"My first test using EyesEarlGrey SDK!"];
    
    // Visual checkpoint #1.
    [eyes checkWithTag:@"Hello!" andSettings:[[Target window] timeoutInSeconds:5]];
    
    // Click the "Click me!" button.
    [[EarlGrey selectElementWithMatcher:grey_buttonTitle(@"Click me!")]
     performAction:grey_tap()];
    // Wait small amount of time to make UI ready after tap.
    sleep(SleepDurationInSeconds);
    
    // Visual checkpoint #2.
    [eyes checkWithTag:@"Click!" andSettings:[Target window]];
    
    // Visual checkpoint #3
    [eyes checkWithTag:@"Thumb up" andSettings:[Target matcher:grey_accessibilityLabel(@"ThumbUpOrBugImageView")]];
    
    // Click the "Click me!" button to hide "Thumb up" image
    [[EarlGrey selectElementWithMatcher:grey_buttonTitle(@"Click me!")]
     performAction:grey_tap()];
    // Wait small amount of time to make UI ready after tap.
    sleep(SleepDurationInSeconds);
    
    // Tap on the "Simulate diffs" checkbox.
    [[EarlGrey selectElementWithMatcher:grey_accessibilityLabel(@"SimulateDiffsCheckbox")]
     performAction:grey_tap()];
    // Wait small amount of time to make UI ready after tap.
    sleep(SleepDurationInSeconds);
    
    // Visual checkpoint #4.
    [eyes checkWithTag:@"Simulate Differences!" andSettings:[Target window]];
    
    // Click the "Click me!" button.
    [[EarlGrey selectElementWithMatcher:grey_buttonTitle(@"Click me!")]
     performAction:grey_tap()];
    // Wait small amount of time to make UI ready after tap.
    sleep(SleepDurationInSeconds);
    
    // Visual checkpoint #5.
    [eyes checkWithTag:@"Bug has been found!" andSettings:[Target window]];
    
    // Visual checkpoint #6
    [eyes checkWithTag:@"Bug" andSettings:[Target matcher:grey_accessibilityLabel(@"ThumbUpOrBugImageView")]];
    
    // End visual testing.
    @try {
        // End visual testing.
        [eyes close:nil];
    } @finally {
        [eyes abortIfNotClosed];
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
