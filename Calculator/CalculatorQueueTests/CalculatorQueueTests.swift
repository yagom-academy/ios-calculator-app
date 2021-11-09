//
//  CalculatorQueueTests.swift
//  CalculatorQueueTests
//
//  Created by Sunwoo on 2021/11/09.
//

import XCTest
@testable import Calculator
class CalculatorQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_calculatorItemQueue_item이_들어올경우_내부저장소에_저장이되는지() {
        sut.enqueue(operation: "+")
        let operationCount = sut.operationStorage.count

        XCTAssertEqual(operationCount, 1)
    }
    
    func test_calculatorItemQueue_item이_2개_또는_그이상이_들어올경우_내부저장소에_저장이되는지() {
        sut.enqueue(operation: "-")
        sut.enqueue(operation: "+")
        let operationCount = sut.operationStorage.count

        XCTAssertEqual(operationCount, 2)
    }
}
