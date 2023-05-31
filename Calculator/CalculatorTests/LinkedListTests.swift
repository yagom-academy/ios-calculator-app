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
    
    func test_removeFirst_호출시_head는_다음_data를_가진다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        sut.append(4)
        // when
        sut.removeFirst()
        sut.removeFirst()
        
        let headValue = sut.checkHeadValue()?.data
        let headExpectedValue = 3
        // then
        XCTAssertEqual(headValue, headExpectedValue)
    }
}
