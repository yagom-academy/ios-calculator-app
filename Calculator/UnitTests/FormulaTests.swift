//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Baem on 2022/09/26.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    var operandsQueue: CalculatorItemQueue!
    var operatorsQueue: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operandsQueue = CalculatorItemQueue()
        operatorsQueue = CalculatorItemQueue()
        sut = Formula(
            operands: operandsQueue,
            operators: operatorsQueue
        )
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_입력후_result실행시_순서대로_정상작동이_되는지() {
        // given
        let givenResult = (13+50.6)*11.1/10
        sut.operands.enqueue(13.0)
        sut.operators.enqueue(Operator.add)
        sut.operands.enqueue(50.6)
        sut.operators.enqueue(Operator.multiply)
        sut.operands.enqueue(11.1)
        sut.operators.enqueue(Operator.divide)
        sut.operands.enqueue(10.0)
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, givenResult)
    }
}
