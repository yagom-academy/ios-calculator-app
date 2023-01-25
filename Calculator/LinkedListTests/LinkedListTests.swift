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
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

//MARK: - isEmpty Test
    func test_isEmpty접근시count가0일때_true를반환한다() {
        // given
        sut.count = 0
        let expectation = true
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
//MARK: - appendLast Test
    func test_appendLast호출시count가1증가한다() {
        // given
        let data = 1
        let expectation = 1
        
        // when
        sut.appendLast(data)
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_최초appendLast호출시_새Node를head로지정한다() {
        // given
        let input = 1
        let expectation = 1
        // when
        sut.appendLast(input)
        let result = sut.head?.data
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendLast호출시_count가0일때_새Node를head_tail로지정한다() {
        // given
        let input = 1
        let expectation = 1
        
        // when
        sut.appendLast(input)
        let resultHead = sut.head?.data
        let resultTail = sut.tail?.data
        
        // then
        XCTAssertEqual(resultHead, expectation)
        XCTAssertEqual(resultTail, expectation)
    }
    
    func test_appendLast호출시_count가0이아닐때_새Node를tail로지정한다() {
        // given
        let firstInput = 1
        let secondInput = 2
        let expectation = 2
        
        // when
        sut.appendLast(firstInput)
        sut.appendLast(secondInput)
        let result = sut.tail?.data
        let secondData = sut.head?.next?.data
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(secondData, expectation)
    }
    
//MARK: removeFirst Test
    func test_removeFirst호출시_count가1감소한다() {
        // given
        sut.count = 1
        let expectation = 0
        
        // when
        sut.removeFirst()
        let result = sut.count
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_removeFirst호출시_count가0인경우메서드를종료한다() {
        // given
        let expectation = 0
        
        // when
        sut.removeFirst()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_removeFirst호출후_count가0이될경우head와tail에nil을할당한다() {
        // given
        sut.head = Node(data: 1)
        sut.tail = sut.head
        sut.count = 1
        let expectation: Int? = nil
        
        // when
        sut.removeFirst()
        let resultHead = sut.head?.data
        let resultTail = sut.tail?.data
        
        // then
        XCTAssertEqual(resultHead, expectation)
        XCTAssertEqual(resultTail, expectation)
    }
    
    func test_removeFirst호출시_현재head의Node를삭제하고_다음데이터로붙인다() {
        // given
        sut.tail = Node(data: 2)
        sut.head = Node(data: 1, next: sut.tail)
        sut.count = 2
        let expectation = 2
        
        // when
        sut.removeFirst()
        let result = sut.head?.data
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    
}
