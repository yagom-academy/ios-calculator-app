//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 천수현 on 2021/03/29.
//

import XCTest

class DecimalCalculatorTests: XCTestCase {
    private var decimalCalculatorTest: DecimalCalculator?
    
    override func setUpWithError() throws {
        decimalCalculatorTest = DecimalCalculator()
    }

    override func tearDownWithError() throws {
        decimalCalculatorTest = nil
    }

    func test_add() {
        let result1 = decimalCalculatorTest?.add(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, 300)
        
        let result2 = decimalCalculatorTest?.add(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, -100)
        
//        let result3 = decimalCalculatorTest?.add(firstNumber: 900000000, secondNumber: 200000000)
//        XCTAssertEqual(result3, 100000000)
        
        let result4 = decimalCalculatorTest?.add(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(result4, 100)
        
        let result5 = decimalCalculatorTest?.add(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(result5, 444.444)
        
//        let result6 = decimalCalculatorTest?.add(firstNumber: 10.5, secondNumber: -11.8)
//        XCTAssertEqual(result6, -1.3)
    }
    
    func test_subtract() {
        let result1 = decimalCalculatorTest?.subtract(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, -100)
        
        let result2 = decimalCalculatorTest?.subtract(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, 300)
        
        let result3 = decimalCalculatorTest?.subtract(firstNumber: 900000000, secondNumber: 200000000)
        XCTAssertEqual(result3, 700000000)
        
        let result4 = decimalCalculatorTest?.subtract(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(result4, 100)
        
//        let result5 = decimalCalculatorTest?.subtract(firstNumber: 123.123, secondNumber: 321.321)
//        XCTAssertEqual(result5, -198.198)
        
        let result6 = decimalCalculatorTest?.subtract(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, 22.3)
    }

    func test_multiply() {
        let result1 = decimalCalculatorTest?.multiply(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, 20000)
        
        let result2 = decimalCalculatorTest?.multiply(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, -20000)
        
        let result3 = decimalCalculatorTest?.multiply(firstNumber: 10000, secondNumber: 100000)
        XCTAssertEqual(result3, 1000000000)
        
        let result4 = decimalCalculatorTest?.multiply(firstNumber: 100, secondNumber: 0)
        XCTAssertEqual(result4, 0)
        
//        let result5 = decimalCalculatorTest?.multiply(firstNumber: 123.123, secondNumber: 321.321)
//        XCTAssertEqual(result5, 39562.005483)
        
        let result6 = decimalCalculatorTest?.multiply(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, -123.9)
    }
    
    func test_divide() {
        let result1 = decimalCalculatorTest?.divide(firstNumber: 100, secondNumber: 200)
        XCTAssertEqual(result1, 0.5)
        
        let result2 = decimalCalculatorTest?.divide(firstNumber: 100, secondNumber: -200)
        XCTAssertEqual(result2, -0.5)
        
        let result3 = decimalCalculatorTest?.divide(firstNumber: 10000, secondNumber: 100000)
        XCTAssertEqual(result3, 0.1)
        
//        let result4 = decimalCalculatorTest?.divide(firstNumber: 100, secondNumber: 0)
//        XCTAssertEqual(result4, )
        
        let result5 = decimalCalculatorTest?.divide(firstNumber: 123.123, secondNumber: 321.321)
        XCTAssertEqual(result5, 0.38317757009345793)
        
        let result6 = decimalCalculatorTest?.divide(firstNumber: 10.5, secondNumber: -11.8)
        XCTAssertEqual(result6, -0.8898305084745762)
    }
    
    func test_reset() {
        decimalCalculatorTest?.reset()
        XCTAssertTrue(decimalCalculatorTest?.stack.isEmpty == true)
    }
}
