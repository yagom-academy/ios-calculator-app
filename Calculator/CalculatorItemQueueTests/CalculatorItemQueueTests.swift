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
        var numArray: Set<Double> = []
        var firstValue: Double?
        var loopCount: Int = 0
        
        for _ in 1...10 {
            numArray.update(with: Double.random(in: 0...10))
        }
        
        numArray.forEach {
            if loopCount == 0 { firstValue = $0 }
            sut.enqueue($0)
            loopCount += 1
        }
        
        
        XCTAssertEqual(firstValue, sut.dequeue() as? Double)
        
    }
    
    func test_큐에10개의값이들어가고_3개의값이빠졌을때_값이7인지() {
        for _ in 1...10 {
            sut.enqueue(Double.random(in: 0...10))
        }
        for _ in 1...3 {
            sut.dequeue()
        }
        
        XCTAssertEqual(sut.count, 7)
    }
    
    func test_큐에1개의값을넣고_dequeue했을때_값이Nil이아닌지() {
        let value = Double.random(in: 0...10)
        
        sut.enqueue(value)
        
        XCTAssertNotNil(sut.dequeue())
    }
    
    func test_큐가비어있을때_isEmpty의값이_true인지() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_큐에300개의값을넣고_300개의값을뺏을때_isEmpty의값이_true인지() {
        for _ in 1...300{
            sut.enqueue(Double.random(in: 0...10))
        }
        for _ in 1...300{
            sut.dequeue()
        }
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_큐에값이없을때_dequeue했을시_Nil이반환되는지() {
        let dequeue = sut.dequeue()
        
        XCTAssertNil(dequeue)
    }
    
    func test_큐에5개의값을넣고_clear했을때_정상적으로_count가_0이_되는지() {
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.enqueue(Double.random(in: 0...10))
        sut.clear()
        
        XCTAssertEqual(sut.count, 0)
    }
}
