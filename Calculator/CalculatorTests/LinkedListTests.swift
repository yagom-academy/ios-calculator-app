//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by redmango1446 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_removeFirst_1을_append한뒤_removeFirst를_호출하면_1을_반환한다() {
        // given
        sut.append(1)
        
        // when
        let result = sut.removeFirst()
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
}
