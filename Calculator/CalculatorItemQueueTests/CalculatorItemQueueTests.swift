//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Minseong Kang on 2022/05/18.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - enque
    func test_enqueue의아규먼트로_0을_넣었을때_queue가빈배열이면_False() {
        // given
        let number = 0.0
        
        // when
        sut.enqueue(number)
        let result = sut.queue.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
}
