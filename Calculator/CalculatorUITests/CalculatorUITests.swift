//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by 이정민 on 2022/09/29.
//

import XCTest

final class CalculatorUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        
        continueAfterFailure = false
    }
    
    func test_when_1_button_tapped_then_show_on_label() {
        // given
        let app = XCUIApplication()
        app.launch()
        
        let numberButton1 = app.buttons["1"]
        XCTAssertTrue(numberButton1.exists)
        
        // when
        numberButton1.tap()
        
        // then
        XCTAssertEqual(app.staticTexts["calculatorDisplayLabel"].label, "1")
    }
}
