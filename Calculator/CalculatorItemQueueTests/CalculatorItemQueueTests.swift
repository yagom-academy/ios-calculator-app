//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Yetti on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isEmpty는_enQueueStack과deQueueStack이비어있을때_true를반환한다() {
        sut.enQueueStack = []
        sut.deQueueStack = []
        
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_isEmpty는_enQueueStack에값이있고deQueueStack이비어있을때_False를반환한다() {
        sut.enQueueStack = ["1"]
        sut.deQueueStack = []
        
        let result = sut.isEmpty
        XCTAssertFalse(result)
    }
    
    func test_enQueue에_문자열3을전달했을때_enQueueStack에문자열3을저장한다() {
        let input = "3"
        
        sut.enQueue(input)
        
        XCTAssertEqual(sut.enQueueStack[0] as? String, input)
    }


}
