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

    func testExample() throws {
        // Initialize the eyes SDK and set your private API key.
        let eyes = Eyes()
        eyes.apiKey = <#YOUR_API_KEY#>

        // Start the test
        eyes.open(withApplicationName: "Hello World iOS", testName: "iOS Screenshot test!")

        // Create image
        let view = try XCTUnwrap(UIApplication.shared.keyWindow?.rootViewController?.view)
        let format = UIGraphicsImageRendererFormat(for: .init(displayScale: 1))
        let image = UIGraphicsImageRenderer(bounds: view.bounds, format: format).image {
            view.layer.render(in: $0.cgContext)
        }

        // Visual validation.
        eyes.check(image, tag: "Main Screen")

        // End visual testing.
        try eyes.close()
    }

}
