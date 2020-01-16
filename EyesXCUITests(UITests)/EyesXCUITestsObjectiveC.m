// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

#import <XCTest/XCTest.h>
@import EyesXCUI;

static const NSInteger SleepDurationInSeconds = 2;

@interface EyesXCUITestsObjectiveC : XCTestCase

@property (strong, nonatomic) XCUIApplication *application;

@end

@implementation EyesXCUITestsObjectiveC

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    self.application = [[XCUIApplication alloc] init];
    [self.application launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)testExample {
    // Initialize configuration
     Configuration *config = [Configuration new];
     config.apiKey = @"YOUR_API_KEY";
     if (@available(iOS 13, *)) {
         config.statusBarExists = YES;
     }
     
     // Initialize the eyes SDK and set up with configuration.
     Eyes *eyes = [Eyes new];
     eyes.configuration = config;
     
     // Start the test.
     [eyes openWithApplicationName:@"Hello World!" testName:@"My first test using EyesXCUI SDK!"];
     
     // Visual checkpoint #1.
     [eyes checkWithTag:@"Hello!" andSettings:[[Target window] timeoutInSeconds:5]];
    
     XCUIElement *clickMeButton = self.application.buttons[@"Click me!"];
     // Click the "Click me!" button.
     [clickMeButton tap];
     // Wait small amount of time to make UI ready after tap.
     sleep(SleepDurationInSeconds);
     
     // Visual checkpoint #2.
     [eyes checkWithTag:@"Click!" andSettings:[Target window]];
     
     XCUIElement *thumbUpOrBugImageView = self.application.images[@"ThumbUpOrBugImageView"];
     XCTAssert(thumbUpOrBugImageView);
     
     // Visual checkpoint #3
     [eyes checkWithTag:@"Thumb up" andSettings:[Target element:thumbUpOrBugImageView]];
     
     // Click the "Click me!" button to hide "Thumb up" image
     [clickMeButton tap];
     // Wait small amount of time to make UI ready after tap.
     sleep(SleepDurationInSeconds);
     
     // Tap on the "Simulate diffs" checkbox.
     [self.application.otherElements[@"SimulateDiffsCheckbox"] tap];
     // Wait small amount of time to make UI ready after tap.
     sleep(SleepDurationInSeconds);
     
     // Visual checkpoint #4.
     [eyes checkWithTag:@"Simulate Differences!" andSettings:[Target window]];
     
     // Click the "Click me!" button.
     [clickMeButton tap];
     // Wait small amount of time to make UI ready after tap.
     sleep(SleepDurationInSeconds);
     
     // Visual checkpoint #5.
     [eyes checkWithTag:@"Bug has been found!" andSettings:[Target window]];
     
     // Visual checkpoint #6
     [eyes checkWithTag:@"Bug" andSettings:[Target element:thumbUpOrBugImageView]];
     
     // End visual testing.
     @try {
         // End visual testing.
         [eyes close:nil];
     } @finally {
         [eyes abortIfNotClosed];
     }
}

@end
