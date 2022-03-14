//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김태현 on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = .init()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.sut = nil
    }
    
    func test_init_프로퍼티초기화잘됐는지() {
        XCTAssertEqual(sut.queue, [])
        XCTAssertEqual(sut.front, -1)
        XCTAssertEqual(sut.rear, -1)
    }
    
    func test_isEmpty_true나오는지() {
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue_확인() {
        let expectation: [CalculatorItem] = [.integer(4), .operator(.devision)]
        
        sut.enqueue(.integer(4))
        sut.enqueue(.operator(.devision))
        
        XCTAssertEqual(sut.queue, expectation)
    }

    func test_dequeue_4_devision있을때_4없어지는지확인() {
        let expectation: [CalculatorItem] = [.operator(.devision)]
        
        sut.queue = [.integer(4), .operator(.devision)]
        let result = sut.dequeue()
        
        XCTAssertEqual(result, .integer(4))
        XCTAssertEqual(sut.queue, expectation)
    }
    
    func test_clear_queue데이터없어지는지확인() {
        sut.queue = [.integer(4), .operator(.devision)]
        sut.clear()
        
        XCTAssertEqual(sut.queue, [])
    }
}
