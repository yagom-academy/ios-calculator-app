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
    func test_QueueList는_초기에_empty값을_갖는다() {
        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()).isEmpty, true)
    }
    
    // MARK: CalculatorItemQueue enqueue test
    func test_QueueList_enqueue_정상동작한다() {
        queue.enqueue(item: NumberItem(data: 1))
        
        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), ["1"])
    }
    
    func test_QueueList는_순서를_갖지않는다() {
        queue.enqueue(item: NumberItem(data: 2))
        queue.enqueue(item: NumberItem(data: 1))

        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), ["2","1"])
    }
    
    func test_QueueList_Enqueue에_opreratorItem을_넣으면_정상동작한다() {
        queue.enqueue(item: OperatorItem.add)

        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), ["+"])
    }

    func test_QueueList_Enqueue_OperatorItem과NumberItem을_넣으면_정상동작한다() {
        queue.enqueue(item: OperatorItem.add)
        queue.enqueue(item: OperatorItem.divide)
        queue.enqueue(item: NumberItem(data: 2))

        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), ["+","/","2"])
    }
    
    // MARK: CalculatorItemQueue dequeue test
    func test_QueueList에_Dequeue_정상동작한다() {
        queue.enqueue(item: NumberItem(data: 1))
        
        guard let removedItem = queue.dequeue() else { return }
        
        var data = ""
        if let number = removedItem as? NumberItem {
            data = number.dataToString
        }

        XCTAssertEqual(data, "1")
    }
    
    func test_QueueList에_Dequeue_2번이상실행해도_정상동작한다() {
        queue.enqueue(item: NumberItem(data: 2))
        queue.enqueue(item: NumberItem(data: 1))
        queue.enqueue(item: NumberItem(data: 3))
        
        let firstRemovedItem = queue.dequeue()
        let secodeRemovedItem = queue.dequeue()

        XCTAssertEqual(convertItem(item: firstRemovedItem), "2")
        XCTAssertEqual(convertItem(item: secodeRemovedItem), "1")
    }

    func test_빈QueueList_Dequeue_nil을_반환한다() {
        let item = queue.dequeue()

        XCTAssertEqual(convertItem(item: item), nil)
    }
    
    // MARK: CalculatorItemQueue clearQueue test
    func test_QueueList_안의_데이터를_모두_지운다() {
        queue.enqueue(item: OperatorItem.add)
        queue.enqueue(item: OperatorItem.divide)
        queue.enqueue(item: NumberItem(data: 1))
        queue.enqueue(item: NumberItem(data: 2))
        
        queue.clearQueue()

        XCTAssertEqual(convertList(list: queue.queueListForTest.searchAll()), [])
    }

    // MARK: CalculatorItemQueue Several Queue test
    func test_여러개의_QueueList_생성한다() {
        var calculatorQueue: CalculatorItemQueue = CalculatorItemQueue()
        var preparedCalculatorQueue: CalculatorItemQueue = CalculatorItemQueue()

        calculatorQueue.enqueue(item: OperatorItem.add)
        preparedCalculatorQueue.enqueue(item: NumberItem(data: 3))

        XCTAssertEqual(convertList(list: calculatorQueue.queueListForTest.searchAll()), ["+"])
        XCTAssertEqual(convertList(list: preparedCalculatorQueue.queueListForTest.searchAll()), ["3"])
    }
}

extension CalculatorTests {
    func convertList(list: [CalculateItem]) -> [String?] {
        var compareList: [String?] = []
        
        for item in list {
            compareList.append(convertItem(item: item))
        }
        return compareList
    }
    
    func convertItem(item: CalculateItem?) -> String? {
        guard let item = item else {
            return nil
        }
        
        if let number = item as? NumberItem {
            return number.dataToString
        }
        if let operatorItem = item as? OperatorItem {
            return operatorItem.operatorSymbol
        }
        return nil
    }
}
