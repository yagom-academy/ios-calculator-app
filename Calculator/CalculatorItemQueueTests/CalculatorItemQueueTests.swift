//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Serena on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_모든_queue가_비어있으면_isAllQueueEmpty는_true를_반환한다() {
        let expectedResult = true
        
        let result = sut.isAllQueueEmpty
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_빈_queue에_1을_넣으면_peek는_1을_return한다() {
        let expectedResult = 1
        
        sut = CalculatorItemQueue(queue: [1])
        let result = sut.peek
        
        XCTAssertEqual(expectedResult, result)
    }

    func test_123을_queue에_넣고_dequeue를_한번하면_1을_반환한다() {
        let expectedResult = 1
        
        sut = CalculatorItemQueue(queue: [1, 2, 3])
        let result = sut.dequeue()!
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_123을_queue에_넣고_dequeue를_두번하면_2를_반환한다() {
        let expectedResult = 2
        
        sut = CalculatorItemQueue(queue: [1, 2, 3])
        _ = sut.dequeue()!
        let result = sut.dequeue()!
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_123을_queue에_넣고_dequeue를_세번하면_3을_반환한다() {
        let expectedResult = 3
        
        sut = CalculatorItemQueue(queue: [1, 2, 3])
        _ = sut.dequeue()!
        _ = sut.dequeue()!
        let result = sut.dequeue()!
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_1만_enqueue에_넣고_dequeue를_2번하면_nil이_반환한다() {
        let expectedResult: Int? = nil
        
        sut = CalculatorItemQueue(queue: [1])
        _ = sut.dequeue()!
        let result = sut.dequeue()
        
        XCTAssertEqual(expectedResult, result)
    }
}
