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
        let result = sut.inputStack[0]
        
        // then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_빈배열에서_값을_dequeue하면_nil을_반환하는가() {
        // given
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, nil)
    }
}
