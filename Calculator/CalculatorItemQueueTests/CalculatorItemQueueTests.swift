//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Yetti on 2023/05/30.
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
        
        XCTAssertEqual(sut.enQueueStack[0], input)
    }
    
    func test_deQueue호출시_deQueueStack의마지막값을_삭제하고반환한다() {
        sut.enQueueStack = ["1", "2", "+", "-"]
        
        
        let result = sut.deQueue()
        
        XCTAssertEqual(result, "1")
    }
    
    func test_deQueue호출시_enQueueStack이빈배열이라면_nil을반환한다() {
        sut.enQueueStack = []
        
        let result = sut.deQueue()
        
        XCTAssertNil(result)
    }
    
    func test_deQueue호출시_enQueueStack의1번째인덱스는_0번째인덱스가된다() {
        sut.enQueueStack = ["2", "4", "6", "9"]
        
        let result = sut.deQueue()
        
        XCTAssertEqual(sut.enQueueStack[0], "4")
    }
    
    func test_peek호출시_enQueueStack의_0번째인덱스값을반환한다() {
        sut.enQueueStack = ["2", "4", "6", "9"]
        
        let result = sut.peek()
        
        XCTAssertEqual(result, "2")
    }
    
    func test_peek호출시_enQueueStack이빈배열이면_nil을반환한다() {
        sut.enQueueStack = []
        
        let result = sut.peek()
        
        XCTAssertEqual(result, nil)
    }
}
