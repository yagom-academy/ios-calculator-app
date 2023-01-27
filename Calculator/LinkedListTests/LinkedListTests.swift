//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 혜모리 on 2023/01/25.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<String>()
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
    
    func test_List에1_2_3을추가하는경우_head의next_value는2이다() {
        // given, when
        sut.appendLast("1")
        let targetNode = sut.head
        sut.appendLast("2")
        let expectation = sut.tail?.value
        sut.appendLast("3")
        
        // then
        XCTAssertEqual(targetNode?.next?.value, expectation)
    }
    
    func test_removeLast호출시_빈List인경우_nil을반환한다() {
        // given, when
        let result = sut.removeLast()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_removeLast호출시_List에1_2_3이있는경우_3이삭제되고_tail은2가된다() {
        // given
        sut.appendLast("1")
        sut.appendLast("2")
        sut.appendLast("3")
        let expectation = "2"

        // when
        sut.removeLast()

        // then
        XCTAssertEqual(sut.tail?.value, expectation)
    }
    
    func test_removeFirst호출시_빈List인경우_nil을반환한다() {
        // given, when
        let result = sut.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_removeFirst호출시_List에head하나만있는경우_head를삭제하고_반환된node의value는_1이다() {
        // given
        sut.appendLast("1")
        let expectation = sut.head?.value

        // when
        let result = sut.removeFirst()

        // then
        XCTAssertEqual(result?.value, expectation)
    }

    func test_removeAll호출시_head와tail모두nil이된다() {
        // given
        let head = sut.head
        let tail = sut.tail
        var condition: Bool {
            head == nil && tail == nil
        }
        
        // when
        sut.removeAll()
        
        // then
        XCTAssertTrue(condition)
    }
}
