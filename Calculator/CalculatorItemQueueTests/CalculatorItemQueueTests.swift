//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by MARY on 2023/05/30.
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
    
    func test_enqueue_string을_넣으면_itemQueue에_저장한다() {
        let input = "string"
        sut.enqueue(input)
        
        let result = sut.takeQueueAsArray()
        let expectation = ["string"]
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_2번호출시_넣어준_순서대로_itemQueue에_추가한다() {
        let inputs = ["문자열", "string"]
        for input in inputs {
            sut.enqueue(input)
        }

        let result = sut.takeQueueAsArray()
        let expectation = ["문자열", "string"]

        XCTAssertEqual(result, expectation)
    }

    func test_dequeue_itemQueue가비어있을때_nil을반환한다() {
        let result = sut.dequeue()

        XCTAssertNil(result)
    }

    func test_dequeue_itemQueue에서_맨앞에있는요소를_반환하고_itemQueue에서_삭제한다() {
        let inputs = ["5", "+", "3"]
        for input in inputs {
            sut.enqueue(input)
        }

        let returnValue = sut.dequeue()
        let returnValueExpectation = "5"
        let afterQueue = sut.takeQueueAsArray()
        let afterQueueExpectation = ["+", "3"]

        XCTAssertEqual(returnValue, returnValueExpectation)
        XCTAssertEqual(afterQueue, afterQueueExpectation)
    }

    func test_resetQueue_itemQueue를_빈배열로만든다() {
        let inputs = ["5", "+", "3"]
        for input in inputs {
            sut.enqueue(input)
        }

        sut.removeAll()

        XCTAssertTrue(sut.isEmpty)
    }
}
