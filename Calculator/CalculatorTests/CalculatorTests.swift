//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김찬우 on 2021/03/29.
//

import XCTest
//@testable import net.yagom.Calculator
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var testDecimalCalculator = DecimalCalculator()
    
    override func setUpWithError() throws {
       
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is caled after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        test_divide_한자리정수_두개()
        test_multiply_한자리정수_두개()
        test_convertType_한자리정수입력()
        test_convertType_덧셈기호입력()
        test_calculate_덧셈_소수두개()
        test_showTopOfStack_최대자리수_입력했을때_확인()
    }
    
    func test_divide_한자리정수_두개() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(testDecimalCalculator.divide(1, by: 2), 0)
    }
    
    func test_divide_소수를_영으로나누기() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(testDecimalCalculator.divide(1.23, by: 0), 0)
    }
    
    func test_multiply_한자리정수_두개() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(testDecimalCalculator.multiply(1, by: 2), 2)
    }
    
    func test_convertType_한자리정수입력() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(testDecimalCalculator.convertType(inputNumber: "1"), 1)
    }
    
    func test_convertType_덧셈기호입력() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(testDecimalCalculator.convertType(inputOperator: "+"), .addition)
    }
    
    func test_convertType_아무기호입력() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(testDecimalCalculator.convertType(inputOperator: "="), nil)
    }
    
    func test_calculate_덧셈_소수두개() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(testDecimalCalculator.calculate(operateSign: "+", operatedNumber: 12.34, operatingNumber: 56.78), 69.12)
    }
    
    func test_showTopOfStack_최대자리수_입력했을때_확인() {
        testDecimalCalculator = DecimalCalculator()
        testDecimalCalculator.stack.push(10e9)
//        testDecimalCalculator = DecimalCalculator(list: [10e9])
        XCTAssertEqual(testDecimalCalculator.showTopOfStack(), 0)
    }
    
    
}

// cmd u 눌렀더니 저래됐지요

