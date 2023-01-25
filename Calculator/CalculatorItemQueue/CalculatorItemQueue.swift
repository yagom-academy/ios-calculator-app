//
//  CalculatorItemQueue.swift
//  CalculatorItemQueue
//
//  Created by kaki on 2023/01/24.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue가_비었을때_isEmpty가_true를_반환한다() {
        let result = sut.isEmpty
        
        XCTAssertEqual(result, true)
    }

}
