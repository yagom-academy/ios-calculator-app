//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by JeongTaek Han on 2021/11/09.
//

import XCTest

class LinkedListTests: XCTestCase {
    
    func test_비어있는LinkedList에1을추가했을때0번인덱스에1이존재하는가() {
        // given
        let list = LinkedList<Int>()
        // when
        list.append(1)
        // then
        XCTAssertTrue(list[0] == 1)
    }
    
    func test_비어있는LinkedList의0번인덱스에접근하면nil을반환하는가() {
        // given
        let list = LinkedList<Int>()
        // when
        // emptylist
        // then
        XCTAssertTrue(list[0] == nil)
    }
    
    func test_1만들어있는list에1번인덱스에접근하면nil반환하는가() {
        // given
        let list = LinkedList<Int>()
        // when
        list.append(1)
        // then
        XCTAssertTrue(list[1] == nil)
    }
    
    func test_1_2_3이들어있는리스트에서노드개수3개반환() {
        // given
        let list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        // when
        let result = list.count
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_비어있는경우노드개수0개반환() {
        // given
        let list = LinkedList<Int>()
        // when
        let result = list.count
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_큐에0삽입후removeFirst가정상동작하는가() {
        // given
        let list = LinkedList<Int>()
        list.append(0)
        // when
        let result = list.removeFirst()
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_큐에1_2넣고마지막원소찾으면2반환() {
        // given
        let list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        // when
        let result = list.last
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_큐에1_2넣고마지막원소제거하면2반환() {
        // given
        let list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        // when
        let result = list.removeLast()
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_연결리스트비어있때isEmpty가true반환() {
        // given
        let list = LinkedList<Int>()
        // when
        let result = list.isEmpty
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_연결리스트안비어있때isEmpty가true반환() {
        // given
        let list = LinkedList<Int>()
        list.append(2)
        // when
        let result = list.isEmpty
        // then
        XCTAssertEqual(result, false)
    }
    
    func test_연결리스트_비어있을때_removeFirst시_nil반환() {
        // given
        let list = LinkedList<Int>()
        // when
        let result = list.removeFirst()
        // then
        XCTAssertNil(result)
    }
    
    func test_연결리스트_비어있을때_removeLast시_nil반환() {
        // given
        let list = LinkedList<Int>()
        // when
        let result = list.removeLast()
        // then
        XCTAssertNil(result)
    }
    
    func test_연결리스트_1_담겨있을때_removeLast시_1반환() {
        // given
        let list = LinkedList<Int>()
        list.append(1)
        // when
        let result = list.removeLast()
        // then
        XCTAssertEqual(result, 1)
    }

}
