//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/09.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var queue: CalculatorItemQueue = CalculatorItemQueue()
    
    // MARK: QueueList isEmpty test
    func test_QueueListisnotEmpty() {
        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()).isEmpty, true)
    }
    
    // MARK: CalculatorItemQueue enqueue test
    func test_QueueListEnqueue() {
        queue.enqueue(item: NumberItem(data: 1))
        
        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), ["1"])
    }
    
    func test_QueueListSort() {
        queue.enqueue(item: NumberItem(data: 2))
        queue.enqueue(item: NumberItem(data: 1))

        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), ["2","1"])
    }

    func test_QueueListEnqueueNil() {
        queue.enqueue(item: nil)

        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), [])
    }
    
    func test_QueueListEnqueueOperatorItem() {
        queue.enqueue(item: OperatorItem.add)

        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), ["+"])
    }

    func test_QueueListEnqueueOperatorAndNumber() {
        queue.enqueue(item: OperatorItem.add)
        queue.enqueue(item: OperatorItem.divide)
        queue.enqueue(item: NumberItem(data: 2))

        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), ["+","/","2"])
    }
    
    // MARK: CalculatorItemQueue dequeue test
    func test_QueueListDequeue() {

        guard let removedItem = queue.dequeue() else {
            return
        }
        var data = ""
        if let number = removedItem as? NumberItem {
            data = number.dataToString
        }

        XCTAssertEqual(data, "1")
    }

    func test_EmptyQueueListDequeue() {
        _ = queue.dequeue()
        let data2 = queue.dequeue()

        var data: String?
        if let number = data2 as? NumberItem {
            data = number.dataToString
        }

        XCTAssertEqual(data, nil)
    }
    
    // MARK: CalculatorItemQueue clearQueue test
    func test_QueueListClear() {
        queue.clearQueue()

        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), [])
    }

    // MARK: CalculatorItemQueue Several Queue test
    func test_AnotherQueueListInit() {
        var calculatorQueue: CalculatorItemQueue = CalculatorItemQueue()
        var preparedCalculatorQueue: CalculatorItemQueue = CalculatorItemQueue()

        calculatorQueue.enqueue(item: OperatorItem.add)
        preparedCalculatorQueue.enqueue(item: NumberItem(data: 3))

        XCTAssertEqual(convertList(list: calculatorQueue.queueListForTest.searchAll()), ["+"])
        XCTAssertEqual(convertList(list: preparedCalculatorQueue.queueListForTest.searchAll()), ["3"])
    }
}

extension CalculatorTests {
    func convertList(list: [CalculateItem]) -> [String] {
        var compareList:[String] = []
        
        for item in list {
            if let number = item as? NumberItem {
                compareList.append(number.dataToString)
            }
            if let operatorItem = item as? OperatorItem {
                compareList.append(operatorItem.operatorSymbol)
            }
        }
        
        return compareList
    }
}
