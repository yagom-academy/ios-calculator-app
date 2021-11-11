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
        guard let removedItem = sut.dequeue() as? Int else { return }
        XCTAssertEqual(removedItem, newData)
    }
    
    func testCalculatorItemQueueDequeue_givenNewOperator_expectFirstItemEqualToInsertedItem() {
        let newData = "+"
        sut.enqueue(newData)
        let removedItem = sut.dequeue()
        guard let removedItem = removedItem as? String else { return }
        XCTAssertEqual(removedItem, newData)
    }
    
    func testCalculatorQueueDequeue_givenRemoveAllOfMultipleMixedItems_expectIsEmpty() {
        let newItems: [Any] = [20, "+", 30, "-", 2]
        appendContents(of: newItems, to: &sut)
        sut.removeAll()
        XCTAssertTrue(sut.isEmpty)
    }
    
    func testCalculatorQueueDequeue_givenMultipleDequeue_expectIsEmpty() {
        let newItems: [Any] = [20, "+", 30, "-", 2]
        appendContents(of: newItems, to: &sut)
        removeAll(of: &sut)
        XCTAssertTrue(sut.isEmpty)
    }
    
    private func appendContents(of sequence: [Any], to queue: inout CalculatorItemQueue<Any>) {
        for item in sequence {
            queue.enqueue(item)
        }
    }
    
    private func isEqualSequence(sequence: [Any], otherSequence: [Any]) -> Bool {
        let firstConvertedSequence = convertToTestableType(sequence: sequence)
        let secondConvertedSequence = convertToTestableType(sequence: otherSequence)
        
        return firstConvertedSequence == secondConvertedSequence
    }
    
    private func convertToTestableType(sequence: [Any]) -> [DummyItem] {
        var testableList: [DummyItem] = []
        for item in sequence {
            if let convertedItem = convertToLinkedListItem(value: item) {
                testableList.append(convertedItem)
            }
        }
        return testableList
    }
    
    private func convertToLinkedListItem(value: Any) -> DummyItem? {
        if let value = value as? Int {
            return DummyItem.number(value: value)
        }
        if let value = value as? String {
            return DummyItem.symbol(value: value)
        }
        return nil
    }
    
    private func removeAll(of queue: inout CalculatorItemQueue<Any>) {
        while queue.isNotEmpty {
            queue.dequeue()
        }
    }
}
