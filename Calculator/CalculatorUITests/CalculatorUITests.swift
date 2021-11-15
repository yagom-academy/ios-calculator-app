//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by 박병호 on 2021/11/15.
//

import XCTest

class CalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_숫자버튼_누르면_inputedOperandLabel_에_추가된다() {
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["1"]/*[[".buttons[\"1\"].staticTexts[\"1\"]",".staticTexts[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["2"]/*[[".buttons[\"2\"].staticTexts[\"2\"]",".staticTexts[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["3"]/*[[".buttons[\"3\"].staticTexts[\"3\"]",".staticTexts[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["4"]/*[[".buttons[\"4\"].staticTexts[\"4\"]",".staticTexts[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["5"]/*[[".buttons[\"5\"].staticTexts[\"5\"]",".staticTexts[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["8"]/*[[".buttons[\"8\"].staticTexts[\"8\"]",".staticTexts[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["9"]/*[[".buttons[\"9\"].staticTexts[\"9\"]",".staticTexts[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["0"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["00"]/*[[".buttons[\"00\"].staticTexts[\"00\"]",".staticTexts[\"00\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["."].tap()
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
