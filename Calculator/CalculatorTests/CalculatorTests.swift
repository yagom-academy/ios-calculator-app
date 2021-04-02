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
        test_convertType_한자리양의정수_입력()
        test_convertType_한자리음의정수_입력()
        test_convertType_덧셈기호입력()
        test_convertType_의도하지않은입력()
        test_calculate_덧셈_소수두개()
        test_showTopOfStack_최대자리수_입력했을때_확인()
    }
    
    func test_divide_한자리정수_두개() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(try? testDecimalCalculator.divide(1, by: 2), 0.5)
    }
    
    func test_divide_소수를_영으로나누기() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(try? testDecimalCalculator.divide(1.23, by: 0), nil)
    }
    
    func test_multiply_한자리정수_두개() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(testDecimalCalculator.multiply(1, by: 2), 2)
    }
    
    func test_convertType_한자리양의정수_입력() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(try testDecimalCalculator.convertType(inputNumber: "1"), 1)
    }
    
    func test_convertType_한자리음의정수_입력() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(try testDecimalCalculator.convertType(inputNumber: "-1"), -1)
    }
    
    func test_convertType_덧셈기호입력() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(try testDecimalCalculator.convertType(inputOperator: "+"), .addition)
    }
    
    func test_convertType_의도하지않은입력() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertThrowsError(try testDecimalCalculator.convertType(inputOperator: "=")) { (error) in
            XCTAssertEqual(error as! DecimalCalculatorError, DecimalCalculatorError.notAvailableOperator)
        }
    }
    
    func test_calculate_덧셈_소수두개() {
        testDecimalCalculator = DecimalCalculator()
        XCTAssertEqual(try testDecimalCalculator.calculate(operateSign: "+", operatedNumber: 12.34, operatingNumber: 56.78), 69.12)
    }
    
    func test_showTopOfStack_최대자리수_입력했을때_확인() {
        testDecimalCalculator = DecimalCalculator()
        testDecimalCalculator.stack.push(10e9)
        XCTAssertEqual(testDecimalCalculator.showTopOfStack(), 0)
    }
}

