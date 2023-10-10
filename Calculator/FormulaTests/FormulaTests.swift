//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Charles on 2023/10/10.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_피연산자2331_연산자AddMultiplySubtract가_큐에존재할때_모두를연산한결과는_14와같다() {
        // given
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
        sut.operands.enqueue(2)
        sut.operands.enqueue(3)
        sut.operands.enqueue(3)
        sut.operands.enqueue(1)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.multiply)
        sut.operators.enqueue(.subtract)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 14)
    }

}
