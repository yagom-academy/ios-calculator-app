//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by EUNJI CHOI on 2/10/24.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTest: XCTestCase {
    private var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
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
    
    func test_큐가_비어있는지_확인할_수_있다() {
        XCTAssertTrue(sut.isEmpty, "시작 시 큐는 비어 있어야 합니다.")
    }
    
    func test_큐에_값을_삽입할_수_있다() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        XCTAssertFalse(sut.isEmpty, "큐가 비어 있지 않아야 합니다.")
        XCTAssertEqual(sut.count, 3, "큐에는 3개의 element가 존재해야 합니다.")
    }
    
    func test_큐에서_값을_삭제할_수_있다() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let dequeuedItem1 = sut.dequeue()
        XCTAssertEqual(dequeuedItem1, 1, "dequeue된 element는 1이어야 합니다.")
        
        let dequeuedItem2 = sut.dequeue()
        XCTAssertEqual(dequeuedItem2, 2, "dequeue된 element는 2이어야 합니다.")
    }

    func test_큐의_맨_앞_값을_확인할_수_있다() {
        sut.enqueue(1)
        sut.enqueue(2)
        
        let headValue = sut.head?.value
        XCTAssertEqual(headValue, 1, "헤드 값은 1이어야 합니다.")
    }

    func test_큐의_모든_값을_제거할_수_있다() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.removeAll()
        
        XCTAssertTrue(sut.isEmpty, "모든 element를 제거한 후에는 큐는 empty 상태이어야 합니다.")
    }
    
    func test_특정_값을_가진_노드를_찾을_수_있다() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let existingNode = sut.first(matching: 2)
        XCTAssertNotNil(existingNode, "값이 있어야 합니다.")
        XCTAssertEqual(existingNode?.value, 2, "찾은 노드의 값은 2가 되어야 합니다.")
        
        let nonExistingNode = sut.first(matching: 4)
        XCTAssertNil(nonExistingNode, "4는 존재하면 안 됩니다.")
    }
    
    func test_특정_노드_앞에_값을_추가할_수_있다() {
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3
        
        sut.enqueue(firstElement)
        sut.enqueue(thirdElement)
        
        if let nodeToInsertBefore = sut.first(matching: thirdElement) {
            sut.insert(secondElement, before: nodeToInsertBefore)
        }
        
        var current = sut.head
        XCTAssertEqual(current?.value, firstElement, "첫 번째는 1이어야 합니다.")
        current = current?.next
        XCTAssertEqual(current?.value, secondElement, "두 번째는 2이어야 합니다.")
        current = current?.next
        XCTAssertEqual(current?.value, thirdElement, "세 번째는 3이어야 합니다.")
    }

    func test_큐의_앞에_값을_추가하고_삭제할_수_있다() {
        // Given
        sut.enqueue(2)
        sut.enqueue(3)
        
        // When
        sut.insert(1, before: sut.head!)
        let dequeuedItem1 = sut.dequeue()
        let dequeuedItem2 = sut.dequeue()
        let dequeuedItem3 = sut.dequeue()
        
        // Then
        XCTAssertEqual(dequeuedItem1, 1, "dequeue된 element는 1이어야 합니다.")
        XCTAssertEqual(dequeuedItem2, 2, "dequeue된 element는 2이어야 합니다.")
        XCTAssertEqual(dequeuedItem3, 3, "dequeue된 element는 3이어야 합니다.")
    }
}
