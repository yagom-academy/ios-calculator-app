//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by EtialMoon on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_init에1_2_3을넣으면_enqueuedCalculatorItems에1_2_3이있다() {
        let input = ["1", "2", "3"]
        
        sut = CalculatorItemQueue(input)
        let result = sut.enqueuedCalculatorItems
        
        XCTAssertEqual(input, result)
    }
}
