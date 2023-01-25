//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Rowan on 2023/01/24.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        var queueList = LinkedList<Int>()
        sut = CalculatorItemQueue<Int>(queue: queueList)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
//MARK: - enqueue Test
    func test_enqueue호출시_파라미터로전달된값이_queue에추가된다() {
        // given
        let input = 1
        let expectation = 1
        
        // when
        sut.enqueue(input)
        let result = sut.queue.tail?.data
        let count = sut.queue.count
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(count, expectation)
    }
    
//MARK: - dequeue Test
    func test_dequeue호출시_queue의removeFirst메서드를호출한다() {
        // given
        sut.queue.tail = Node(data: 2)
        sut.queue.head = Node(data: 1, next: sut.queue.tail)
        sut.queue.count = 2
        let countExpectation = 1
        let resultExpectation = 2
        
        // when
        sut.dequeue()
        let count = sut.queue.count
        let resultTail = sut.queue.tail?.data

        // then
        XCTAssertEqual(count, countExpectation)
        XCTAssertEqual(resultTail, resultExpectation)
    }

    func test_dequeue호출시_제거된element를return한다() {
        // given
        sut.queue.head = Node(data: 1)
        sut.queue.tail = sut.queue.head
        sut.queue.count = 1
        let expectation = 1

        // when
        let result = sut.dequeue()

        // then
        XCTAssertEqual(result, expectation)
    }

    func test_dequeue호출시_queue가비어있는경우nil을반환한다() {
        // given
        let expectation: Int? = nil
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
//MARK: - removeAll Test
    func test_removeAll호출시_queue의removeAll이호출된다() {
        // given
        sut.queue.tail = Node(data: 3)
        sut.queue.head = Node(data: 1,
                              next: Node(data: 2, next: sut.queue.tail))
        sut.queue.count = 3
        let expectation = 0
        let tailExpectation: Int? = nil
        let centerExpectation: Int? = nil
        
        // when
        sut.removeAll()
        let result = sut.queue.count
        let tailResult = sut.queue.tail?.data
        let centerResult = sut.queue.head?.next?.data
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(tailResult, tailExpectation)
        XCTAssertEqual(centerResult, centerExpectation)
    }

}
