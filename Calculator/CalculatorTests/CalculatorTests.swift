//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 홍정아 on 2021/06/28.
//

@testable import Calculator
import XCTest

class CalculatorTests: XCTestCase {
    let sut = Calculator()
    
    func test_add() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "+", "2", "+", "3"]), "6")
    }
    
    func test_multiply() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "*", "2", "*", "3"]), "6")
    }
    
    func test_minus() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "-", "2", "-", "3"]), "-4")
    }
    
    func test_divide() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "/", "2"]), "0.5")
    }
    
    func test_complex1() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "*", "3", "+", "2", "/", "2"]), "4")
    }
    
    func test_complex2() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "*", "3", "+", "2", "/", "0"]), "NaN")
    }
    
    func test_complex3() {
        XCTAssertEqual(try sut.calculate(infix: ["10.1", "+", "12.5", "/", "125", "+", "8", "-", "100", "*", "13.8"]), "-1361.8")
    }
}
