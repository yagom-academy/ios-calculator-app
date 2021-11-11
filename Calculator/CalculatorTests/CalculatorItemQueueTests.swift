//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Eunsoo KIM on 2021/11/09.
//

import XCTest

extension Double: CalculateItem { }
extension String: CalculateItem { }

class CalculatorTests: XCTestCase {

    func test_기존_연산큐에_데이터가_없을때_계산기가_입력받은_1와_더하기_연산자는_연산큐에_쌓이는가() {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<String>()
        
        operands.enqueue(1.0)
        operators.enqueue("+")
        
        XCTAssertEqual(1.0, operands.queue.first?.value)
        XCTAssertEqual("+", operators.queue.first?.value)
    }
    
    func test_기존_연산큐에_데이터가_있을때_제대로_쌓이는가() {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<String>()

        operands.enqueue(1.0)
        operators.enqueue("+")
        operands.enqueue(2.0)
        operators.enqueue("-")
        operands.enqueue(3.0)
        operators.enqueue("/")

        XCTAssertEqual(1.0, operands.queue.first?.value)
        XCTAssertEqual("+", operators.queue.first?.value)
        XCTAssertEqual(3.0, operands.queue.last?.value)
        XCTAssertEqual("/", operators.queue.last?.value)
    }

    func test_연산큐에_데이터가_존재할때_dequeue_기능이_잘_되는가() {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<String>()

        operands.enqueue(1.0)
        operators.enqueue("+")
        operands.enqueue(2.0)
        operators.enqueue("-")
        operands.enqueue(3.0)
        operators.enqueue("/")

        let firstDequeuedOperands = operands.dequeue()
        let firstDequeuedOperators = operators.dequeue()

        XCTAssertEqual(1.0, firstDequeuedOperands)
        XCTAssertEqual("+", firstDequeuedOperators)

        XCTAssertEqual(2.0, operands.queue.first?.value)
        XCTAssertEqual("-", operators.queue.first?.value)
    }
    
    func test_연산큐에_있는_모든_데이터를_지우는_기능이_잘_되는가() {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<String>()

        operands.enqueue(1.0)
        operators.enqueue("+")
        operands.enqueue(2.0)
        operators.enqueue("-")
        operands.enqueue(3.0)
        operators.enqueue("/")

        XCTAssertEqual(1.0, operands.queue.first?.value)
        XCTAssertEqual("+", operators.queue.first?.value)
        XCTAssertEqual(3.0, operands.queue.last?.value)
        XCTAssertEqual("/", operators.queue.last?.value)

        operands.resetQueue()
        operators.resetQueue()

        XCTAssertEqual(nil, operands.queue.first?.value)
        XCTAssertEqual(nil, operators.queue.first?.value)
        XCTAssertEqual(nil, operands.queue.first?.value)
        XCTAssertEqual(nil, operators.queue.first?.value)

    }
}
