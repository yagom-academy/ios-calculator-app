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
    
    func test_1더하기2더하기3은6() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "+", "2", "+", "3"]), "6")
    }
    
    func test_1곱하기2곱하기3은6() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "*", "2", "*", "3"]), "6")
    }
    
    func test_1빼기2빼기3은마이너스4() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "-", "2", "-", "3"]), "-4")
    }
    
    func test_1나누기2는쩜오() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "/", "2"]), "0.5")
    }
    
    func test_1곱하기3더하기2나누기2는4() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "*", "3", "+", "2", "/", "2"]), "4")
    }
    
    func test_0으로나누면NaN() {
        XCTAssertEqual(try sut.calculate(infix: ["1", "*", "3", "+", "2", "/", "0"]), "NaN")
    }
    
    func test_소수점복합계산() {
        XCTAssertEqual(try sut.calculate(infix: ["10.1", "+", "12.5", "/", "125", "+", "8", "-", "100", "*", "13.8"]), "-1361.8")
    }
}
