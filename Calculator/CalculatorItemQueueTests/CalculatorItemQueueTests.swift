//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Rowan on 2023/01/24.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Any>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue호출시_queue의count가1이다() {
        let input = 1
        sut.enqueue(input)
        let result = sut.queue.count
        let expectation = 1
        
        XCTAssertEqual(result, expectation)
    }
    
}
