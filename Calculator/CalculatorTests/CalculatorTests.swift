//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Yongwoo Marco on 2021/06/28.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var sut = Calculator()
    var testCases: Array<[String]> = []
    
    func switchFunction(_ pushItems: Array<String>) {
        for item in pushItems {
            switch item {
            case "+":
                sut.pushNumberOrOperator(Operator(type: .addition))
            case "-":
                sut.pushNumberOrOperator(Operator(type: .subtraction))
            case "*":
                sut.pushNumberOrOperator(Operator(type: .mulitplication))
            case "/":
                sut.pushNumberOrOperator(Operator(type: .division))
            default:
                guard let doubleNumber = Double(item) else {
                    return
                }
                sut.pushNumberOrOperator(Operand(value: doubleNumber))
            }
        }
    }
    override func setUp() {
        super.setUp()
        testCases = [
            ["1", "+", "2", "+", "3"],
            ["1", "*", "2", "*", "3"],
            ["1", "-", "2", "-", "3"],
            ["1", "/", "2"],
            ["1", "*", "3", "+", "2", "/", "2"],
            ["1", "*", "3", "+", "2", "/", "0"],
            ["10.1", "+", "12.5", "/", "125", "+", "8", "-", "100", "*", "13.8"]
        ]
    }
    // ["1", "+", "2", "+", "3"]
    func testMakeCalculate함수_더하기연산만사용_실패() throws {
        switchFunction(testCases[0])
        
        let result = try sut.makeCalculation()
        let expectedValue = 10.0

        XCTAssertNotEqual(result, expectedValue)
    }
    func testMakeCalculate함수_더하기연산만사용_성공() throws {
        switchFunction(testCases[0])
        
        let result = try sut.makeCalculation()
        let expectedValue = 6.0

        XCTAssertEqual(result, expectedValue)
    }
    // ["1", "*", "2", "*", "3"]
    func testMakeCalculate함수_곱하기연산만사용_실패() throws {
        switchFunction(testCases[1])
        
        let result = try sut.makeCalculation()
        let expectedValue = 10.0

        XCTAssertNotEqual(result, expectedValue)
    }
    func testMakeCalculate함수_곱하기연산만사용_성공() throws {
        switchFunction(testCases[1])
        
        let result = try sut.makeCalculation()
        let expectedValue = 6.0

        XCTAssertEqual(result, expectedValue)
    }
    // ["1", "-", "2", "-", "3"]
    func testMakeCalculate함수_빼기연산만사용_실패() throws {
        switchFunction(testCases[2])
        
        let result = try sut.makeCalculation()
        let expectedValue = 6.0

        XCTAssertNotEqual(result, expectedValue)
    }
    func testMakeCalculate함수_빼기연산만사용_성공() throws {
        switchFunction(testCases[2])
        
        let result = try sut.makeCalculation()
        let expectedValue = -4.0

        XCTAssertEqual(result, expectedValue)
    }
    // ["1", "/", "2"]
    func testMakeCalculate함수_나누기연산만사용제수가0아님_실패() throws {
        switchFunction(testCases[3])
        
        let result = try sut.makeCalculation()
        let expectedValue = 2.0

        XCTAssertNotEqual(result, expectedValue)
    }
    func testMakeCalculate함수_나누기연산만사용제수가0아님_성공() throws {
        switchFunction(testCases[3])
        
        let result = try sut.makeCalculation()
        let expectedValue = 0.5

        XCTAssertEqual(result, expectedValue)
    }
    // ["1", "*", "3", "+", "2", "/", "2"]
    func testMakeCalculate함수_우선순위가섞인연산사용_실패() throws {
        switchFunction(testCases[4])
        
        let result = try sut.makeCalculation()
        let expectedValue = 2.5

        XCTAssertNotEqual(result, expectedValue)
    }
    func testMakeCalculate함수_우선순위가섞인연산사용_성공() throws {
        switchFunction(testCases[4])
        
        let result = try sut.makeCalculation()
        let expectedValue = 4.0

        XCTAssertEqual(result, expectedValue)
    }
    // ["1", "*", "3", "+", "2", "/", "0"]
    func testMakeCalculate함수_우선순위가섞인연산과제수가0인나누기연산_실패() throws {
        switchFunction(testCases[5])

        XCTAssertNoThrow(try sut.makeCalculation())
    }
    func testMakeCalculate함수_우선순위가섞인연산과제수가0인나누기연산_성공() throws {
        switchFunction(testCases[5])

        XCTAssertThrowsError(try sut.makeCalculation())
    }
    // ["10.1", "+", "12.5", "/", "125", "+", "8", "-", "100", "*", "13.8"]
    func testMakeCalculate함수_실수의우선순위가섞인연산_실패() throws {
        switchFunction(testCases[6])
        
        let result = try sut.makeCalculation()
        let expectedValue = -1267.10496

        XCTAssertNotEqual(result, expectedValue)
    }
    func testMakeCalculate함수_실수의우선순위가섞인연산_성공() throws {
        switchFunction(testCases[6])
        
        let result = try sut.makeCalculation()
        let expectedValue = -1361.8

        XCTAssertEqual(result, expectedValue)
    }
}
