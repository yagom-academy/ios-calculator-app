//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 정선아 on 2022/09/19.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
       try super.setUpWithError()
       sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enQueue_메서드가_실행되었을_때_inputStack에_값이_들어가는가() {
        let input = 7.0
        
        sut.enQueue(element: input)
        
        let result = 7.0
        
        XCTAssertEqual(result, sut.inputStack.last)
    }
}
