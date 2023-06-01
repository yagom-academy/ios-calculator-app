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
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isEmpty_큐가_비어있으면_isEmpty가_true를_리턴한다() {
        // given
        let expectedResult = true
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_isEmpty_1건_enqueue_후_isEmpty가_false를_리턴한다() {
        // given
        let expectedResult = false
        sut.enqueue(1.0)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_dequeue_queue가_비어있으면_dequeue가_nil을_리턴한다() {
        // given
        let expectedResult: Double? = nil
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_dequeue_3건을_순서대로_enqueue_후_dequeue가_첫_enqueue_값을_리턴한다() {
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
    
    func test_count_4건_enqueue_후_count가_4를_리턴한다() {
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
    
    func test_peek_호출_시_다음_dequeue_될_값을_리턴한다() {
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
    
    func test_removeAll_호출_후_isEmpty가_true를_리턴한다() {
        // given
        sut.enqueue(Double.random(in: -10...10))
        sut.enqueue(Double.random(in: -10...10))
        sut.enqueue(Double.random(in: -10...10))
        sut.removeAll()
        let expectedResult = true
        
        // then
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
}
