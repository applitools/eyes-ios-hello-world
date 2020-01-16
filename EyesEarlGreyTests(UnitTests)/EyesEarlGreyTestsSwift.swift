// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

import XCTest
import EyesEarlGrey

class EyesEarlGreyTestsSwift: XCTestCase {
    let sleepDurationInSeconds: UInt32 = 2
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Initialize configuration
        let config = Configuration()
        config.apiKey = "YOUR_API_KEY"
        
        // Initialize the eyes SDK and set up with configuration.
        let eyes = Eyes()
        eyes.configuration = config
        
        // Start the test.
        eyes.open(withApplicationName: "Hello World!", testName: "My first test using EyesEarlGrey SDK!")
        
        // Visual checkpoint #1.
        eyes.check(withTag: "Hello", andSettings: Target.window().timeout(inSeconds: 5))
        
        // Click the "Click me!" button.
        EarlGrey.selectElement(with: grey_buttonTitle("Click me!")).perform(grey_tap())
        // Wait small amount of time to make UI ready after tap.
        sleep(sleepDurationInSeconds)
        
        // Visual checkpoint #2.
        eyes.check(withTag: "Click!", andSettings: Target.window())
        
        // Visual checkpoint #3
        eyes.check(withTag: "Thumb up", andSettings: Target.matcher(grey_accessibilityLabel("ThumbUpOrBugImageView")))
        
        // Click the "Click me!" button to hide "Thumb up" image
        EarlGrey.selectElement(with: grey_buttonTitle("Click me!")).perform(grey_tap())
        // Wait small amount of time to make UI ready after tap.
        sleep(sleepDurationInSeconds)
        
        // Tap on the "Simulate diffs" checkbox.
        EarlGrey.selectElement(with: grey_accessibilityLabel("SimulateDiffsCheckbox")).perform(grey_tap())
        // Wait small amount of time to make UI ready after tap.
        sleep(sleepDurationInSeconds);
        
        // Visual checkpoint #4.
        eyes.check(withTag: "Simulate Differences!", andSettings: Target.window())
        
        // Click the "Click me!" button.
        EarlGrey.selectElement(with: grey_buttonTitle("Click me!")).perform(grey_tap())
        // Wait small amount of time to make UI ready after tap.
        sleep(sleepDurationInSeconds)
        
        // Visual checkpoint #5.
        eyes.check(withTag: "Bug has been found!", andSettings: Target.window())
        
        // Visual checkpoint #6
        eyes.check(withTag: "Bug", andSettings: Target.matcher(grey_accessibilityLabel("ThumbUpOrBugImageView")))
        
        // End visual testing.
        do {
            try eyes.close()
        } catch {
            eyes.abortIfNotClosed()
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
