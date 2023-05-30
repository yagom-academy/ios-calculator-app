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
    
    func test_enqueue_itemQueue가비어있고_string을넣었을때_itemQueue에_저장한다() {
        let input = "string"
        sut.enqueue(input)
        let result = sut.itemQueue
        let expectation = ["string"]
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_itemQueue가비어있지않고_string을넣었을때_기존itemQueue에_추가한다() {
        let input = "string"
        sut.itemQueue = ["문자열"]
        sut.enqueue(input)
        let result = sut.itemQueue
        let expectation = ["문자열", "string"]
        
        XCTAssertEqual(result, expectation)
    }
}
