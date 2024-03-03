// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

import XCTest
import EyesImages
@testable import HelloWorldiOS

class EyesImagesTests: XCTestCase {

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

        // Uncomment the following line on a second run, to simulate a difference
        // try viewController().didTapSimulateDifferences()

        // Create the image
        let image = try takeWindowScreenshot()
        
        // Visual validation.
        eyes.check(withTag: "Main Screen", andSettings: Target.image(image))

        // End visual testing.
        eyes.closeAsync()
        let results = eyes.getAllTestResults()
        print(results)
    }

}

// Image creation helper functions
private extension EyesImagesTests {
    func takeWindowScreenshot() throws -> UIImage { try keyWindow().scaledImage() }
    func keyWindow() throws -> UIWindow { try XCTUnwrap(UIApplication.shared.windows.last(where: \.isKeyWindow)) }
    func viewController() throws -> ViewController { try XCTUnwrap(keyWindow().rootViewController as? ViewController) }
}

private extension UIView {
    func scaledImage() -> UIImage {
        UIGraphicsImageRenderer(bounds: bounds, format: UIGraphicsImageRendererFormat(for: .init(displayScale: 1)))
            .image { layer.render(in: $0.cgContext) }
    }
}
