//
//  FormulaTests.swift
//  CalculatorItemQueueTests
//
//  Created by 조민호 on 2022/03/18.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!
    var mockDoubleQueue: CalculatorItemQueue<Double>!
    var mockOperatorQueue: CalculatorItemQueue<Operator>!
    var mockOperand: [Double]!
    var mockOperator: [Operator]!
    
    override func setUpWithError() throws {
        sut = Formula(operands: mockDoubleQueue, operators: mockOperatorQueue)
        mockOperand = [1.0, 2.0, 3.0, 4.0, 5.0]
        mockOperator = [.add, .substract, .divide, .multiply]
    }

    override func tearDownWithError() throws {
        sut = nil
        mockDoubleQueue.clear()
        mockOperatorQueue.clear()
        mockOperand.removeAll()
        mockOperator.removeAll()
    }
    
    func test_operand가없는경우에result를호출할때_예상되는에러를반환해야한다() {
        // given
        mockOperator.forEach {
            mockOperatorQueue.enqueue($0)
        }
        
        // when
        // then
        let expected: QueueError = .notFoundElement
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? QueueError, expected)
        }
    }
}
