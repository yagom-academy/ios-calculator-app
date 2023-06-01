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
        
        operands.enqueue(5.0)
        operators.enqueue("+")
        operands.enqueue(-1.0)
        operators.enqueue("-")
        operands.enqueue(2.0)
        operators.enqueue("*")
        operands.enqueue(6.0)
        operators.enqueue("/")
        operands.enqueue(3.0)
        
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_result_연산_결과값이_예상값과_일치한다() {
        // given
        let expected = 4.0
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, expected)
    }
}
