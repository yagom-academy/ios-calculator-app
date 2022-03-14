//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김태현 on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = .init()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.sut = nil
    }
    
    func test_프로퍼티초기화잘됐는지() {
        XCTAssertEqual(sut.queue, [])
        XCTAssertEqual(sut.front, -1)
        XCTAssertEqual(sut.rear, -1)
    }

}
