//
//  QueueTest.swift
//  QueueTest
//
//  Created by 강민수 on 2023/01/24.
//

import XCTest
@testable import Calculator

final class QueueTest: XCTestCase {
    
    var sut: Queue?

    override func setUpWithError() throws {
        sut = Queue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    private func enqueueNodes(_ nodes: Node...) {
        for node in nodes {
            sut?.enqueue(node)
        }
    }
    
    func test_Queue가_처음_생성되면_head와_tail이_nil이다() {
        XCTAssertEqual(sut?.head == nil, sut?.tail == nil)
    }
    
    func test_Queue가_비어있을때_isEmpty프로퍼티는_true이다() {
        XCTAssertTrue(sut!.isEmpty)
    }
    
    func test_Queue가_비어있지않으면_isEmpty프로퍼티는_false이다() {
        sut?.head = Node(value: "b")
        
        XCTAssertFalse(sut!.isEmpty)
    }
    
    func test_Queue가_비어있을때_값을_추가하면_head와_tail은_같은_Node를_가진다() {
        let node = Node(value: "a")
        sut?.enqueue(node)
        
        XCTAssertEqual(sut!.head!.value, sut!.tail!.value)
    }
    
    func test_Queue에_node를_하나씩_넣는다면_tail에_들어간다() {
        let firstNode = Node(value: "1")
        let secondNode = Node(value: "2")
        
        enqueueNodes(firstNode, secondNode)
        
        XCTAssertEqual(secondNode.value, sut!.tail!.value)
    }
    
    func test_Queue가_2개일_경우_head의_next는_tail을_가리킨다() {
        let firstNode = Node(value: "1")
        let secondNode = Node(value: "2")
        
        enqueueNodes(firstNode, secondNode)
        
        let headNextValue = sut!.head!.next!.value
        let tailValue = sut!.tail!.value
        
        XCTAssertEqual(headNextValue, tailValue)
    }
    
    func test_Queue가_2개일_경우_tail의_prev는_head를_가리킨다() {
        let firstNode = Node(value: "1")
        let secondNode = Node(value: "2")
        
        enqueueNodes(firstNode, secondNode)
        
        let tailPrevValue = sut!.tail!.prev!.value
        let headValue = sut!.head!.value
        
        XCTAssertEqual(tailPrevValue, headValue)
    }
    
    func test_Queue가_3개일경우_tail의_prev와_head의_next는_같은_값을_가리킨다() {
        let firstNode = Node(value: "1")
        let secondNode = Node(value: "2")
        let thirdNode = Node(value: "3")
        
        enqueueNodes(firstNode, secondNode, thirdNode)
        
        let tailPrevValue = sut!.tail!.prev!.value
        let headNextValue = sut!.head!.next!.value
        
        let tailPrevValueEqual = tailPrevValue == secondNode.value
        let headNextValueEqual = headNextValue == secondNode.value
        
        XCTAssertTrue(tailPrevValueEqual)
        XCTAssertTrue(headNextValueEqual)
    }
    
    func test_Queue가_2개이상일_경우_tail의_next는_항상_head를_가리킨다() {
        let firstNode = Node(value: "1")
        let secondNode = Node(value: "2")
        let thirdNode = Node(value: "3")
        
        enqueueNodes(firstNode, secondNode, thirdNode)
        
        let headValue = sut!.head!.value
        let tailNextValue = sut!.tail!.next!.value
        
        XCTAssertTrue(headValue == tailNextValue)
    }
    
    func test_비어있는_Queue를_dequeue할_경우_nil을_반환한다() {
        let headNode = sut!.head
        
        XCTAssertNil(headNode)
    }
    
    func test_3개_Node를_가진_Queue를_dequeue_할_경우_head값을_반환한다() {
        let firstNode = Node(value: "1")
        let secondNode = Node(value: "2")
        let thirdNode = Node(value: "3")
        
        enqueueNodes(firstNode, secondNode, thirdNode)
        
        let dequeueNode = sut?.dequeue()
        
        let equalHeadAndDequeueNode = firstNode.value == dequeueNode!.value
        
        XCTAssertTrue(equalHeadAndDequeueNode)
    }
    
    func test_3개_Node를_가진_Queue를_3번_반환할_경우_들어간_순서대로_dequeue값이_나온다() {
        let firstNode = Node(value: "1")
        let secondNode = Node(value: "2")
        let thirdNode = Node(value: "3")
        
        enqueueNodes(firstNode, secondNode, thirdNode)
        
        let firstDequeueNode = sut?.dequeue()
        let secondDequeueNode = sut?.dequeue()
        let thirdDequeueNode = sut?.dequeue()
        
        let equalFirst = firstNode.value == firstDequeueNode!.value
        let equalSecond = secondNode.value == secondDequeueNode!.value
        let equalThird = thirdNode.value == thirdDequeueNode!.value
        
        XCTAssertTrue(equalFirst)
        XCTAssertTrue(equalSecond)
        XCTAssertTrue(equalThird)
    }
    
    func test_Queue의_removeAll메소드를_사용할경우_head와_tail은_nil값이_된다() {
        let firstNode = Node(value: "1")
        let secondNode = Node(value: "2")
        let thirdNode = Node(value: "3")
        
        enqueueNodes(firstNode, secondNode, thirdNode)
        
        sut?.removeAll()
        
        XCTAssertNil(sut?.head)
        XCTAssertNil(sut?.tail)
    }
}
