// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

import XCTest
import EyesImages

class EyesImagesTestsSwift: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let eyes = Eyes()

        // Initialize the eyes SDK and set your private API key.
        eyes.apiKey = <#YOUR_API_KEY#>

        // Start the test
        eyes.open(withApplicationName: "Applitools site", testName: "iOS Screenshot test!")

        // Load image
        guard
            let url = URL(string: "https://applitools.com/blog/wp-content/uploads/2013/11/app-is-live-nov-2013.png"),
            let imageData = try? Data(contentsOf: url),
            let image = UIImage(data: imageData)
        else {
            eyes.abortIfNotClosed()
            return
        }

        // Visual validation.
        eyes.check(image, tag: "Applitools!")

        // End visual testing.
        do {
            try eyes.close()
        } catch {
            eyes.abortIfNotClosed()
        }
    }

}
