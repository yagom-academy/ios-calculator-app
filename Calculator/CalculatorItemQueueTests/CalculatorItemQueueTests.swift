//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by NAMU on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enQueue_큐에값이추가되는지() {
        // given
        sut.enQueue(data: 1)
        
        // when
        let result = sut.List?.takeOutFirst()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_enQueue_큐에값이여러개추가되는지() {
        // given
        sut.enQueue(data: 1)
        sut.enQueue(data: 2)
        
        // when
        let result1 = sut.List?.takeOutFirst()
        let result2 = sut.List?.takeOutFirst()
        
        // then
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
    }
}
