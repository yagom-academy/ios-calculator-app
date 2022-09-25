//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Dylan_Y on 2022/09/26.
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
        operandsQueue.enqueue(13)
        operatorsQueue.enqueue(Operator.add)
        operandsQueue.enqueue(50.6)
        operatorsQueue.enqueue(Operator.multiply)
        operandsQueue.enqueue(11.1)
        operatorsQueue.enqueue(Operator.divide)
        operatorsQueue.enqueue(10)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, givenResult)
    }
}
