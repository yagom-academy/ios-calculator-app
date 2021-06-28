//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Kim Do hyung on 2021/06/25.
//

import XCTest
import Foundation
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    func test_1_plus_2_plus_3_equal_6() {
        let testcase = ["1","+","2","+","3"]
        let sut: Calculator = Calculator(inputNotation: testcase)
        XCTAssertEqual(Double(6), try sut.runCalculator())
    }
    
    func test_1_multiply_2_multiply_3_equal_6() {
        let testcase = ["1","*","2","*","3"]
        let sut: Calculator = Calculator(inputNotation: testcase)
        XCTAssertEqual(Double(6), try sut.runCalculator())
    }
    
    func test_1_minus_2_minus_3_equal_minusOf4() {
        let testcase = ["1","-","2","-","3"]
        let sut: Calculator = Calculator(inputNotation: testcase)
        XCTAssertEqual(Double(-4), try sut.runCalculator())
    }
    
    func test_1_divide_2_divide_3_equal_0point16667() {
        let testcase = ["1","/","2","/","3"]
        let sut: Calculator = Calculator(inputNotation: testcase)
        XCTAssertEqual(Double(0.16667), try round(sut.runCalculator()*100000)/100000)
    }
    
    func test_1_mutipuly_3_plus_2_divide_2_equal_4() {
        let testcase = ["1","*","3","+","2","/","2"]
        let sut: Calculator = Calculator(inputNotation: testcase)
        XCTAssertEqual(Double(4), try sut.runCalculator())
    }
    
    func test_1_multiply_3_plus_2_divide_0_equal_error() {
        let testcase = ["1","*","3","+","2","/","0"]
        let sut: Calculator = Calculator(inputNotation: testcase)
        XCTAssertThrowsError(try sut.runCalculator()) { (error) in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.dividedByZero)
        }
    }
    
    func test_10point1_plus_12point5_divide_125_plus_8_minus_100_multiply_13point8_equal_minusOf1361point8() {
        let testcase = ["10.1","+","12.5","/","125","+","8","-","100","*","13.8"]
        let sut: Calculator = Calculator(inputNotation: testcase)
        XCTAssertEqual(Double(-1361.8), try sut.runCalculator())
    }
}
