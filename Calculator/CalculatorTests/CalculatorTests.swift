//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 예거 on 2021/11/08.
//

import XCTest

class CalculatorTests: XCTestCase {
    // MARK: - CalculatorItemQueue 구조체의 테스트 케이스
    
    func test_큐타입_제네릭에_Double타입을_넣어서_만든_배열이_초기화_직후_비어있는지() {
        let operands = CalculatorItemQueue<Double>()
        let result = operands.queue.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_큐타입_제네릭에_Operator타입을_넣어서_만든_배열이_초기화_직후_비어있는지() {
        let operators = CalculatorItemQueue<Operator>()
        let result = operators.queue.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_숫자배열에_넣는_5가_Double_타입인지() {
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: 5)
        let result = operands.queue[0]
        let expectation: Double = 5
        XCTAssertEqual(result, expectation)
    }
    
    func test_숫자배열에_넣는_음수가_Double_타입인지() {
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: -2)
        let result = operands.queue[0]
        let expectation: Double = -2
        XCTAssertEqual(result, expectation)
    }
    
    func test_숫자배열에_넣는_0이_Double_타입인지() {
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: 0)
        let result = operands.queue[0]
        let expectation: Double = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_연산자배열에_add케이스_넣어지는지() {
        var operators = CalculatorItemQueue<Operator>()
        operators.enqueue(element: .add)
        let result = operators.queue[0]
        let expectation: Operator = .add
        XCTAssertEqual(result, expectation)
    }
    
    func test_숫자배열이_비어있을때_dequeue메서드로_nil_반환되는지() {
        var operands = CalculatorItemQueue<Double>()
        let result = operands.dequeue()
        XCTAssertNil(result)
    }
    
    func test_숫자배열에_원소있을때_dequeue메서드로_반환되는지() {
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue(element: 100)
        let result = operands.dequeue()
        let expectation: Double = 100
        XCTAssertEqual(result, expectation)
    }
    
    func test_연산자배열이_비어있을때_dequeue메서드로_nil_반환되는지() {
        var operators = CalculatorItemQueue<Operator>()
        let result = operators.dequeue()
        XCTAssertNil(result)
    }
    
    func test_연산자배열에_원소있을때_dequeue메서드로_반환되는지() {
        var operators = CalculatorItemQueue<Operator>()
        operators.enqueue(element: .multiply)
        let result = operators.dequeue()
        let expectation: Operator = .multiply
        XCTAssertEqual(result, expectation)
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
    
    // MARK: - Operator 열거형의 계산 메서드 테스트 케이스

    func test_add_케이스에서_calculate메서드_계산_확인() {
        let result = Operator.add.calculate(20.5, -10.5)
        let expectation: Double = 10
        XCTAssertEqual(result, expectation)
    }

    func test_subtract_케이스에서_calculate메서드_계산_확인() {
        let result = Operator.subtract.calculate(15.5, -0.5)
        let expectation: Double = 16
        XCTAssertEqual(result, expectation)
    }

    func test_multiply_케이스에서_calculate메서드_계산_확인() {
        let result = Operator.multiply.calculate(3, -3)
        let expectation: Double = -9
        XCTAssertEqual(result, expectation)
    }

    func test_divide_케이스에서_calculate메서드_계산_확인() {
        let result = Operator.divide.calculate(1.5, 0.5)
        let expectation: Double = 3
        XCTAssertEqual(result, expectation)
    }

    func test_divide_케이스에서_0으로_나눌때_에러처리() {
        let result = Operator.divide.calculate(5, 0)
        let expectation = "NaN"
        XCTAssertEqual(result, expectation)
    }
}
