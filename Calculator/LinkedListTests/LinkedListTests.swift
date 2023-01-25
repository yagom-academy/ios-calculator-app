//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Hyejeong Jeong on 2023/01/25.
//

import XCTest

final class LinkedListTests: XCTestCase {
    var sut: LinkedList!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_appendLast호출시_빈List인경우_1을추가하면_마지막값이1이다() {
        // given
        let expectation = "1"
        let tailOfQueue = sut.tail
        // when
        sut.appendLast(expectation)
        // then
        XCTAssertEqual(expectation, tailOfQueue)
    }
}
