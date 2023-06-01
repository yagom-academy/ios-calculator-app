//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Min Hyun on 2023/06/01.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        var operands = CalculatorItemQueue()
        var operators = CalculatorItemQueue()
        
        operators.enqueue("5")
        operands.enqueue("+")
        operators.enqueue("-1")
        operands.enqueue("-")
        operators.enqueue("2")
        operands.enqueue("*")
        operators.enqueue("6")
        operands.enqueue("/")
        operators.enqueue("3")
        
        sut = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_result_연산_결과값이_예상값과_일치한다() {
        // given
        let expected = 4.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expected)
    }
}
