//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/10.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testCalculatorItemQueueEnqueue_givenNewInteger_expectNotEmpty() {
        let newData = 10
        sut.enqueue(newData)
        XCTAssertTrue(sut.isNotEmpty)
    }
    
    func testCalculatorItemQueueDequeue_givenNewInteger_expectFirstItemEqualToInsertedItem() {
        let newData = 10
        sut.enqueue(newData)
        let removedItem = sut.dequeue()
        guard let removedItem = removedItem as? Int else {
            return
        }
        XCTAssertEqual(removedItem, newData)
    }
    
    func testCalculatorItemQueueDequeue_givenNewOperator_expectFirstItemEqualToInsertedItem() {
        let newData = "+"
        sut.enqueue(newData)
        let removedItem = sut.dequeue()
        guard let removedItem = removedItem as? String else {
            return
        }
        XCTAssertEqual(removedItem, newData)
    }
    
    func testCalculatorItemQueueEnqueue_givenMultipleMixedItems_expectCorrectSequence() {
        let newItems: [Any] = [20, "+", 30, "-", 2]
        appendContents(of: newItems, to: &sut)
        XCTAssertTrue(isSameSequence(sequence: sut.convertToArray, otherSequence: newItems))
    }
    
    func appendContents(of sequence: [Any], to queue: inout CalculatorItemQueue<Any>) {
        for item in sequence {
            queue.enqueue(item)
        }
    }
    
    func isSameSequence(sequence: [Any], otherSequence: [Any]) -> Bool {
        let firstConvertedSequence = convertToTestableType(sequence: sequence)
        let secondConvertedSequence = convertToTestableType(sequence: otherSequence)
        return firstConvertedSequence == secondConvertedSequence
    }
    
    func convertToTestableType(sequence: [Any]) -> [LinkedListItem] {
        var testableList: [LinkedListItem] = []
        for item in sequence {
            if let convertedItem = convertToLinkedListItem(value: item) {
                testableList.append(convertedItem)
            }
        }
        return testableList
    }
    
    private func convertToLinkedListItem(value: Any) -> LinkedListItem? {
        if let value = value as? Int {
            return LinkedListItem.number(value: value)
        }
        if let value = value as? String {
            return LinkedListItem.symbol(value: value)
        }
        return nil
    }
}

extension CalculatorItemQueue {
    var length: Int {
        return list.length
    }
    
    var convertToArray: [T] {
        var convertedArray: [T] = []
        for i in 0..<length {
            if let node = list.getNode(at: i) {
                convertedArray.append(node.item)
            }
        }
        return convertedArray
    }
}
