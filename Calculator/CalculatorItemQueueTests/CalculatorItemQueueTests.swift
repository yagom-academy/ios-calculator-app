//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by leewonseok on 2022/09/19.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐에_정상적인_값이_들어가는지() {
        let value = Double.random(in: 0...10)
        let preQueueCount = sut.count
        
        sut.enqueue(value)
        
        XCTAssertEqual(preQueueCount + 1, sut.count)
    }
    
    func test_큐에서_정상적으로_첫번째_값이_빠지는지() {
        let firstValue = Double.random(in: 0...10)
        
        sut.enqueue(firstValue)
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        
        XCTAssertEqual(firstValue, sut.dequeue())
    }
    
    
    func test_큐에서_정상적으로_dequeue가됐는지() {
        let value = Double.random(in: 0...10)
        let preQueueCount = sut.count
        
        sut.enqueue(value)
        sut.dequeue()
        
        XCTAssertEqual(preQueueCount, sut.count)
    }
    
    func test_큐에서_값이없는데_뺄경우_Nil() {
        let dequeue = sut.dequeue()
        
        XCTAssertNil(dequeue)
    }
    
    func test_큐가_정상적으로_비워지는지() {
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.clear()
        
        XCTAssertEqual(sut.count, 0)
    }
}
