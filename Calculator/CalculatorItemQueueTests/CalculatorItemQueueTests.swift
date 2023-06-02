//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Min Hyun on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueueFake!

    override func setUpWithError() throws {
        sut = CalculatorItemQueueFake()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue_빈_queue에_Double과_Operator_값을_가진_Node둘이_삽입한_순서대로_배치된다() {
        // given
        let value1: Double = 3.0
        let value2: Operator = Operator.divide

        // when
        sut.enqueue(value1)
        let newNode1 = sut.tail
        sut.enqueue(value2)
        let newNode2 = sut.tail
        let firstNode = sut.head
        let secondNode = firstNode?.next
        
        // then
        XCTAssertIdentical(newNode1, firstNode)
        XCTAssertIdentical(newNode2, secondNode)
    }
    
    func test_dequeue_비어있지_않은_queue에서_첫번째_값을_빼내면_남아있는_queue의_첫번째_값은_전과_달라진다() {
        // given
        let value1: Operator = Operator.divide
        let value2: Operator = Operator.multiply
        
        sut.enqueue(value1)
        sut.enqueue(value2)
        let headBefore = sut.head
        let valueFromHeadBefore = headBefore?.value as? Operator
        
        // when
        let result = try? sut.dequeue() as? Operator
        let headAfter = sut.head
        
        // then
        XCTAssertEqual(valueFromHeadBefore, result)
        XCTAssertNotIdentical(headBefore, headAfter)
    }
    
    func test_dequeue_비어있는_queue에서_첫번째_값을_빼려_하면_오류가_난다() {
        XCTAssertThrowsError(try sut.dequeue()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.indexOutOfRange)
        }
    }

    func test_removeAll_queue의_모든_Node가_지워진다() {
        // given
        let value1: Operator = Operator.subtract
        let value2: Operator = Operator.add
        sut.enqueue(value1)
        sut.enqueue(value2)
        let oldCount = sut.count
        
        // when
        sut.removeAll()
        let newCount = sut.count
        
        // then
        XCTAssertNotEqual(oldCount, newCount)
        XCTAssertEqual(newCount, 0)
        XCTAssertNil(sut.head)
    }
}

