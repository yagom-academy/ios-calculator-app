//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Min Hyun on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut_double: CalculatorItemQueueFake<Double>!
    var sut_operator: CalculatorItemQueueFake<Operator>!

    override func setUpWithError() throws {
        sut_double = CalculatorItemQueueFake<Double>()
        sut_operator = CalculatorItemQueueFake<Operator>()
    }

    override func tearDownWithError() throws {
        sut_double = nil
        sut_operator = nil
    }
    
    func test_enqueue_빈_queue에_Double_값을_가진_Node둘이_삽입한_순서대로_배치된다() {
        // given
        let value1: Double = 3.0
        let value2: Double = 5.0

        // when
        sut_double.enqueue(value1)
        let newNode1 = sut_double.tail
        sut_double.enqueue(value2)
        let newNode2 = sut_double.tail
        let firstNode = sut_double.head
        let secondNode = firstNode?.next
        
        // then
        XCTAssertIdentical(newNode1, firstNode)
        XCTAssertIdentical(newNode2, secondNode)
    }
    
    func test_enqueue_빈_queue에_Operator_값을_가진_Node둘이_삽입한_순서대로_배치된다() {
        // given
        let value1: Operator = Operator.multiply
        let value2: Operator = Operator.divide

        // when
        sut_operator.enqueue(value1)
        let newNode1 = sut_operator.tail
        sut_operator.enqueue(value2)
        let newNode2 = sut_operator.tail
        let firstNode = sut_operator.head
        let secondNode = firstNode?.next
        
        // then
        XCTAssertIdentical(newNode1, firstNode)
        XCTAssertIdentical(newNode2, secondNode)
    }
    
    func test_dequeue_비어있지_않은_queue에서_첫번째_값을_빼내면_남아있는_queue의_첫번째_값은_전과_달라진다() {
        // given
        let value1: Operator = Operator.divide
        let value2: Operator = Operator.multiply
        
        sut_operator.enqueue(value1)
        sut_operator.enqueue(value2)
        let headBefore = sut_operator.head
        let valueFromHeadBefore = headBefore?.value
        
        // when
        let result = try? sut_operator.dequeue()
        let headAfter = sut_operator.head
        
        // then
        XCTAssertEqual(valueFromHeadBefore, result)
        XCTAssertNotIdentical(headBefore, headAfter)
    }
    
    func test_dequeue_비어있는_queue에서_첫번째_값을_빼려_하면_오류가_난다() {
        XCTAssertThrowsError(try sut_operator.dequeue()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.indexOutOfRange)
        }
    }

    func test_removeAll_queue의_모든_Node가_지워진다() {
        // given
        let value1: Operator = Operator.subtract
        let value2: Operator = Operator.add
        sut_operator.enqueue(value1)
        sut_operator.enqueue(value2)
        let oldCount = sut_operator.count
        
        // when
        sut_operator.removeAll()
        let newCount = sut_operator.count
        
        // then
        XCTAssertNotEqual(oldCount, newCount)
        XCTAssertEqual(newCount, 0)
        XCTAssertNil(sut_operator.head)
    }
}

