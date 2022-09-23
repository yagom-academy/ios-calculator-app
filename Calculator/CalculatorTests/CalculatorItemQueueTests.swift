//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/19.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    func test_큐가_비어있는_상태에서_pop_하면_nil() {
        // given
        XCTAssertEqual(sut.isEmpty(), true)
        
        // when
        let data = sut.dequeue()

        // then
        XCTAssertNil(data)
    }
    
    func test_testWord를_50개_넣었을_때_count가_50() {
        // given
        let testWord = 1.1
        
        // when
        for _ in 1...50 {
            sut.enqueue(testWord)
        }
        
        // then
        XCTAssertEqual(sut.count, 50)
    }
    
    func test_queue에_값을_넣었을_때_head가_nil이_아님() {
        // given
        let testWord = 1.1
        
        // when
        sut.enqueue(testWord)
        
        // then
        XCTAssertNotNil(sut.head)
    }
    
    func test_큐에_1_2_3_4_값을_넣으면_순서대로_1_2_3_4_들어있는지_확인() {
        // given
        let elements: [Double] = [1, 2, 3, 4]
        var popedElement: [Double?] = []
        
        // when
        elements.forEach { element in
            sut.enqueue(element)
        }
        
        while sut.head != nil {
            let element = sut.dequeue()
            popedElement.append(element)
        }
        
        // then
        XCTAssertEqual(popedElement, elements)
    }
    
    func test_값이_있는데_dequeue를_실행하면_data값을_반환() {
        // given
        sut.enqueue(123456)
        
        // when
        let data = sut.dequeue()
        
        // then
        XCTAssertEqual(data, 123456)
    }
    
    func test_큐가_비어있는데_dequeue를_실행하면_nil() {
        // given
        
        // when
        let data = sut.dequeue()
        
        // then
        XCTAssertNil(data)
    }
    
    func test_testWord를_50개_넣은_후_50개를_제거했을_때_count가_0() {
        // given
        let testWord = 1.0

        // when
        for _ in 1...50 {
            sut.enqueue(testWord)
        }
        
        for _ in 1...50 {
            sut.dequeue()
        }

        // then
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_값을_넣고_clearQueue_실행_시_head와_tail_이_nil() {
        // given
        let testWord = 1.0
        
        // when
        sut.enqueue(testWord)
        sut.clearQueue()
        
        // then
        XCTAssertTrue(sut.isEmpty())
    }

}
