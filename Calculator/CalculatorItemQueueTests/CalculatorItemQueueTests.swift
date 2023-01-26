//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by kaki on 2023/01/25.
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
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐가_비었을경우_isEmpty가_true이다() {
        let result = sut.isEmpty
        let expectation = true
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐가_비었을경우_size가_0이다() {
        let result = sut.size
        let expectation = 0
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_됐을경우_isEmpty가_false이다() {
        sut.enqueue(111)
        let result = sut.isEmpty
        let expectation = false
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_한번_enqueue_됐을경우_size가_1이다() {
        sut.enqueue(111)
        let result = sut.size
        let expectation = 1
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_세번_enqueue_됐을경우_size가_3이다() {
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        let result = sut.size
        let expectation = 3
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_됐을경우_처음에_enqueue_해준_데이터가_반환된다() {
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        let result = sut.dequeue()!
        let expectation: Double = 111
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_됐을경우_size가_감소한다() {
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        let _ = sut.dequeue()
        let result = sut.size
        let expectation = 2
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈queue를_dequeue_할경우_nil이_반환된다() {
        let result = sut.dequeue()
        let expectation: Double? = nil
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_2개의_queue에서_removeLast를_한경우_size가_줄어든다() {
        sut.enqueue(111)
        sut.enqueue(222)
        sut.removeLast()
        let result = sut.size
        let expectation = 1
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_2개의_queue에서_removeLast를_한경우_2번째_dequeue는_nil이다() {
        sut.enqueue(111)
        sut.enqueue(222)
        sut.removeLast()
        let _ = sut.dequeue()
        let result = sut.dequeue()
        let expectation: Double? = nil
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_1개의_queue에서_removeLast를_한경우_size는_0이다() {
        sut.enqueue(111)
        sut.removeLast()
        let result = sut.size
        let expectation = 0
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_3개의_queue에서_clear를_한경우_isEmpty는_true이다() {
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        sut.clear()
        let result = sut.isEmpty
        let expectation = true
        
        XCTAssertEqual(result, expectation)
    }
}
