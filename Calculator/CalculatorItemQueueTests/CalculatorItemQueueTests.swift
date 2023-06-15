//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jusbug, Yetti on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue를_호출하여_1과2와3을_넣고_개수가3개면_True를_반환하는지() {
        // given
        let expectation = 3
        
        // when
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_dequeue를_호출하여_3과4와5에서_3을_제거할때_개수가_2개인지() {
        // given
        sut.enqueue("3")
        sut.enqueue("4")
        sut.enqueue("5")
        
        // when
        XCTAssertEqual(sut.dequeue(), "3")
        
        // then
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_clear를_호출하어_빈배열이되면_True를_반환하는지() {
        // given
        sut.enqueue("8")
        sut.enqueue("x")
        sut.enqueue("9")
        
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_enqueueStack에_1을넣고_dequeue를호출할때_dequeueStack이빈배열이면_peek을enqueueStack에서가져오는지() {
        // given
        sut.enqueue("1")
        let expectation = sut.peek
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐에어떤값도존재하지않을때nil이반환되는지() {
        // given
        sut.enqueue("1")
        _ = sut.dequeue()
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertNil(result)
    }
    
    func test_큐에값이있을때_dequeue를호출하면_첫번째로넣은값을_반환하는지() {
        // given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let expectation = "1"
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
