//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 김진주 on 2023/10/03.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    typealias List = LinkedList<Int>
    
    var sut: List!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = List()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_count_초기값이0이다() {
        // given
        sut = List()
        let expectation = 0
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count_list에Node1개가할당되면_count는1이다() {
        // given
        let node = List.Node(data: 1)
        sut = List(head: node, tail: node)
        let expectation = 1
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count_list에Node2개가할당되면_count는2이다() {
        // given
        let firstNode = List.Node(data: 1)
        let secondNode = List.Node(data: 2)
        sut = List(head: firstNode, tail: secondNode)
        firstNode.next = secondNode
        
        let expectation = 2
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_isEmpty_노드가없을때True이다() {
        // given
        sut = List()

        // when
        let result = sut.isEmpty

        // then
        XCTAssertTrue(result)
    }

    func test_isEmpty_노드가있을때False이다() {
        // given
        let node = List.Node(data: 1)
        sut = List(head: node, tail: node)

        // when
        let result = sut.isEmpty

        // then
        XCTAssertFalse(result)
    }
    
//    func test_append호출시_isEmpty일때_head와tail에newNode가할당된다() {
//        // given
//        sut.count = 0
//        let data: Int = 10
//
//        // when
//        sut.append(data)
//
//        // then
//        XCTAssertNotNil(sut.head)
//        XCTAssertNotNil(sut.tail)
//        XCTAssertTrue(sut.head === sut.tail)
//    }
//
//    func test_append호출시_isEmpty일때_count가1증가한다() {
//        // given
//        sut.count = 0
//        let data: Int = 10
//
//        // when
//        sut.append(data)
//
//        // then
//        XCTAssertEqual(sut.count, 1)
//    }
    
    func test_append호출시_count가1일때_tail에newNode가할당된다() {
        // given
        let data: Int = 10
        sut.append(data)
        let newData: Int = 20
        
        // when
        sut.append(newData)
        
        // then
        XCTAssertFalse(sut.head === sut.tail)
        XCTAssertEqual(sut.head?.data, data)
        XCTAssertEqual(sut.tail?.data, newData)
    }
    
    func test_append호출시_count가1일때_tail에newNode가할당된후_count가1늘어난다() {
        // given
        let data: Int = 10
        sut.append(data)
        
        // when
        sut.append(data)
        
        // then
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_append호출시_count가2이상일때_tail에newNode가할당된다() {
        // given
        let firstData: Int = 10
        let secondData: Int = 20
        let thirdData: Int = 30
        let forthData: Int = 40
        sut.append(firstData)
        sut.append(secondData)
        sut.append(thirdData)
        
        // when
        sut.append(forthData)
        
        // then
        XCTAssertEqual(sut.head?.data, firstData)
        XCTAssertEqual(sut[at: 1]?.data, secondData)
        XCTAssertEqual(sut[at: 2]?.data, thirdData)
        XCTAssertEqual(sut.tail?.data, forthData)
        XCTAssertTrue(sut[at: 3] === sut.tail)
    }
    
    func test_append호출시_count가2이상일때_tail에newNode가할당된후_count가1올라간다() {
        // given
        let firstData: Int = 10
        let secondData: Int = 20
        let thirdData: Int = 30
        sut.append(firstData)
        sut.append(secondData)
        
        let expectationCount = 3
        
        // when
        sut.append(thirdData)
        
        // then
        XCTAssertEqual(sut.count, expectationCount)
    }
    
//    func test_removeFirst호출시_isEmpty일때_nil을반환한다() {
//        // given
//        sut.count = 0
//
//        // when
//        let result = sut.removeFirst()
//
//        // then
//        XCTAssertNil(result)
//    }
    
    func test_removeFirst호출시_head의Next가head가된다() {
        // given
        let firstData: Int = 10
        let secondData: Int = 20
        let thirdData: Int = 30
        sut.append(firstData)
        sut.append(secondData)
        sut.append(thirdData)
        
        let head = sut.head
        let headNext = sut.head?.next
        
        // when
        sut.removeFirst()
        
        // then
        XCTAssertTrue(sut.head === headNext)
        XCTAssertFalse(sut.head === head)
        XCTAssertEqual(sut.head?.data, secondData)
    }
    
    func test_removeFirst호출시_count가1감소한다() {
        // given
        sut.append(10)
        sut.append(20)
        sut.append(30)
        
        let expectationCount = sut.count - 1
        
        // when
        sut.removeFirst()
        
        // then
        XCTAssertEqual(sut.count, expectationCount)
    }
    
    func test_removeAll호출시_전부nil이된다() {
        // given
        sut.append(10)
        sut.append(20)
        sut.append(30)
        
        // when
        sut.removeAll()
        
        // then
        XCTAssertNil(sut[at: 0])
        XCTAssertNil(sut[at: 1])
        XCTAssertNil(sut[at: 2])
    }
    
}
