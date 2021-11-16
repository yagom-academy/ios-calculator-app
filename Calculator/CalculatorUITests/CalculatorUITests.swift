//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by 박병호 on 2021/11/15.
//

import XCTest

class CalculatorUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
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
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["0"].tap()
        app.buttons["00"].tap()
        app.buttons["."].tap()
        
    }
    
    func test_연산자버튼_누르면_스크롤뷰로_올라간다() {
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["×"].tap()
        app.buttons["4"].tap()
        app.buttons["2"].tap()
    }
    
    func test_1_2_곱하기_4_2_이퀄_버튼을_차례대로_탭하면_504가_출력된다() {
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["×"].tap()
        app.buttons["4"].tap()
        app.buttons["2"].tap()
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
