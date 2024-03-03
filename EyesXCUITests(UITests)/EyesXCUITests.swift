// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

import XCTest
import EyesXCUI


class EyesXCUITests: XCTestCase {
    
    let application = XCUIApplication()
    let eyes = Eyes()

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        application.launch()

        // Initialize configuration
        let config = Configuration()
        config.apiKey = <#YOUR_API_KEY#>
        config.statusBarExists = true

        // Initialize the eyes SDK and set up with configuration.
        eyes.configuration = config
    }

    func testExample() throws {
        // Start the test.
        eyes.open(withApplicationName: "Hello World!", testName: "My first test using EyesXCUI SDK!")


        // Visual checkpoint #1.
        eyes.check(withTag: "Hello", andSettings: Target.window().timeout(inSeconds: 5))
        
        let clickMeButton = application.buttons["Click me!"]
        // Click the "Click me!" button.
        clickMeButton.tap()

        // Visual checkpoint #2.
        eyes.check(withTag: "Click!", andSettings: Target.window())
        
        let thumbUpOrBugImageView = application.images["ThumbUpOrBugImageView"]
        
        // Visual checkpoint #3
        eyes.check(withTag: "Thumb up", andSettings: Target.element(thumbUpOrBugImageView))
        
        // Tap on the "Simulate diffs" checkbox.
        application.buttons["SimulateDiffsCheckbox"].tap()

        // Visual checkpoint #4.
        eyes.check(withTag: "Simulate Differences!", andSettings: Target.window())
        
        // Click the "Click me!" button.
        clickMeButton.tap()

        // Visual checkpoint #5.
        eyes.check(withTag: "Bug has been found!", andSettings: Target.window())
        
        // Visual checkpoint #6
        eyes.check(withTag: "Bug", andSettings: Target.element(thumbUpOrBugImageView))
        

        // End the test.
        try eyes.close()
    }
}
