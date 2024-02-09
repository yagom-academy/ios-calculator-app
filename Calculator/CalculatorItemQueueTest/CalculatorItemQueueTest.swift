//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by EUNJI CHOI on 2/10/24.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEnqueueAndDequeue() {
        var queue = CalculatorItemQueue<Int>()
        XCTAssertTrue(queue.isEmpty, "시작 시, 큐는 비어 있어야 합니다")

        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertFalse(queue.isEmpty, "큐가 비어 있지 않아야 합니다")
        XCTAssertEqual(queue.count, 3, "큐에는 3개의 element 가 존재해야 합니다")

        let dequeuedItem1 = queue.dequeue()
        XCTAssertEqual(dequeuedItem1, 1, "dequeue된 element는 1이어야 합니다")
        
        let dequeuedItem2 = queue.dequeue()
        XCTAssertEqual(dequeuedItem2, 2, "dequeue된 element는 2이어야 합니다")

        queue.enqueue(4)
        XCTAssertEqual(queue.count, 2, "dequeue->dequeue->enqueue 한 후에는 큐에 2개의 element가 있어야 합니다")

        let dequeuedItem3 = queue.dequeue()
        XCTAssertEqual(dequeuedItem3, 3, "dequeue된 element은 3이어야 합니다")

        let dequeuedItem4 = queue.dequeue()
        XCTAssertEqual(dequeuedItem4, 4, "dequeue된 element은 4이어야 합니다")
        
        XCTAssertTrue(queue.isEmpty, "모든 아이템을 dequeue한 후에는 큐는 empty 상태이어야 합니다")
    }

    func testPeek() {
        var queue = CalculatorItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        
        let headValue = queue.head?.value
        XCTAssertEqual(headValue, 1, "헤드 값은 1이어야 합니다")
    }

    func testRemoveAll() {
        var queue = CalculatorItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.removeAll()
        XCTAssertTrue(queue.isEmpty, "모든 element를 제거한 후에는 큐는 empty 상태이어야 합니다")
    }
    
    func testPrepend() {
        var queue = CalculatorItemQueue<Int>()
        
        XCTAssertTrue(queue.isEmpty, "시작 시, 큐는 비어 있어야 합니다")
        
        queue.prepend(1)
        XCTAssertFalse(queue.isEmpty, "element를 앞에 추가한 후에는 큐가 비어 있지 않아야 합니다")
        XCTAssertEqual(queue.head?.value, 1, "1을 앞에 추가한 후에는 헤드 값이 1이어야 합니다")
        
        queue.prepend(2)
        XCTAssertEqual(queue.head?.value, 2, "2를 앞에 추가한 후에는 헤드 값이 2가 되어야 합니다. 또한 2는 새로운 헤드가 되야 합니다")
        
        XCTAssertEqual(queue.count, 2, "두 번의 추가 후에는 큐에 2개의 아이템이 있어야 합니다")
    }
    
    func testFirstMatching() {
        var queue = CalculatorItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        let existingNode = queue.first(matching: 2)
        XCTAssertNotNil(existingNode, "값이 있어야 합니다")
        XCTAssertEqual(existingNode?.value, 2, "찾은 노드의 값은 2가 되어야 합니다")
        
        let nonExistingNode = queue.first(matching: 4)
        XCTAssertNil(nonExistingNode, "4는 존재하면 안 됩니다")
    }
    
    func testInsertBefore() {
        var queue = CalculatorItemQueue<Int>()
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3
        
        queue.enqueue(firstElement)
        queue.enqueue(thirdElement)
        
        if let nodeToInsertBefore = queue.first(matching: thirdElement) {
            queue.insert(secondElement, before: nodeToInsertBefore)
        }
        
        var current = queue.head
        XCTAssertEqual(current?.value, firstElement, "첫 번째는 1이어야 합니다")
        current = current?.next
        XCTAssertEqual(current?.value, secondElement, "두 번째는 2이어야 합니다")
        current = current?.next
        XCTAssertEqual(current?.value, thirdElement, "세 번째는 3이어야 합니다")
    }
}
