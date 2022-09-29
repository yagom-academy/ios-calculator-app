//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Mangdi on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_isCheckEmpty_를호출하면_true가나오는지() {
        let isTrue: Bool = true
        let result = sut?.isEmpty()
        
        XCTAssertEqual(isTrue, result)
    }
    
    func test_enQueue_호출할때_front가nil이면_front와rear둘다_newNode에붙는지() {
        let input = 20.0
        
        sut?.enqueue(input)
        
        XCTAssertNotNil(sut?.front)
        XCTAssertNotNil(sut?.rear)
    }
    
    func test_enQueue_호출할때_front가nil이아닌상태에서_rear는새로운노드에가는지() {
        let input = 10.0
        let input2 = 20.0
        
        sut?.enqueue(input)
        sut?.enqueue(input2)
        
        XCTAssertEqual(sut?.rear?.data, input2)
    }
    
    func test_deQueue_호출할때_아무것도없을때_nil을반환하는지() {
        let result = sut?.dequeue()
        
        XCTAssertNil(result)
    }
    
    func test_deQueue_호출할때_노드가1개일경우_노드의data값을_잘리턴하는지() {
        let input: Double = 20
        
        sut?.enqueue(input)
        let result = sut?.dequeue()
        
        XCTAssertEqual(input, result)
    }
    
    func test_deQueue_호출할때_노드가2개일경우_노드의data값을_잘리턴하는지() {
        let input: Double = 10
        let input2: Double = 20
        
        sut?.enqueue(input)
        sut?.enqueue(input2)
        let result = sut?.dequeue()
        let result2 = sut?.dequeue()
        
        XCTAssertEqual(input, result)
        XCTAssertEqual(input2, result2)
    }
    
    func test_deQueue_노드가1개일때_deQueue를2번호출하면_마지막리턴을nil로받는지() {
        let input: Double = 50
        
        sut?.enqueue(input)
        let result = sut?.dequeue()
        let result2 = sut?.dequeue()
        
        XCTAssertEqual(input, result)
        XCTAssertNil(result2)
    }
    
    func test_peek_노드가아무것도없을때_nil이잘반환되는가() {
        let result = sut?.peek()
        
        XCTAssertNil(result)
    }
    
    func test_peek_노드가1개있을때_data가잘나오는가() {
        let input: Double = 35
        sut?.enqueue(input)
        let result = sut?.peek()
        
        XCTAssertEqual(input, result)
    }
    
    func test_peek_노드가2개있을때_data가잘나오는가() {
        let input: Double = 20
        let input2: Double = 50
        sut?.enqueue(input)
        sut?.enqueue(input2)
        let result = sut?.peek()
        
        XCTAssertEqual(input, result)
    }
}
