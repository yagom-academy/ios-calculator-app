//
//  CalculatorItemQueueUnitTest.swift
//  CalculatorItemQueueUnitTest
//
//  Created by si won kim on 2021/11/09.
//

import XCTest

class CalculatorItemQueueUnitTest: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_빈_큐에_1을_push하면_1이_남는다() {
        let input = 1
        let result = sut.push(input)
        XCTAssertEqual(result, [1])
    }
    
    func test_1이_있는_큐에_2를_push하면_1과_2가_남는다() {
        sut.calculatorItems = [1]
        let input = 2
        let result = sut.push(input)
        XCTAssertEqual(result, [1,2])
    }
}
