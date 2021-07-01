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
    
    func switchFunction(_ arr: Array<String>) {
        for i in arr {
            switch i {
            case "+":
                sut.enqueBehindNumberOrOperator(Operator(type: .addition))
            case "-":
                sut.enqueBehindNumberOrOperator(Operator(type: .subtraction))
            case "*":
                sut.enqueBehindNumberOrOperator(Operator(type: .mulitplication))
            case "/":
                sut.enqueBehindNumberOrOperator(Operator(type: .division))
            default:
                sut.enqueBehindNumberOrOperator(Operand(value: Double(i)!))
            }
        }
    }
    
    func testExample_1() throws {
        let infix = ["1", "+", "2", "+", "3"]
        switchFunction(infix)
        XCTAssertEqual(try sut.makeCalculation(), 6.0)
    }
    func testExample_2() throws {
        let infix = ["1", "*", "2", "*", "3"]
        switchFunction(infix)
        XCTAssertEqual(try sut.makeCalculation(), 6)
    }
    func testExample_3() throws {
        let infix = ["1", "-", "2", "-", "3"]
        switchFunction(infix)
        XCTAssertEqual(try sut.makeCalculation(), -4)
    }
    func testExample_4() throws {
        let infix = ["1", "/", "2"]
        switchFunction(infix)
        XCTAssertEqual(try sut.makeCalculation(), 0.5)
    }
    func testExample_5() throws {
        let infix = ["1", "*", "3", "+", "2", "/", "2"]
        switchFunction(infix)
        XCTAssertEqual(try sut.makeCalculation(), 4.0)
    }
    func testExample_6() throws {
        let infix = ["1", "*", "3", "+", "2", "/", "0"]
        switchFunction(infix)
//        XCTAssertEqual(try sut.makeCalculation(), 6.0)
        XCTAssertThrowsError(try sut.makeCalculation())
    }
    func testExample_7() throws {
        let infix = ["10.1", "+", "12.5", "/", "125", "+", "8", "-", "100", "*", "13.8"]
        switchFunction(infix)
        XCTAssertEqual(try sut.makeCalculation(),  -1361.8)
    }
    
}
