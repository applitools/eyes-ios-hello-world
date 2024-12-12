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

        /* Run once to create a baseline, a second time to generate a checkpoint with a difference,
         then uncomment the following line on a 3rd run to ignore the difference */
//        viewsToIgnore.append(viewController.randomNumberLabel)

        try await eyes.test(settings: Target.window().ignore(viewsToIgnore))
    }

    /*
     eyes.test() performs one visual validation, wrapped in a concise API that automatically creates a test.
     When more steps are needed, use eyes.open(), eyes.check() for each step, then eyes.close().
     */
    func testTwoSteps() async throws {
        /* Create the test */
        eyes.open(withApplicationName: "HelloWorld", testName: "Two steps")

        /* Perform two checks */
        try await eyes.check(withTag: "Before tap", andSettings: Target.window())
        viewController.tapMeButtonTapped(sender: nil)
        try await eyes.check(withTag: "After tap", andSettings: Target.window())

        /* Validate and close the test */
        try eyes.close()
    }
}
