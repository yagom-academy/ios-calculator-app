//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by jyubong,Morgan.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    typealias List = LinkedList<Int>
    
    var sut: List!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_count_노드가없을때0이다() {
        // given
        sut = List()
        let expectation = 0
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count_list에노드1개가할당되면_count는1이다() {
        // given
        let data = 1
        sut = List(head: .init(data: data), tail: .init(data: data))
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, data)
    }
    
    func test_count_list에노드2개가할당되면_count는2이다() {
        // given
        let firstData = 1
        let secondData = 2
        sut = List(head: .init(data: firstData), tail: .init(data: secondData))
        sut.head?.setNext(sut.tail)
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, secondData)
    }
    
    func test_isEmpty_노드가없을때True이다() {
        // given
        sut = List()

        // when
        let result = sut.isEmpty

        // then
        XCTAssertTrue(result)
    }

    func test_isEmpty_호출시_노드가있을때False이다() {
        // given
        let data = 1
        sut = List(head: .init(data: 1), tail: .init(data: 1))

        // when
        let result = sut.isEmpty

        // then
        XCTAssertFalse(result)
    }
    
    func test_append호출시_isEmpty일때_head에newNode가할당된다() {
        // given
        sut = List()
        let data = 1

        // when
        sut.append(data)

        // then
        XCTAssertEqual(sut.head?.data, data)
    }
    
    func test_append호출시_tail에newNode가할당된다() {
        // given
        let firstData = 1
        sut = List(head: .init(data: firstData), tail: .init(data: firstData))
        let secondData = 2

        // when
        sut.append(secondData)

        // then
        XCTAssertEqual(sut.tail?.data, secondData)
    }
    
    func test_removeFirst호출시_isEmpty일때_nil을반환한다() {
        // given
        sut = List()

        // when
        let result = sut.removeFirst()

        // then
        XCTAssertNil(result)
    }
    
    func test_removeFirst호출시_첫번째노드가제거되고첫번째노드를반환한다() {
        // given
        let firstData = 1
        let secondData = 2
        sut = List(head: .init(data: firstData), tail: .init(data: secondData))
        sut.head?.setNext(sut.tail)

        // when
        let result = sut.removeFirst()

        // then
        XCTAssertNotEqual(firstData, sut.head?.data)
        XCTAssertEqual(firstData, result)
    }
    
    func test_removeAll호출시_초기화된다() {
        // given
        let data = 1
        sut = List(head: .init(data: data), tail: .init(data: data))
        
        // when
        sut.removeAll()
        
        // then
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}
