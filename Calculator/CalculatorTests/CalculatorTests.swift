//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Dasan on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_큐의크기를_올바르게반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_큐가비어있지않을때_false를반환한다() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_큐에_append한_요소가_맨끝으로_올바르게들어갔다() {
        // given
        sut.enqueue(1)
        sut.enqueue(3)
        sut.enqueue(5)
        let expectation = 5
        
        // when
        let result = sut.queue.last
                
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐에서_요소가_올바르게삭제되었다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(5)
        sut.enqueue(7)
        let expectation = 1
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐에서_가장먼저들어온요소가_삭제되었다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(5)
        sut.enqueue(7)
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_dequeue시_큐가비어있으면_nil반환() {
        // given
        // 주어지지 않음
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
}
