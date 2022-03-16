//  CalculatorTests.swift
//  CalculatorTests
//  Created by LIMGAUI on 2022/03/15

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: LinkedList<Int>!
    var queue: CalculateItemQueue<Int>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
        queue = CalculateItemQueue<Int>()
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        queue = nil
    }
    
    func test_nodeInitializer_isSuccess() {
        let nodes = Node<Int>(data: nil, next: nil)
        
        let result = LinkedList<Int>()
        
        XCTAssertEqual(result.head?.data, nodes.data)
    }
    
    func test_LinkedList인스턴스가nil일때_count0이나오는지() {
        sut.head = nil
        
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_LinkedList인스턴스가값이있을떄_count1이나오는지() {
        sut.head = Node(data: 1, next: nil)
        
        let result = sut.count
        
        XCTAssertEqual(result, 1)
    }
    
    func test_LinkedList인스턴스가data와next까지값가지고있을때_count2가나오는지() {
        sut.head = Node(data: 1, next: Node(data: 1, next: nil))
        
        let result = sut.count
        
        XCTAssertEqual(result, 2)
    }
    
    func test_LinkedList인스턴스Node길이가10일때_count10이나오는지() {
        sut.head = Node(data: 1, next: Node(data: 2, next: Node(data: 3, next: Node(data: 4, next: Node(data: 5, next: Node(data: 6, next: Node(data: 7, next: Node(data: 8, next: Node(data: 9, next: Node(data: 10, next: nil))))))))))
        
        let result = sut.count
        
        XCTAssertEqual(result, 10)
    }
    
    func test_append메서드3번호출시_nodeCount값이_3이나오는지() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        
        let result = sut.count
        
        XCTAssertEqual(result, 3)
    }
    
    func test_append메서드3을넣어호출시_보낸data값3이나오는지() {
        sut.append(data: 3)
        
        let result = sut.head?.data
        
        XCTAssertEqual(result, 3)
    }
    
    func test_append메서드10번호출후_head는1_tail은10값이나오는지() {
        for number in 1...10 {
            sut.append(data: number)
        }
        let head = sut.head?.data
        let tail = sut.tail?.data
        
        XCTAssertEqual(head, 1)
        XCTAssertEqual(tail, 10)
    }
    
    func test_removeFirst메서드호출시_값5가_나오는지() {
        sut.append(data: 5)
        
        let result = sut.removeFirst()
        
        XCTAssertEqual(result, 5)
    }
    
    func test_append메서드5번호출후_removeFirst메서드5번호출후_count값이0이나오는지() {
        for number in 1...5 {
            sut.append(data: number)
        }
        for _ in 1...5 {
            let _ = sut.removeFirst()
        }
        
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_append메서드10000번호출후_removeFirst메서드9999번호출후_마지막RemoveFirst메서드호출한값이10000이_나오는지() {
        for number in 1...10000 {
            sut.append(data: number)
        }
        for _ in 1...9999 {
            let _ = sut.removeFirst()
        }
        
        let result = sut.removeFirst()
        
        XCTAssertEqual(result, 10000)
    }
    
    func test_append메서드를사용하지않고_isEmpty메서드를호출했을때_False가나오는지() {
        let result = queue.isEmpty
        
        XCTAssertEqual(result, false)
    }
    
    func test_enqueue메서드호출후_isEmpty메서드호출값이_True가나오는지() {
        queue.enqueue(1)
        
        let result = queue.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue메서드호출10번후_count값이10이나오는지() {
        for number in 1...10 {
            queue.enqueue(number)
        }
        let result = queue.count
        
        XCTAssertEqual(result, 10)
    }
    
    func test_enqueue메서드호출1000번후_dequeue999번후에_count값1이나오는지() {
        for number in 1...1000 {
            queue.enqueue(number)
        }
        for _ in 1...999 {
            let _ = queue.dequeue()
        }
        let result = queue.count
        
        XCTAssertEqual(result, 1)
    }
}
