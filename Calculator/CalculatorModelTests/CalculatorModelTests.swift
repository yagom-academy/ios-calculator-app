//
//  CalculatorModelTests.swift
//  CalculatorModelTests
//
//  Created by Victor on 2022/09/21.
//

import XCTest
@testable import Calculator

class CalculatorModelTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_printQueueCount() {
        // given
        
        
        // when
        let result: Int = sut.count
        
        // then
        XCTAssertEqual(result, 1)
    }
}
