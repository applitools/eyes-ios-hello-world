// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

@import XCTest;
@import EyesXCUI;

@interface EyesXCUITestsObjectiveC : XCTestCase
@property (strong, nonatomic) XCUIApplication *application;
@property (strong, nonatomic) Eyes *eyes;
@end

@implementation EyesXCUITestsObjectiveC

- (void)setUp {
    [super setUp];
    
    self.continueAfterFailure = NO;
    self.application = [[XCUIApplication alloc] init];
    [self.application launch];

    // Initialize configuration
    Configuration *config = [Configuration new];
    config.apiKey = @"<#YOUR_API_KEY#>";
    config.statusBarExists = YES;

    // Initialize the eyes SDK and set up with configuration.
    self.eyes = [Eyes new];
    self.eyes.configuration = config;
}

- (void)testExample {
    Eyes *eyes = self.eyes;

    // Start the test.
    [eyes openWithApplicationName:@"Hello World!" testName:@"My first test using EyesXCUI SDK!"];


    // Visual checkpoint #1.
    [eyes checkWithTag:@"Hello!" andSettings:[Target.window timeoutInSeconds:5]];
    
    XCUIElement *clickMeButton = self.application.buttons[@"Click me!"];
    // Click the "Click me!" button.
    [clickMeButton tap];

    // Visual checkpoint #2.
    [eyes checkWithTag:@"Click!" andSettings:Target.window];

    XCUIElement *thumbUpOrBugImageView = self.application.images[@"ThumbUpOrBugImageView"];
    XCTAssert(thumbUpOrBugImageView);

    // Visual checkpoint #3
    [eyes checkWithTag:@"Thumb up" andSettings:[Target element:thumbUpOrBugImageView]];

    // Tap on the "Simulate diffs" checkbox.
    [self.application.buttons[@"SimulateDiffsCheckbox"] tap];

    // Visual checkpoint #4.
    [eyes checkWithTag:@"Simulate Differences!" andSettings:Target.window];

    // Click the "Click me!" button.
    [clickMeButton tap];

    // Visual checkpoint #5.
    [eyes checkWithTag:@"Bug has been found!" andSettings:Target.window];

    // Visual checkpoint #6
    [eyes checkWithTag:@"Bug" andSettings:[Target element:thumbUpOrBugImageView]];


    // End visual testing.
    [eyes close:nil];
}

@end
