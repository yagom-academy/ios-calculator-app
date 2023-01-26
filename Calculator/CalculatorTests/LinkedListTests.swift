//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Harry on 2023/01/25.
//

import XCTest

final class LinkedListTests: XCTestCase {
    var sut: StubLinkedList!

    override func setUpWithError() throws {
        sut = StubLinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - isEmpty Test
    func test_isEmpty접근시count가0일떄_true를반환한다() {
        // given
        sut.count = 0
        let expectedResult = true
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    // MARK: - appendLast Test
    func test_head가nil이면_appendLast호출시_count가_1이된다() {
        let expectedResult = 1
        
        if sut.isEmpty {
            sut.appendLast(1)
        }
        let result = sut.count
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_appendLast호출시_head가있다면_tail뒤에_추가된다() {
        let headValue = 1
        let secondValue = 2
        sut.appendLast(headValue)
        sut.appendLast(secondValue)
        
        let result = sut.head?.next?.value as? Int
        
        XCTAssertEqual(secondValue, result)
    }
    
    func test_appendLast_3번_호출시_count가3이다() {
        sut.appendLast(1)
        sut.appendLast(2)
        sut.appendLast(3)
        let expectedResult = 3
        
        let result = sut.count
        
        XCTAssertEqual(result, expectedResult)
    }
    
    // MARK: - removeFirst Test
    func test_head가_nil일경우_removeFirst를호출하면_메서드를_종료한다() {
        sut.removeFirst()
        let expectedResult: Int? = nil
        
        let result = sut.head?.value as? Int
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_노드가1개있을떄_removeFirst를_호출하면_head와_tail은_nil이된다() {
        sut.head = Node(value: 1)
        sut.tail = sut.head
        let expectedResult: Int? = nil
        
        sut.removeFirst()
        let resultHead = sut.head?.value as? Int
        let resultTail = sut.tail?.value as? Int
        
        XCTAssertEqual(resultHead, expectedResult)
        XCTAssertEqual(resultTail, expectedResult)
    }
    
    func test_노드가2개있을때_removeFirst를_호출하면_두번째노드가_head이자_tail이된다() {
        sut.tail = Node(value: 2)
        sut.head = Node(value: 1, next: sut.tail)
        let expectedResult = 2
        
        sut.removeFirst()
        let resultHead = sut.head?.value as? Int
        let resultTail = sut.tail?.value as? Int
        
        XCTAssertEqual(resultHead, expectedResult)
        XCTAssertEqual(resultTail, expectedResult)
    }
    
    func test_노드가3개있을때_removeFirst를_호출하면_두번째노드가_head가된다() {
        sut.tail = Node(value: 3)
        sut.head = Node(value: 1, next: Node(value: 2, next: sut.tail))
        let expectedResult = 2
        
        sut.removeFirst()
        let result = sut.head?.value as? Int
        
        XCTAssertEqual(result, expectedResult)
    }
    
    // MARK: - removeAll Test
    func test_removeAll을_호출하면_head와tail이_nil이된다() {
        sut.head = Node(value: 1)
        sut.tail = sut.head
        let expectedResult: Int? = nil
        
        sut.removeAll()
        let resultHead = sut.head?.value as? Int
        let resultTail = sut.tail?.value as? Int
        
        XCTAssertEqual(resultHead, expectedResult)
        XCTAssertEqual(resultTail, expectedResult)
    }
    
    func test_removeAll을_호출하면_count는_0이다() {
        sut.head = Node(value: 1)
        sut.tail = sut.head
        let expectedResult = 0
        
        sut.removeAll()
        let result = sut.count
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_node가_3개일때_removeAll을_호출하면_node가_모두삭제된다() {
        sut.tail = Node(value: 3)
        sut.head = Node(value: 1, next: Node(value: 2, next: sut.tail))
        let expectedResult: Int? = nil
        
        sut.removeAll()
        let resultHead = sut.head?.value as? Int
        let resultCenter = sut.head?.next?.value as? Int
        let resultTail = sut.tail?.value as? Int
        
        XCTAssertEqual(resultHead, expectedResult)
        XCTAssertEqual(resultCenter, expectedResult)
        XCTAssertEqual(resultTail, expectedResult)
    }
}
