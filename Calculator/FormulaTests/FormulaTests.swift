//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Hamo on 2022/09/26.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }
    
    func testFormula_result를호출하면_operands값2개와operators값1개가입력되었을때_합한결과가반환되어야한다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.add)
        // when
        let result = try? sut.result()
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func testFormula_result를호출하면_operands값3개와operators값2개가입력되었을때_합한결과가반환되어야한다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.add)
        // when
        let result = try? sut.result()
        // then
        XCTAssertEqual(result, 6.0)
    }
    
    func testFormula_operators종류4가지가하나씩입력되고operands값5개가입력되었을때_적잘한연산결과가반환되어야한다() {
        // given
        let inputValue = (5.0 + 12.0 - 10.0) / 5.0 * 7.0
        sut.operands.enqueue(5.0)
        sut.operands.enqueue(12.0)
        sut.operands.enqueue(10.0)
        sut.operands.enqueue(5.0)
        sut.operands.enqueue(7.0)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.subtract)
        sut.operators.enqueue(.divide)
        sut.operators.enqueue(.multiply)
        // when
        let result = try? sut.result()
        // then
        XCTAssertEqual(result, inputValue)
    }
}
