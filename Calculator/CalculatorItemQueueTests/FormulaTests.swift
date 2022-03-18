//
//  FormulaTests.swift
//  CalculatorItemQueueTests
//
//  Created by 조민호 on 2022/03/18.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_operand가없는경우result를호출할때_예상되는에러를반환해야한다() {
        // given
        // when
        // then
        let expected: QueueError = .notFoundElement
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? QueueError, expected)
        }
    }
    
    func test_operator가없는경우result를호출할때_예상되는에러를반환해야한다() {
        // given
        var mockOperandQueue = CalculatorItemQueue<Double>()
        
        [-1, 2, 3, 4, 5].forEach {
            mockOperandQueue.enqueue($0)
        }
        
        sut = Formula(operands: mockOperandQueue, operators: CalculatorItemQueue<Operator>())
        
        // when
        // then
        let expected: QueueError = .notFoundElement
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? QueueError, expected)
        }
    }

    func test_result를호출할때_결과값과예상값이같아야한다() {
        // given
        var mockOperandQueue = CalculatorItemQueue<Double>()
        var mockOperatorQueue = CalculatorItemQueue<Operator>()

        [-1, 2, 3, 4, 5].forEach {
            mockOperandQueue.enqueue($0)
        }
        
        [.add, .substract, .divide, .multiply].forEach {
            mockOperatorQueue.enqueue($0)
        }

        sut = Formula(operands: mockOperandQueue, operators: mockOperatorQueue)
        
        // when
        // then
        let expected = -2.5
        XCTAssertEqual(try sut.result(), expected)
    }
    
    func test_result를호출할때_0으로divide하는경우_예상되는에러를반환해야한다() {
        // given
        var mockOperandQueue = CalculatorItemQueue<Double>()
        var mockOperatorQueue = CalculatorItemQueue<Operator>()

        [-1, 2, 3, 0, 5].forEach {
            mockOperandQueue.enqueue($0)
        }
        
        [.add, .substract, .divide, .multiply].forEach {
            mockOperatorQueue.enqueue($0)
        }

        sut = Formula(operands: mockOperandQueue, operators: mockOperatorQueue)
        
        // when
        // then
        let expected: CalculatorError = .dividedByZero
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? CalculatorError, expected)
        }
    }
}
