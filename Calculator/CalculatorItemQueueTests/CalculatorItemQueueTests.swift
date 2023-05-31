//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by myungsun on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_5를_enqueue하면_정상적으로_큐에_값이_들어간다() {
        let input = 5
        
        sut.enqueue(input)
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_1_2_3을_enqueue하고_1_2_3을_dequeue하면_정상적으로_값이_빠진다() {
        let firstInput = 1
        let secondInput = 2
        let thirdInput = 3
        
        sut.enqueue(firstInput)
        sut.enqueue(secondInput)
        sut.enqueue(thirdInput)
        
        XCTAssertEqual(sut.dequeue(), firstInput)
        XCTAssertEqual(sut.dequeue(), secondInput)
        XCTAssertEqual(sut.dequeue(), thirdInput)
    }
    
    func test_queue가_비어있을때_dequeue를_호출하면_nil을_반환한다() {
        XCTAssertNil(sut.dequeue())
    }
    
    func test_isEmpty_메서드를_호출하면_그에_맞는_Bool_값을_반환한다() {
        let input = 10
        
        XCTAssertTrue(sut.isEmpty())
        sut.enqueue(input)
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_clear_메서드를_호출하면_queue에_있는_값들이_모두_사라진다() {
        let firstInput = 7
        let secondInput = 8
        
        sut.enqueue(firstInput)
        sut.enqueue(secondInput)
        XCTAssertFalse(sut.isEmpty())

        sut.clear()
        XCTAssert(sut.isEmpty())
    }
    
    func test_peek_프로퍼티를_읽어오면_큐의_맨_앞에_있는_값을_반환한다() {
        let firstInput = 1
        let secondInput = 2
        
        XCTAssertNil(sut.peek)
        
        sut.enqueue(firstInput)
        XCTAssertEqual(sut.peek, firstInput)
        
        sut.enqueue(secondInput)
        XCTAssertEqual(sut.peek, firstInput)
        
        guard let data = sut.dequeue() else { return }
        XCTAssertEqual(sut.peek, secondInput)
    }
}
