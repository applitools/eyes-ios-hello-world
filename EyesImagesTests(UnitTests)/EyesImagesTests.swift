// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

import XCTest
import EyesImages
@testable import HelloWorldiOS

@MainActor class EyesImagesTests: XCTestCase {

    var viewController: ViewController!

    /* Initialize the Eyes SDK */

    static let eyes = Eyes()
    var eyes: Eyes { Self.eyes }
    static let batch: BatchInfo = .init(name: "HelloWorld / XCTest")

    override class func setUp() {
        let configuration = Configuration()
        configuration.batch = batch
        configuration.apiKey =  <#YOUR_API_KEY#>  /* Set your private API key */

        /* Optionally, add a device target to render, independently of the actual simulator or device the test runs on. */
        //         configuration.addMultiDeviceTarget(IosMultiDeviceTarget.iPhone12())

        eyes.configuration = configuration
    }

    override func setUp() async throws {
        /* Setup your view controller */

        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController
        let window = try XCTUnwrap((UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.last)
        window.rootViewController = viewController
    }


    func testMainScreen() async throws {
        /* Uncomment the following line on a second run, to simulate a difference */
//        viewController.didTapSimulateDifferences()

        try await eyes.test(settings: Target.window())
    }

    func testRandomNumber() async throws {
        viewController.didTapGenerateRandomNumber()

        var viewsToIgnore: [UIView] = []

        /* Uncomment the following line on a third run, to ignore the difference */
//        viewsToIgnore.append(viewController.randomNumberLabel)

        try await eyes.test(settings: Target.window().ignore(viewsToIgnore))
    }

}
