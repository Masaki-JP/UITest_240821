import XCTest

final class UITest_240821UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//
//        let num1TextField = app.textFields["num1TextField"]
//        let num2TextField = app.textFields["num2TextField"]
//        let calculateButton = app.buttons["Calculate"]
//        let sumLabel = app.staticTexts["sumLabel"]
//
//        num1TextField.tap()
//        num1TextField.typeText(.init(repeating: XCUIKeyboardKey.delete.rawValue, count: (num1TextField.value as? String)?.count ?? 0))
//        num1TextField.typeText("1")
//
//        num2TextField.tap()
//        num2TextField.typeText(.init(repeating: XCUIKeyboardKey.delete.rawValue, count: (num1TextField.value as? String)?.count ?? 0))
//        num2TextField.typeText("2")
//
//        XCTAssertFalse(sumLabel.exists)
//
//        calculateButton.tap()
//        XCTAssertEqual(sumLabel.label, "sum: 3")
//    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let picture = app.images["Picture"]
        XCTAssertTrue(picture.waitForExistence(timeout: 10.0))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
