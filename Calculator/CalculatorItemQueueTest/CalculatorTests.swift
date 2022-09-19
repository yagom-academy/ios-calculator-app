//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by hy on 2022/09/19.
//

import XCTest

@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐가비어있을때_enqueue를사용해값이들어가는지() {
        //given
        let input = 2
        //when
        let result = sut.enqueue(element: input)
        //then
        XCTAssertEqual(result, 2)
    }
    
}
