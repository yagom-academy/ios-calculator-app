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
    
    func test_LinkedList의_head는_nil이다() {
        // given
        // when
        let result = sut.checkHeadValue()
        // then
        XCTAssertNil(result)
    }
    
    func test_LinkedList의_tail은_nil이다() {
        // given
        // when
        let result = sut.checkTailValue()
        // then
        XCTAssertNil(result)
    }
    
    func test_append_최초로_append_호출시_head와_tail은_같은_노드_data를_가진다() {
        // given
        sut.append(1)
        // when
        let headValue = sut.checkHeadValue()?.data
        let tailValue = sut.checkHeadValue()?.data
        // then
        XCTAssertEqual(headValue, tailValue)
    }
}
