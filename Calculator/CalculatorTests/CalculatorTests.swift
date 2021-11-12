//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 예거 on 2021/11/08.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    func test_큐타입_제네릭에_Double타입을_넣어서_만든_배열이_초기화_직후_비어있는지() {
        var operands = CalculatorItemQueue<Double>()
        let result = operands.queue.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_큐타입_제네릭에_Operator타입을_넣어서_만든_배열이_초기화_직후_비어있는지() {
        var operators = CalculatorItemQueue<Operator>()
        let result = operators.queue.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_숫자배열에_넣는_5가_Double_타입인지() {
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: 5)
        let expectation: Double = 5
        let result = operands.queue[0]
        XCTAssertEqual(expectation, result)
    }
    
    func test_숫자배열에_넣는_음수가_Double_타입인지() {
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: -2)
        let expectation: Double = -2
        let result = operands.queue[0]
        XCTAssertEqual(expectation, result)
    }
    
    func test_숫자배열에_넣는_0이_Double_타입인지() {
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: 0)
        let expectation: Double = 0
        let result = operands.queue[0]
        XCTAssertEqual(expectation, result)
    }
    
    func test_연산자배열에_add케이스_넣어지는지() {
        var operators = CalculatorItemQueue<Operator>()
        operators.enqueue(element: .add)
        let expectation: Operator = .add
        let result = operators.queue[0]
        XCTAssertEqual(expectation, result)
    }
    
    func test_숫자배열이_비어있을때_dequeue메서드로_nil_반환되는지() {
        var operands = CalculatorItemQueue<Double>()
        let result = operands.dequeue()
        XCTAssertNil(result)
    }
    
    func test_숫자배열에_원소있을때_dequeue메서드로_반환되는지() {
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: 100)
        let expectation: Double = 100
        let result = operands.dequeue()
        XCTAssertEqual(expectation, result)
    }
    
    func test_연산자배열이_비어있을때_dequeue메서드로_nil_반환되는지() {
        var operators = CalculatorItemQueue<Operator>()
        let result = operators.dequeue()
        XCTAssertNil(result)
    }
    
    func test_연산자배열에_원소있을때_dequeue메서드로_반환되는지() {
        var operators = CalculatorItemQueue<Operator>()
        operators.enqueue(element: .multiply)
        let expectation: Operator = .multiply
        let result = operators.dequeue()
        XCTAssertEqual(expectation, result)
    }
    
    func test_숫자배열에_원소있을때_clearQueueArray메서드로_비워지는지() {
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: 23.222221)
        operands.enqueue(element: 1.5)
        operands.enqueue(element: -2)
        operands.enqueue(element: 2425623)
        operands.clearQueueArray()
        let result = operands.queue.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_연산자배열에_원소있을때_clearQueueArray메서드로_비워지는지() {
        var operators = CalculatorItemQueue<Operator>()
        operators.enqueue(element: .add)
        operators.enqueue(element: .subtract)
        operators.enqueue(element: .multiply)
        operators.enqueue(element: .divide)
        operators.clearQueueArray()
        let result = operators.queue.isEmpty
        XCTAssertTrue(result)
    }
}
