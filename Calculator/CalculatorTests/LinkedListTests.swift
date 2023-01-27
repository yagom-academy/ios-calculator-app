//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Rowan on 2023/01/25.
//

import XCTest

final class LinkedListTests: XCTestCase {
    
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

//MARK: - isEmpty Test
    func test_isEmpty접근시count가0일때_true를반환한다() {
        // given
        XCTAssertEqual(sut.count, 0)
        let expectedResult = true
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
//MARK: - appendLast Test
    func test_최초appendLast호출시_새Node를head로지정한다() {
        // given
        let input = 1
        let expectedResult = 1
        
        // when
        sut.appendLast(input)
        let result = sut.headData
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_appendLast호출시_count가0일때_새Node를head_tail로지정한다() {
        // given
        XCTAssertEqual(sut.count, 0)
        let input = 1
        let expectedResult = 1
        
        // when
        sut.appendLast(input)
        let resultHead = sut.headData
        let resultTail = sut.tailData
        
        // then
        XCTAssertEqual(resultHead, expectedResult)
        XCTAssertEqual(resultTail, expectedResult)
    }
    
    func test_appendLast호출시count가1증가한다() {
        // given
        let input = 1
        let expectedResult = 1
        
        // when
        sut.appendLast(input)
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_appendLast호출시_count가0이아닐때_새Node를tail로지정한다() {
        // given
        sut.appendLast(1)
        XCTAssertNotEqual(sut.count, 0)
        let input = 2
        let expectedResult = 2
        
        // when
        sut.appendLast(input)
        let result = sut.tailData
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
//MARK: removeFirst Test
    func test_removeFirst호출시_현재head의Node를삭제하고_다음데이터로붙인다() {
        // given
        let secondNode = Node(data: 2)
        let firstNode = Node(data: 1, next: secondNode)
        sut = LinkedList(head: firstNode, tail: secondNode, count: 2)
        let expectedResult = 2
        
        // when
        sut.removeFirst()
        let result = sut.headData
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_removeFirst호출시_count가0인경우메서드를종료한다() {
        // given
        let expectedResult = 0
        
        // when
        sut.removeFirst()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_removeFirst호출시_count가0이아닐때_count가1감소한다() {
        // given
        let secondNode = Node(data: 2)
        let firstNode = Node(data: 1, next: secondNode)
        sut = LinkedList(head: firstNode, tail: secondNode, count: 2)
        XCTAssertNotEqual(sut.count, 0)
        let expectedResult = 1
        
        // when
        sut.removeFirst()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_removeFirst호출후_count가0이될경우head와tail에nil을할당한다() {
        // given
        let firstNode = Node(data: 1)
        sut = LinkedList(head: firstNode, tail: firstNode, count: 1)
        let expectedResult: Int? = nil
        
        // when
        sut.removeFirst()
        let resultHead = sut.headData
        let resultTail = sut.tailData
        
        // then
        XCTAssertEqual(resultHead, expectedResult)
        XCTAssertEqual(resultTail, expectedResult)
    }
    
    func test_removeFirst호출시_삭제한_값을_반환한다() {
        // given
        let firstNode = Node(data: 1)
        sut = LinkedList(head: firstNode, tail: firstNode, count: 1)
        let expectedResult = sut.headData
        let expectedHeadData: Int? = nil
        
        // when
        guard let result = sut.removeFirst() else { return }
        let resultHeadData = sut.headData
        
        // then
        XCTAssertEqual(resultHeadData, expectedHeadData)
        XCTAssertEqual(result, expectedResult)
    }
    
//MARK: - removeAll Test
    func test_removeAll호출시_Node가모두삭제된다() {
        // given
        let thirdNode = Node(data: 3)
        let secondNode = Node(data: 2, next: thirdNode)
        let firstNode = Node(data: 1, next: secondNode)
        sut = LinkedList(head: firstNode, tail: thirdNode, count: 3)
        let expectedResult = 0
        
        // when
        sut.removeAll()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_removeAll호출시_count가0이된다() {
        // given
        let firstNode = Node(data: 1)
        sut = LinkedList(head: firstNode, tail: firstNode, count: 1)
        let expectedResult = 0
        
        // when
        sut.removeAll()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_removeAll호출시_tail이할당해제된다() {
        let thirdNode = Node(data: 3)
        let secondNode = Node(data: 2, next: thirdNode)
        let firstNode = Node(data: 1, next: secondNode)
        sut = LinkedList(head: firstNode, tail: thirdNode, count: 3)
        let expectedResult: Int? = nil
        
        // when
        sut.removeAll()
        let result = sut.tailData
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
}
