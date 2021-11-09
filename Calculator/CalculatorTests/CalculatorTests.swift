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
    
    func testQueueListisnotEmpty() {
        XCTAssertEqual(queue.queueList.isEmpty, false)
    }
    
    func testQueueListappend() {
        queue.append(item: numberItem(number: "1"))
        
        XCTAssertEqual(queue.queueList, [])
    }
    
    func testQueueSort() {
        queue.append(item: "2")
        queue.append(item: "1")
        
        XCTAssertEqual(queue.queueList, ["1","2","1"])
    }
    
    func testQueueAppendnil() {
        queue.append(item: nil)
        
        XCTAssertEqual(queue.queueList, ["1"])
    }
    
    func testQueueRemove() {
        
        guard let removedItem = queue.remove() else {
            return
        }
        
        XCTAssertEqual(removedItem, "1")
    }
    
    func testEmptyQueueRemove() {
        queue.remove()
        XCTAssertEqual(queue.remove(), nil)
    }
    
    func testQueueListClear() {
        queue.clearList()
        
        XCTAssertEqual(queue.queueList, [])
    }
}
