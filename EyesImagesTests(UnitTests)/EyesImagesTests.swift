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
#if os(visionOS)
        let OS = "visionOS"
#else
        let OS = "iOS"
#endif
        eyes.open(withApplicationName: "Hello World \(OS)", testName: "\(OS) Screenshot test!")

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

private extension UIWindow {
    func scaledImage() -> UIImage {
        let size = bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
#if os(visionOS)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(gray: 0.5, alpha: 1)
        context?.fill([CGRect(origin: .zero, size: size)])
#endif
        let rect = CGRect(origin: .zero, size: size)
        let remoteKeyboardWindowClass: AnyClass? = NSClassFromString("UIRemoteKeyboardWindow")
        for window in self.windowScene!.windows {
            if let klass = remoteKeyboardWindowClass, window.isKind(of: klass) {
                continue
            }
            window.drawHierarchy(in: rect, afterScreenUpdates: true)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
