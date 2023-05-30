//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Min Hyun on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue_빈_queue에_Int와_String_값을_가진_Node둘이_삽입한_순서대로_배치된다() {
        // given
        let value1: Int = 3
        let value2: String = "테스트"

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
        let value1: String = "테스트1"
        let value2: String = "테스트2"
        
        sut.enqueue(value1)
        sut.enqueue(value2)
        let headBefore = sut.head
        let valuefromHeadBefore = headBefore?.value as? String
        
        // when
        let result = try? sut.dequeue() as? String
        let headAfter = sut.head
        
        // then
        XCTAssertEqual(valuefromHeadBefore, result)
        XCTAssertNotIdentical(headBefore, headAfter)
    }
    
    func test_dequeue_비어있는_queue에서_첫번째_값을_빼려_하면_오류가_난다() {
        XCTAssertThrowsError(try sut.dequeue()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.indexOutOfRange)
        }
    }

    func test_removeAll_queue의_모든_Node가_지워진다() {
        // given
        let value1: String = "테스트1"
        let value2: String = "테스트2"
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
    
    func test_calculateAll_전체목록을_연산하고_결과를_반환한다() {
        // given
        let expected: Double = 2.5
        sut.enqueue(9)
        sut.enqueue("+")
        sut.enqueue(-8)
        sut.enqueue("*")
        sut.enqueue(5)
        sut.enqueue("/")
        sut.enqueue(2)
        let result = try? sut.calculateAll()
        
        XCTAssertEqual(expected, result)
    }
}

