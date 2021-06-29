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
        XCTAssertEqual(try sut.calculate(infix: ["1", "-", "5", "+", "1", "-", "2"]), "-4")
    }
    
    func test_divide() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "/", "2"]), "0.5")
    }
    
    func test_solve_multiply() {
        XCTAssertEqual(try sut.solve(equation: "1*2*3"), 6.0)
    }
    
    func test_solve_minus() {
        XCTAssertEqual(try sut.solve(equation: "1-5+1-2"), -5.0)
    }
    
    func test_solve_divide() {
        XCTAssertEqual(try sut.solve(equation: "2/10"), 0.2)
    }
    
}
