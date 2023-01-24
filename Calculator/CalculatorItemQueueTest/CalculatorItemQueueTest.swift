//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by 강민수 on 2023/01/24.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_숫자입력이_멈췄을_때_items에_해당_값이_추가된다() {
        sut?.finishInputNumbers()
        
        let numbers = "123"
        let value = sut!.items.head!.value
        
        let equalNumbersAndValue = numbers == value
        
        XCTAssertTrue(equalNumbersAndValue)
    }
}
