//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by redmango1446 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: LinkedList<Any>!

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
        var result = sut.checkHeadNil()
        // then
        XCTAssertNil(result)
    }
    
    func test_LinkedList의_tail은_nil이다() {
        // given
        // when
        var result = sut.checkTailNil()
        // then
        XCTAssertNil(result)
    }
    
    func test_append_최초로_append_호출시_head와_tail은_같은_노드를_가진다() {
        // given
        sut.append(1)
        // when
        var headValue = sut.checkHead()
        var tailValue = sut.checkHead()
        // then
        XCTAssertEqual(hashValue, tailValue)
    }
}
