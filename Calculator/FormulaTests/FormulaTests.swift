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
    
    func testFormula_result를호출하면_operands값4개와operators값2개가입력되었을때_합한결과가반환되어야한다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operands.enqueue(4.0)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.add)
        // when
        let result = try? sut.result()
        // then
        XCTAssertEqual(result, 10.0)
    }
}
