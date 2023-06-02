//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Yetti on 2023/05/30.

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
    
    func test_deQueue호출시_deQueueStack이빈배열이라면_enQueueStack의0번째인덱스값을반환한다() {
        sut.enQueueStack = ["1", "2"]
        sut.deQueueStack = []
        
        let result = sut.deQueue()
        
        XCTAssertEqual(result, "1")
    }
    
    func test_deQueue호출시_deQueueStack에요소가있다면_마지막값을제거하고반환한다() {
        sut.deQueueStack = ["1", "2", "3"]
        
        let result = sut.deQueue()
        
        XCTAssertEqual(result, "3")
    }
    
    func test_deQueue호출시_deQueueStack이빈배열이라면_enQueueStack을뒤집어서가져오고마지막값을반환한다() {
        sut.enQueueStack = ["1", "2"]
        sut.deQueueStack = []
        
        let result = sut.deQueue()
        
        XCTAssertEqual(result, "1")
    }
    
    func test_peek호출시_enQueueStack과deQueueStack이빈배열이면_nil을반환한다() {
        sut.enQueueStack = []
        sut.deQueueStack = []
        
        let result = sut.peek()
        
        XCTAssertEqual(result, nil)
    }
    
    func test_peek호출시_deQueueStack에요소가있고enQueueStack이빈배열이면_deQueueStack의마지막요소를반환한다() {
        sut.enQueueStack = []
        sut.deQueueStack = ["1", "2", "3"]
        
        let result = sut.peek()
        
        XCTAssertEqual(result, "3")
    }
    
    func test_peek호출시_enQueueStack에요소가있고deQueueStack이빈배열이면_enQueueStack의첫번째요소를반환한다() {
        sut.enQueueStack = ["1", "2", "3"]
        sut.deQueueStack = []
        
        let result = sut.peek()
        
        XCTAssertEqual(result, "1")
    }
    
    func test_peek호출시_enQueueStack과deQueueStack모두요소가있으면_deQueueStack의마지막요소를반환한다() {
        sut.enQueueStack = ["1", "2", "3"]
        sut.deQueueStack = ["4", "5", "6"]
        
        let result = sut.peek()
        
        XCTAssertEqual(result, "6")
    }
    
    
    func test_clear호출시_enQueueStack과deQueueStack을_빈배열로만든다() {
        sut.enQueueStack = ["2", "4", "6", "9"]
        sut.deQueueStack = ["9", "6", "4", "2"]
        
        sut.clear()
        
        XCTAssertEqual(sut.enQueueStack, [])
        XCTAssertEqual(sut.deQueueStack, [])
    }
}
