//
//  EyesImagesTestsSwift.swift
//  UnitTests
//
//  Created by Anton Chuev on 14.01.2020.
//  Copyright © 2020 Applitools. All rights reserved.
//

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
        let eyes: Eyes = Eyes()

        // Initialize the eyes SDK and set your private API key.
        eyes.apiKey = "YOUR_API_KEY"

        do {
            // Start the test
            eyes.open(withApplicationName: "Applitools site", testName: "iOS Screenshot test!")

            // Load page image and validate.
            guard let url: URL = URL.init(string: "https://applitools.com/tutorials/applitools.jpg") else {
                return
            }
            guard let imageData: Data = try? Data(contentsOf: url) else {
                return
            }

            guard let image: UIImage = UIImage(data: imageData) else {
                return
            }

            // Visual validation.
            eyes.check(withTag: "Applitools!", andSettings: Target.image(image))

            // End visual UI testing.
            do {
                try eyes.close()
            } catch {
                eyes.abortIfNotClosed()
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
