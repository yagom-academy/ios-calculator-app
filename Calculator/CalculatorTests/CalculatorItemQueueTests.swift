//
//  CalculatorItemQueue.swift
//  CalculatorTests
//
//  Created by 비모 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isEmpty호출시_큐가_비어있으면_true를_리턴한다() {
        // given
        let expectedResult = true
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_isEmpty호출시_큐가_비어있지않으면_false를_리턴한다() {
        // given
        let expectedResult = false
        sut.enqueue(1.0)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_dequeue호출시_queue가_비어있으면_nil을_리턴한다() {
        // given
        let expectedResult: Double? = nil
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_dequeue호출시_첫_enqueue_값을_리턴한다() {
        // given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        let expectedResult = 1.0
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_count호출시_현재_큐에_쌓인_수를_리턴한다() {
        // given
        sut.enqueue(Double.random(in: -10...10))
        sut.enqueue(Double.random(in: -10...10))
        sut.enqueue(Double.random(in: -10...10))
        sut.enqueue(Double.random(in: -10...10))
        let expectedResult = 4
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_peek호출시_다음_dequeue_될_값을_리턴한다() {
        // given
        sut.enqueue(0.3)
        sut.enqueue(20.2)
        sut.enqueue(-10.7)
        
        for _ in 0..<sut.count {
            // when
            let result = sut.peek()
            let expectedResult = sut.dequeue()
            
            // then
            XCTAssertEqual(result, expectedResult)
        }
    }
}
