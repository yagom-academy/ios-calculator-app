//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by mint, Whales on 2023/06/13.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_append함수호출시_list가isEmpty상태이면_data값이_head와tail의data에_들어가는지() {
        // given
        let expectation: Int = 1
        // when
        sut.append(data: 1)
        // then
        XCTAssertEqual(sut.headData, expectation)
        XCTAssertEqual(sut.tailData, expectation)
    }
    
    func test_append함수호출시_전달인자가_tail의data로_들어가는지() {
        // given
        let expectation: Int = 3
        // when
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // then
        XCTAssertEqual(sut.tailData, expectation)
    }
    
    func test_removeFirst함수호출시_head가_두번째node로_옮겨가는지() {
        // given
        let expectation: Int = 2
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // when
        sut.removeFirst()
        // then
        XCTAssertEqual(sut.headData, expectation)
    }
    
    func test_removeAll함수호출시_list의isEmpty가_true가되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // when
        sut.removeAll()
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
