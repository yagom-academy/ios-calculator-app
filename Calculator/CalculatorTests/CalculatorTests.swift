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
    
    func testQueueListappend() {
        queue.enqueue(item: NumberItem(data: 1))
        
        XCTAssertEqual(convertList(list: queue.queueList.searchAll()), ["1"])
    }

    func testQueueListisnotEmpty() {
        XCTAssertEqual(convertList(list: queue.queueList.searchAll()).isEmpty, true)
    }


    func testQueueSort() {
        queue.enqueue(item: NumberItem(data: 2))
        queue.enqueue(item: NumberItem(data: 1))

        XCTAssertEqual(convertList(list: queue.queueList.searchAll()), ["2","1"])
    }

    func testQueueAppendnil() {
        queue.enqueue(item: nil)

        XCTAssertEqual(convertList(list: queue.queueList.searchAll()), [])
    }

    func testQueueRemove() {

        guard let removedItem = queue.dequeue() else {
            return
        }
        var data = ""
        if let number = removedItem as? NumberItem {
            data = number.dataToString
        }

        XCTAssertEqual(data, "1")
    }

    func testEmptyQueueRemove() {
        let data1 = queue.dequeue()
        let data2 = queue.dequeue()

        var data: String?
        if let number = data2 as? NumberItem {
            data = number.dataToString
        }

        XCTAssertEqual(data, nil)
    }

    func testQueueListClear() {
        queue.clearQueue()

        XCTAssertEqual(convertList(list: queue.queueList.searchAll()), [])
    }

    func testQueueListappendOperatorItem() {
        queue.enqueue(item: OperatorItem.add)

        XCTAssertEqual(convertList(list: queue.queueList.searchAll()), ["+"])
    }

    func testQueueListAppendOperatorAndNumber() {
        queue.enqueue(item: OperatorItem.add)
        queue.enqueue(item: OperatorItem.divide)
        queue.enqueue(item: NumberItem(data: 2))

        XCTAssertEqual(convertList(list: queue.queueList.searchAll()), ["+","/","2"])
    }

    func testAnotherCalculatorQueueInit() {
        var calculatorQueue: CalculatorItemQueue = CalculatorItemQueue()
        var preparedCalculatorQueue: CalculatorItemQueue = CalculatorItemQueue()

        calculatorQueue.enqueue(item: OperatorItem.add)
        preparedCalculatorQueue.enqueue(item: NumberItem(data: 3))

        XCTAssertEqual(convertList(list: calculatorQueue.queueList.searchAll()), ["+"])
        XCTAssertEqual(convertList(list: preparedCalculatorQueue.queueList.searchAll()), ["3"])
    }

    func convertList(list: [CalcultorItem]) -> [String] {
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
