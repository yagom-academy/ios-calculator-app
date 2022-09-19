//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Wonbi on 2022/09/19.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Queue가빈값일때_true를반환하는지() {
        // given
        let input: [Double] = []
        
        // when
        sut.data = input
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
}
