//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by EtialMoon on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue에_1을넣으면_CalculatorItemQueue의_queue에1이들어있다() {
        let input = "1"
        
        sut.enqueue(input)
        let result = sut.getQueue()[0]
        
        XCTAssertEqual(input, result)
    }
}
