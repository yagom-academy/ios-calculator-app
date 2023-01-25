//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Hyejeong Jeong on 2023/01/25.
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

    func test_빈List인경우_1을추가하면_마지막값이1이다() {
        // given
        let expectation = "1"
        
        // when
        sut.appendLast(expectation)
        let tailOfQueue = sut.tail?.value
        
        // then
        XCTAssertEqual(expectation, tailOfQueue)
    }
    
    func test_값이들어있는List인경우_2를추가하면_마지막값이2이다() {
        // given
        sut.appendLast("1")
        let expectation = "2"
        
        // when
        sut.appendLast(expectation)
        let tailOfQueue = sut.tail?.value
        
        // then
        XCTAssertEqual(expectation, tailOfQueue)
    }
    
    func test_List에1_2_3을추가하는경우_head의next는2의node이다() {
        // given, when
        sut.appendLast("1")
        let targetNode = sut.head
        sut.appendLast("2")
        let expectation = sut.tail
        sut.appendLast("3")
        
        // then
        XCTAssertEqual(targetNode?.next, expectation)
    }
    
    func test_removeLast호출시_빈List인경우_nil을반환한다() {
        // given, when
        let result = sut.removeLast()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_removeLast호출시_List에head하나만있는경우_head를삭제하고_삭제한node를반환한다() {
        // given
        sut.appendLast("1")
        let expectation = sut.head
        
        // when
        let result = sut.removeLast()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_removeLast호출시_List에1_2가있는경우_2가삭제되고_2를반환한다() {
        // given
        sut.appendLast("1")
        sut.appendLast("2")
        let expectation = "2"

        // when
        let result = sut.removeLast()

        // then
        XCTAssertEqual(result?.value, expectation)
    }
    
    func test_removeLast호출시_List에1_2_3이있는경우_3이삭제되고_tail은2가된다() {
        // given
        sut.appendLast("1")
        sut.appendLast("2")
        sut.appendLast("3")
        let expectation = "2"

        // when
        let _ = sut.removeLast()

        // then
        XCTAssertEqual(sut.tail?.value, expectation)
    }
}
