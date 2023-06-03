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
    
    func test_isEmpty는_큐가비어있을때_true를반환한다() {
        let expectation = true
        
        let result = sut.isEmpty
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_isEmpty는_큐에값이있을때_False를반환한다() {
        let input = "1"
        let expectation = false
        
        sut.enQueue(input)
        let result = sut.isEmpty
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enQueue에_3을전달했을때_큐에3을저장한다() {
        let input = "3"
        let expectation = "3"
        
        sut.enQueue(input)
        let result = sut.peek()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_deQueue호출시_큐가비어있다면_nil을반환한다() {
        let result = sut.deQueue()
        
        XCTAssertEqual(result, nil)
    }
    
    func test_deQueue호출시_큐에값이있다면_첫번째값을제거하고반환한다() {
        let input = "3"
        let input2 = "4"
        let expectation = "3"
        
        sut.enQueue(input)
        sut.enQueue(input2)
        let result = sut.deQueue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_peek호출시_큐가비어있다면_nil을반환한다() {
        let result = sut.peek()
        
        XCTAssertEqual(result, nil)
    }
    
    func test_peek호출시_큐에값이있다면_첫번째값을제거하지않고반환한다() {
        let input = "3"
        let input2 = "4"
        let expectation = "3"
        
        sut.enQueue(input)
        sut.enQueue(input2)
        let result = sut.peek()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_clear호출시_큐에값이있다면_빈배열로만든다() {
        let expectation: [String] = []
        
        sut.enQueue("1")
        sut.clear()
        let result: [String] = []
        
        XCTAssertEqual(result, expectation)
    }
}
