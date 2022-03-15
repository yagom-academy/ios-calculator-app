//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by mmim.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_빈배열에_1을_enqueue하면_추가되는가() {
        // given
        let input = 1.0
        
        // when
        sut.enqueue(input)
        let result = sut.forwordStack[0]
        
        // then
        XCTAssertEqual(result, 1.0)
    }
}
