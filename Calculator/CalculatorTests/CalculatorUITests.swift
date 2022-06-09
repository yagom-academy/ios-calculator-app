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

    func test_1과1을_더해서_2가나온다() {
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
    
    func test_2과_4를_곱해서_8이_반환된다() {
        // given
        let two = app.buttons["Two"]
        let four = app.buttons["Four"]
        let multiply = app.buttons["Multiply"]
        let result = app.buttons["Result"]
        let expactation = "8"
        let resultLabel = app.staticTexts["Operand"]
        
        // when
        two.tap()
        multiply.tap()
        four.tap()
        result.tap()
        
        // then
        XCTAssertEqual(resultLabel.label, expactation)
    }
    
    func test_6을_3으로_나눠서_2를_반환한다() {
        // given
        let six = app.buttons["Six"]
        let three = app.buttons["Three"]
        let divide = app.buttons["Divide"]
        let result = app.buttons["Result"]
        let expactation = "2"
        let resultLabel = app.staticTexts["Operand"]
        
        // when
        six.tap()
        divide.tap()
        three.tap()
        result.tap()
        
        // then
        XCTAssertEqual(resultLabel.label, expactation)
    }
    
    func test_3에서_10을_빼서_마이너스7를_반환한다() {
        // given
        let three = app.buttons["Three"]
        let one = app.buttons["One"]
        let zero = app.buttons["Zero"]
        let substract = app.buttons["Substract"]
        let result = app.buttons["Result"]
        let expactation = "-7"
        let resultLabel = app.staticTexts["Operand"]
        
        // when
        three.tap()
        substract.tap()
        one.tap()
        zero.tap()
        result.tap()
        
        // then
        XCTAssertEqual(resultLabel.label, expactation)
    }
    
    func test_3빼기_1_중_All_Clear_를_누르면_다_지워진다() {
        // given
        let three = app.buttons["Three"]
        let one = app.buttons["One"]
        let substract = app.buttons["Substract"]
        let allClear = app.buttons["AllClear"]
        let expectationOperandText = app.staticTexts["OperandLabel"].label
        let expectationOperatorText = app.staticTexts["OperatorLabel"].label
      
        // when
        three.tap()
        substract.tap()
        one.tap()
        allClear.tap()
        
        // then
        let resultOperand = "0"
        let resultOperator = " "
        
        XCTAssertEqual(resultOperand, expectationOperandText)
        XCTAssertEqual(resultOperator, expectationOperatorText)
    }
    
    func test_사칙연산중에_clear_entry_버튼으로_마지막_피연산자를_제거한다() {
        // given
        let three = app.buttons["Three"]
        let one = app.buttons["One"]
        let substract = app.buttons["Substract"]
        let clearEntry = app.buttons["CE"]
        let expectation = "0"
        // when
        three.tap()
        substract.tap()
        one.tap()
        three.tap()
        clearEntry.tap()
        
        // then
        let result = app.staticTexts["Operand"].label
        XCTAssertEqual(result, expectation)
    }
    
    func test_3_더하기_마이너스_3은_0을_반환한다() {
        // given
        let three = app.buttons["Three"]
        let add = app.buttons["Add"]
        let plusMinus = app.buttons["PlusMinus"]
        let resultButton = app.buttons["="]
        let expectation = "0"
        // when
        three.tap()
        add.tap()
        three.tap()
        plusMinus.tap()
        resultButton.tap()
        
        // then
        let result = app.staticTexts["Operand"].label
        XCTAssertEqual(result, expectation)
    }
    
    func test_10_나누기_0_은_NaN을_반환한다() {
        // given
        let one = app.buttons["1"]
        let zero = app.buttons["0"]
        let divide = app.buttons["Divide"]
        let resultButton = app.buttons["="]
        let expectation = "NaN"
        
        // when
        one.tap()
        zero.tap()
        divide.tap()
        zero.tap()
        resultButton.tap()
        
        // then
        let result = app.staticTexts["Operand"].label
        XCTAssertEqual(result, expectation)
    }
    
    func test_결과값_NaN이_반환되고_연산자클릭시_Stack에_쌓이지_않는다() {
        // given
        let one = app.buttons["1"]
        let zero = app.buttons["0"]
        let divide = app.buttons["Divide"]
        let add = app.buttons["Add"]
        let resultButton = app.buttons["="]
        let expectation = "NaN"
        
        // when
        one.tap()
        zero.tap()
        divide.tap()
        zero.tap()
        resultButton.tap()
        add.tap()
    }
    
    func test_0에_minus부호가_붙지않는다() {
        // given
        let plusMinus = app.buttons["⁺⁄₋"]
        let expectation = "0"
        
        // when
        plusMinus.tap()
        
        // then
        let result = "0"
        XCTAssertEqual(result, expectation)
    }
    
    func test_0에서_소수점_00일때_마이너스부호가_붙지않는다() {
        // given
        let zero = app.staticTexts["0"]
        let dot = app.buttons["."]
        let plusMinus = app.buttons["⁺⁄₋"]
        let expectation = "0"
        
        // when
        dot.tap()
        zero.tap(withNumberOfTaps: 4, numberOfTouches: 4)
        plusMinus.tap()
        
        // then
        let result = "0"
        XCTAssertEqual(result, expectation)
    }
}
