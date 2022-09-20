//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Mangdi on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_isCheckEmpty_를호출하면_true가나오는지() {
        let isTrue: Bool = true
        let result = sut?.isCheckEmpty()
        XCTAssertEqual(isTrue, result)
    }
    
    func test_enQueue_호출할때_front가nil이면_front와rear둘다_newNode에붙는지() {
        let input = "A"
        sut?.enQueue(input)
        XCTAssertNotNil(sut?.front)
        XCTAssertNotNil(sut?.rear)
    }
    
    func test_enQueue_호출할때_front가nil이아닌상태에서_rear는새로운노드에가는지() {
        let input = "A"
        let input2 = "B"
        sut?.enQueue(input)
        sut?.enQueue(input2)
        XCTAssertEqual(sut?.rear?.data as! String, "B")
    }
}
