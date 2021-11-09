//
//  CalculatorItemQueueUnitTest.swift
//  CalculatorItemQueueUnitTest
//
//  Created by si won kim on 2021/11/09.
//

import XCTest

class CalculatorItemQueueUnitTest: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_큐에_1을_넣었을때_1이_잘들어가는지() {
        let input = 1
        let result = sut.push(input)
        XCTAssertEqual(result, [1])
    }

}
