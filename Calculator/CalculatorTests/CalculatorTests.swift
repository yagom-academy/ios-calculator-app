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
        testDecimalCalculator = DecimalCalculator()
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is caled after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        test_devide_한자리정수_두개()
        test_multiply_한자리정수_두개()
        test_convertType_일을입력했을때_return값확인()
        test_convertType_플러스를입력했을때_return값확인()
        test_calculate_플러스를입력했을때_return값확인()
    }
    
    func test_devide_한자리정수_두개() {
        XCTAssertEqual(testDecimalCalculator.divide(1, by: 2), 0.5)
    }
    
    func test_multiply_한자리정수_두개() {
        XCTAssertEqual(testDecimalCalculator.multiply(1, by: 2), 2)
    }
    
    func test_convertType_일을입력했을때_return값확인() {
        XCTAssertEqual(testDecimalCalculator.convertType(inputNumber: "1"), 1)
    }
    
    func test_convertType_플러스를입력했을때_return값확인() {
        XCTAssertEqual(testDecimalCalculator.convertType(inputOperator: "+"), .addition)
    }
    
    func test_calculate_플러스를입력했을때_return값확인() {
        XCTAssertEqual(testDecimalCalculator.calculate(operateSign: "+", operatedNumber: 1, operatingNumber: 1), 2)
    }
    

}

