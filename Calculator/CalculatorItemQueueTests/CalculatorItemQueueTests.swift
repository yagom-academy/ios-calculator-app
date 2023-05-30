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
    
    func test_enqueue_Int와_String_값을_가진_Node가_들어가서_tail_위치에_배치된다() {
        // given
        let valueInt: Int = 3
        let newNodeInt = CalculatorItemNode(valueInt)

        // when
        sut.enqueue(newNodeInt)
        let resultInt = sut.tail
        
        // then
        XCTAssertIdentical(resultInt, newNodeInt)
        
        // given
        let valueString: String = "테스트"
        let newNodeString = CalculatorItemNode(valueString)
        
        // when
        sut.enqueue(newNodeString)
        let resultString = sut.tail
        
        // then
        XCTAssertIdentical(resultString, newNodeString)
    }
    
    func test_removeLast_비어있지_않은_queue에서_마지막_값이_지워진다() {
        // given
        let value: Int = 0
        sut.enqueue(CalculatorItemNode(value))
        sut.enqueue(CalculatorItemNode(value))
        var lastItem = sut.tail
        
        // when
        try? sut.removeLast()
        let result = sut.tail
        
        // then
        XCTAssertNotIdentical(result, lastItem)
    }
    
    func test_removeLast_비어있는_queue에서_마지막_값을_지우려_하면_오류가_난다() {
        XCTAssertThrowsError(try sut.removeLast()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.indexOutOfRange)
        }
    }
    
    func test_dequeue_비어있지_않은_queue에서_첫번째_값을_빼내면_남아있는_queue의_첫번째_값은_전과_달라진다() {
        // given
        let value1: String = "테스트1"
        let value2: String = "테스트2"
        let newNode1 = CalculatorItemNode(value1)
        let newNode2 = CalculatorItemNode(value2)
        sut.enqueue(newNode1)
        sut.enqueue(newNode2)
        let headBeforePop = sut.head
        
        // when
        let result = try? sut.dequeue()
        let headAfterPop = sut.head
        
        // then
        XCTAssertIdentical(headBeforePop, result)
        XCTAssertNotIdentical(headBeforePop, headAfterPop)
    }
    
    func test_dequeue_비어있는_queue에서_첫번째_값을_빼려_하면_오류가_난다() {
        XCTAssertThrowsError(try sut.dequeue()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.indexOutOfRange)
        }
    }
    
    func test_removeAll_비어있지_않은_queue의_모든_값이_지워진다() {
        // given
        let value1: String = "테스트1"
        let value2: String = "테스트2"
        let newNode1 = CalculatorItemNode(value1)
        let newNode2 = CalculatorItemNode(value2)
        sut.enqueue(newNode1)
        sut.enqueue(newNode2)
        let oldCount = sut.count
        
        // when
        sut.removeAll()
        let newCount = sut.count
        
        XCTAssertNotEqual(oldCount, newCount)
        XCTAssertEqual(newCount, 0)
    }
}

