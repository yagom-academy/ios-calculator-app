//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by LeeChiheon on 2022/06/02.
//

import XCTest

class CalculatorUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_1과1을_더해서_2가나온다() throws {
        // given
        let one = app.buttons["One"]
        let add = app.buttons["Add"]
        let result = app.buttons["Result"]
        let expactation = "2"
        let resultLabel = app.staticTexts["Operand"]
        
        // when
        one.tap()
        add.tap()
        one.tap()
        result.tap()
        
        // then
        XCTAssertEqual(resultLabel.label, expactation)
    }
}
