//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 예거 on 2021/11/15.
//

import XCTest

class FormulaTests: XCTestCase {
    
    func test_result메서드_0으로_나누면_Double타입의_NaN_반환() {
        var formula = Formula()
        formula.operands.enqueue(element: 10)
        formula.operands.enqueue(element: 0)
        formula.operators.enqueue(element: .divide)
        let result = formula.result()
        XCTAssertTrue(result.isNaN)
    }
    
    func test_result메서드_연산자_1개일때_계산_확인() {
        var formula = Formula()
        formula.operands.enqueue(element: 2.5)
        formula.operands.enqueue(element: -2.5)
        formula.operators.enqueue(element: .subtract)
        let result = formula.result()
        let expectation: Double = 5
        XCTAssertEqual(result, expectation)
    }
    
    func test_result메서드_연산자_2개일때_계산_확인() {
        var formula = Formula()
        formula.operands.enqueue(element: 10)
        formula.operands.enqueue(element: -2.5)
        formula.operands.enqueue(element: -4)
        formula.operators.enqueue(element: .divide)
        formula.operators.enqueue(element: .multiply)
        let result = formula.result()
        let expectation: Double = 16
        XCTAssertEqual(result, expectation)
    }
    
    func test_result메서드_연산자_3개일때_계산_확인() {
        var formula = Formula()
        formula.operands.enqueue(element: 2)
        formula.operands.enqueue(element: -4)
        formula.operands.enqueue(element: 1.5)
        formula.operands.enqueue(element: 10)
        formula.operators.enqueue(element: .subtract)
        formula.operators.enqueue(element: .divide)
        formula.operators.enqueue(element: .multiply)
        let result = formula.result()
        let expectation: Double = 40
        XCTAssertEqual(result, expectation)
    }
}
