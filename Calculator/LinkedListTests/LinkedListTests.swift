//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Daehoon Lee on 2023/05/31.
//

import XCTest
@testable import Calculator

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

    func test_init_head를기본값0을사용해초기화하고0을반환한다() {
        // given
        let expectedHead: Int = 0
        
        // when
        let testLinkedLisk: LinkedList = LinkedList()
        
        // then
        XCTAssertEqual(testLinkedLisk.head, expectedHead)
    }
}
