//
//  LinkdeListTests.swift
//  LinkdeListTests
//
//  Created by 이시원 on 2022/03/17.
//

import XCTest
@testable import Calculator

class LinkdeListTests: XCTestCase {
    var sut: LinkdeList<Int>!

    override func setUpWithError() throws {
        sut = LinkdeList<Int>()

    }

    override func tearDownWithError() throws {
        sut = nil

    }
    
    func test_append_했을때_isEmmpy_return_false() {
        // given
        sut.append(1)

        // when
        let result = sut.isEmpty

        // then
        XCTAssertFalse(result)
    }
    
    func test_append_안했을때_isEmmpy_return_true() {
        // given

        // when
        let result = sut.isEmpty

        // then
        XCTAssertTrue(result)
    }
    
    func test_append_1번했을때_count_return_1() {
        // given
        sut.append(1)

        // when
        let result = sut.count

        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_append_1번_removeFirst_1번_return_true() {
        // given
        sut.append(1)
        sut.removeFirst()

        // when
        let result = sut.isEmpty

        // then
        XCTAssertTrue(result)
    }
}
