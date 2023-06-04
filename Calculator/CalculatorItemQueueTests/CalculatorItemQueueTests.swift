//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Serena on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_모든_queue가_비어있으면_isAllQueueEmpty는_true를_반환한다() {
        let expectedResult = true
        
        let result = sut.isAllQueueEmpty
        
        XCTAssertEqual(expectedResult, result)
    }
}
