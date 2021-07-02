//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Ellen on 2021/06/30.
//
import XCTest

@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var sut = Calculator()
    
    override func setUpWithError() throws {
        sut = Calculator()
    }
    
    func test_덧셈만_입력했을때_결과를_반환한다() {
        let testcase = ["1", "+", "2", "+", "3"]
        sut.separateInfix(from: testcase)
        XCTAssertEqual(try sut.returnCalculationResult(), Optional("6"))
    }

    func test_곱셈만_입력했을때_결과를_반환한다() {
        let testcase = ["1", "×", "2", "×", "3"]
        sut.separateInfix(from: testcase)
        XCTAssertEqual(try sut.returnCalculationResult(), Optional("6"))
    }
    
    func test_뺄셈만_입력했을때_결과를_반환한다() {
        let testcase = ["1", "−", "2", "−", "3"]
        sut.separateInfix(from: testcase)
        XCTAssertEqual(try sut.returnCalculationResult(), Optional("-4"))
    }
    
    func test_나눗셈만_입력했을때_결과를_반환한다() {
        let testcase = ["1", "÷", "2"]
        sut.separateInfix(from: testcase)
        XCTAssertEqual(try sut.returnCalculationResult(), Optional("0.5"))
    }
    
    func test_나눗셈_곱셈_덧셈_입력했을때_결과를_반환한다() {
        let testcase = ["1", "×", "3", "+", "2", "÷", "2"]
        sut.separateInfix(from: testcase)
        XCTAssertEqual(try sut.returnCalculationResult(), Optional("4"))
    }
    
    func test_0으로_나누기_시도중_오류를_반환한다() {
        let testcase = ["1", "×", "3", "+", "2", "÷", "0"]
        sut.separateInfix(from: testcase)
        XCTAssertEqual(try sut.returnCalculationResult(), Optional("NaN"))
    }
    
    func test_소수_입력시_결과를_반환한다() {
        let testcase = ["10.1", "+", "12.5", "÷", "125", "+", "8", "−", "100", "×", "13.8"]
        sut.separateInfix(from: testcase)
        XCTAssertEqual(try sut.returnCalculationResult(), Optional("-1361.8"))
    }
    
}
