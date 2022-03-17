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
    
    func test_append_1번_removeFirst_1번_isEmpty_return_true() {
        // given
        sut.append(1)
        sut.removeFirst()

        // when
        let result = sut.isEmpty

        // then
        XCTAssertTrue(result)
    }
    
    func test_append_0번_removeFirst_1번_return_nil() {
        // given

        // when
        let result = sut.removeFirst()

        // then
        XCTAssertEqual(result, nil)
    }
    
    func test_append_data_removeFirst_return_data_Equal_true() {
        // given
        let testData = 1
        sut.append(testData)
        

        // when
        let result = sut.removeFirst()

        // then
        XCTAssertEqual(result, testData)
    }
    
    func test_append_3번_FisrtData_removeFirst_return_data_Equal_true() {
        // given
        let testData = [1, 2, 3]
        testData.forEach(sut.append(_:))
        

        // when
        let result = sut.removeFirst()

        // then
        XCTAssertEqual(result, testData[0])
    }
    
    func test_append_3번_removeFirst_1번_count_return_2() {
        // given
        let testData = [1, 2, 3]
        testData.forEach(sut.append(_:))
        sut.removeFirst()
        

        // when
        let result = sut.count

        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_append_3번_removeAll_isEmpty_return_true() {
        // given
        let testData = [1, 2, 3]
        testData.forEach(sut.append(_:))
        sut.removeAll()
        

        // when
        let result = sut.isEmpty

        // then
        XCTAssertTrue(result)
    }
    
    func test_append_3번_removeAll_count_return_0() {
        // given
        let testData = [1, 2, 3]
        testData.forEach(sut.append(_:))
        sut.removeAll()
        

        // when
        let result = sut.count

        // then
        XCTAssertEqual(result, 0)
    }
    
}
