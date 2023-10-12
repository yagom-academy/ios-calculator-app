//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by hyunMac on 10/9/23.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue실행시_3_2_1를_넣어주고_dequeue_3번_실행시_넣은_순서대로_방출되는지() {
        //given
        sut.enqueue(3)
        sut.enqueue(2)
        sut.enqueue(1)
        
        //when
        let dequeued1 = sut.dequeue()
        let dequeued2 = sut.dequeue()
        let dequeued3 = sut.dequeue()
        
        // then
        XCTAssertEqual(dequeued1, 3)
        XCTAssertEqual(dequeued2, 2)
        XCTAssertEqual(dequeued3, 1)
    }
    
    func test_노드가_없을때_dequeue실행시_nil을_반환하는지() {
        //given
        
        // when
        let dequeuedItem = sut.dequeue()
        
        // then
        XCTAssertNil(dequeuedItem)
    }
    
    func test_enqueue로_3_2_1을_넣어주고_peek실행시_3이_출력되는지(){
        // given
        sut.enqueue(3)
        sut.enqueue(2)
        sut.enqueue(1)
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_노드가_존재하지_않을때_peek실행시_nil값이_출력되는지() {
        // given
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, nil)
    }
    
    func test_노드가_존재하지_않을때_isEmpty실행시_true를_반환하는지() {
        //given
        
        // when
        let isEmpty = sut.isEmpty()
        
        // then
        XCTAssertTrue(isEmpty)
    }
    
    func test_enqueue로_3을_넣어주고_isEmpty실행시_false를_반환하는지() {
        // given
        sut.enqueue(3)
        
        // when
        let isEmpty = sut.isEmpty()
        
        // then
        XCTAssertFalse(isEmpty)
    }
    
    func test_enqueue로_3을_넣어주고_dequeue로_제거후_isEmpty실행시_true를_반환하는지(){
        // given
        sut.enqueue(3)
        _ = sut.dequeue()
        
        // when
        let isEmpty = sut.isEmpty()
        
        // then
        XCTAssertTrue(isEmpty)
    }
    
    func test_enqueue실행시_3_2_1를_넣어주고_clear실행후_isEmpty실행시_true를_반환하는지(){
        // given
        sut.enqueue(3)
        sut.enqueue(2)
        sut.enqueue(1)
            
        // when
        sut.clear()
            
        // then
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_enqueue실행시_3_2_1를_넣어주고_count실행시_3을_반환하는지() {
        // given
        sut.enqueue(3)
        sut.enqueue(2)
        sut.enqueue(1)
        
        // when
        let count = sut.count()
        
        // then
        XCTAssertEqual(count, 3)
    }
    
    func test_노드가_존재하지_않을때_count실행시_0을_반환하는지() {
        // given
        
        // when
        let count = sut.count()
        
        //then
        XCTAssertEqual(count, 0)
    }
}
