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
        let queueList = LinkedList<Int>()
        sut = CalculatorItemQueue(list: queueList)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
//MARK: - enqueue Test
    func test_enqueue호출시_파라미터로전달된값이_queue에추가된다() {
        // given
        let input = 1
        let expectedResult = 1

        // when
        sut.enqueue(input)
        let result = sut.itemCount

        // then
        XCTAssertEqual(result, expectedResult)
    }

//MARK: - dequeue Test
    func test_dequeue호출시_queue의_itemCount가_1감소한다() {
        // given
        let firstNode = Node(data: 1)
        let secondNode = Node(data: 2)
        let queueList = LinkedList<Int>(head: firstNode,
                                        tail: secondNode,
                                        count: 2)
        sut = CalculatorItemQueue(list: queueList)
        let expectedCount = 1

        // when
        sut.dequeue()
        let count = sut.itemCount

        // then
        XCTAssertEqual(count, expectedCount)
    }

    func test_dequeue호출시_제거된element를return한다() {
        // given
        let firstNode = Node(data: 1)
        let secondNode = Node(data: 2)
        let queueList = LinkedList<Int>(head: firstNode,
                                        tail: secondNode,
                                        count: 2)
        sut = CalculatorItemQueue(list: queueList)
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
    func test_removeAll호출시_queue의_itemCount가_0이된다() {
        // given
        let thirdNode = Node(data: 3)
        let secondNode = Node(data: 2, next: thirdNode)
        let firstNode = Node(data: 1, next: secondNode)
        let queueList = LinkedList<Int>(head: firstNode,
                                        tail: thirdNode,
                                        count: 3)
        sut = CalculatorItemQueue(list: queueList)
        let expectedResult = 0

        // when
        sut.removeAll()
        let result = sut.itemCount

        // then
        XCTAssertEqual(result, expectedResult)
    }

}
