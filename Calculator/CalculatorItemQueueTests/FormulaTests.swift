//
//  FormulaTests.swift
//  CalculatorItemQueueTests
//
//  Created by 조민호 on 2022/03/18.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!
    var mockOperandQueue: CalculatorItemQueue<Double>!
    var mockOperatorQueue: CalculatorItemQueue<Operator>!
    var mockOperand: [Double]!
    var mockOperator: [Operator]!
    
    override func setUpWithError() throws {
        mockOperandQueue = CalculatorItemQueue<Double>()
        mockOperatorQueue = CalculatorItemQueue<Operator>()
        mockOperand = [1.0, 2.0, 3.0, 4.0, 5.0]
        mockOperator = [.add, .substract, .divide, .multiply]
        mockOperand.forEach {
            mockOperandQueue.enqueue($0)
        }
        mockOperator.forEach {
            mockOperatorQueue.enqueue($0)
        }
        sut = Formula(operands: mockOperandQueue, operators: mockOperatorQueue)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockOperandQueue = nil
        mockOperatorQueue = nil
        mockOperand.removeAll()
        mockOperator.removeAll()
    }
    
    func test_operator가없는경우result를호출할때_예상되는에러를반환해야한다() {
        // given
        mockOperatorQueue.clear()
        
        sut = Formula(operands: mockOperandQueue, operators: mockOperatorQueue)
        
        // when
        // then
        let expected: QueueError = .notFoundElement
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? QueueError, expected)
        }
    }
}
