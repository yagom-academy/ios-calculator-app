//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by 이정민 on 2022/09/29.
//

import XCTest

final class CalculatorUITests: XCTestCase {
    private var app: XCUIApplication!
    
    private var calculatorArchive: XCUIElement!
        
    private var numberDisplayLabel: XCUIElement!
    private var operatorLabel: XCUIElement!
    
    private var numberButton1: XCUIElement!
    private var numberButton2: XCUIElement!
    private var numberButton3: XCUIElement!
    private var numberButton4: XCUIElement!
    private var numberButton5: XCUIElement!
    private var numberButton6: XCUIElement!
    private var numberButton7: XCUIElement!
    private var numberButton8: XCUIElement!
    private var numberButton9: XCUIElement!
    private var numberButton0: XCUIElement!
    private var numberButton00: XCUIElement!
    private var dotButton: XCUIElement!
    
    private var addButton: XCUIElement!
    private var subtractButton: XCUIElement!
    private var multiplyButton: XCUIElement!
    private var divideButton: XCUIElement!
    
    private var changeSignButton: XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        
        calculatorArchive = app.staticTexts["calculatorArchive"]
        
        numberDisplayLabel = app.staticTexts["calculatorDisplayLabel"]
        operatorLabel = app.staticTexts["operatorDisplayLabel"]
        
        numberButton1 = app.buttons["1"]
        numberButton2 = app.buttons["2"]
        numberButton3 = app.buttons["3"]
        numberButton4 = app.buttons["4"]
        numberButton5 = app.buttons["5"]
        numberButton6 = app.buttons["6"]
        numberButton7 = app.buttons["7"]
        numberButton8 = app.buttons["8"]
        numberButton9 = app.buttons["9"]
        numberButton0 = app.buttons["0"]
        numberButton00 = app.buttons["00"]
        dotButton = app.buttons["."]
        
        addButton = app.buttons[String(Operator.add.rawValue)]
        subtractButton = app.buttons[String(Operator.subtract.rawValue)]
        multiplyButton = app.buttons[String(Operator.multiply.rawValue)]
        divideButton = app.buttons[String(Operator.divide.rawValue)]
        
        changeSignButton = app.buttons["⁺⁄₋"]
        
        app.launch()
        
        continueAfterFailure = false
    }
    
    func test_when_1_button_tapped_then_show_on_label() {
        // given
        
        // when
        numberButton1.tap()
        
        // then
        XCTAssertEqual(app.staticTexts["calculatorDisplayLabel"].label, "1")
    }
    
    func test_when_12345678_dot_0_00_9_tapped_then_show_12345678_dot_0009_on_label() {
        // given
        
        // when
        numberButton1.tap()
        numberButton2.tap()
        numberButton3.tap()
        numberButton4.tap()
        numberButton5.tap()
        numberButton6.tap()
        numberButton7.tap()
        numberButton8.tap()
        dotButton.tap()
        numberButton0.tap()
        numberButton00.tap()
        numberButton9.tap()
        
        // then
        XCTAssertEqual(numberDisplayLabel.label, "12345678.0009")
    }
    
    func test_when_1_add_2_subtract_3_multiply_4_divide_5_add_tapped_then_return_1_add_2_sub_3_mul_4_div_5_in_formula() {
        // given
        
        // when
        numberButton1.tap()
        addButton.tap()
        numberButton2.tap()
        subtractButton.tap()
        numberButton3.tap()
        multiplyButton.tap()
        numberButton4.tap()
        divideButton.tap()
        addButton.tap()
        
        // then
//        XCTAssertEqual(app., <#T##expression2: Equatable##Equatable#>)
    }
}
