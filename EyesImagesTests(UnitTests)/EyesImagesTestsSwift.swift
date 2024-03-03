// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

import XCTest
import EyesImages
@testable import HelloWorldiOS

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

        // Uncomment the following section on a second run, to simulate a difference
        /*
        let window = try XCTUnwrap(UIApplication.shared.windows.last(where: \.isKeyWindow))

        let viewController = window.rootViewController as? ViewController
        viewController?.didTapSimulateDifferences()
        */

        let image = try takeWindowScreenshot()
        
        // Visual validation.
        eyes.check(withTag: "Main Screen", andSettings: Target.image(image))

        // End visual testing.
        eyes.closeAsync()
        let results = eyes.getAllTestResults()
        print(results)
    }

    func takeWindowScreenshot() throws -> UIImage {
        // Create image
        let view = try XCTUnwrap(UIApplication.shared.windows.last(where: \.isKeyWindow))
        let format = UIGraphicsImageRendererFormat(for: .init(displayScale: 1))
        let image = UIGraphicsImageRenderer(bounds: view.bounds, format: format).image {
            view.layer.render(in: $0.cgContext)
        }

        return image
    }
}
