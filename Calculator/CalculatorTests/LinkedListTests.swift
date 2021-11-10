//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/09.
//

import XCTest
@testable import Calculator

enum LinkedListItem: Equatable {
    case number(value: Int)
    case symbol(value: String)
}

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLinkedListAppend_givenNewNode_expectNotEmpty() {
        let newItem = 10
        sut.append(newItem)
        XCTAssertTrue(sut.isNotEmpty)
    }
    
    func testLinkedListAppend_givenNewIntegers_expectHeadEqualToFirstItem() {
        let newItems = [1, 2]
        let firstInsertedItem = LinkedListItem.number(value: newItems[0])
        appendContents(of: newItems, to: &sut)
        XCTAssertTrue(hasEqualItems(node: sut.head, item: firstInsertedItem))
    }
    
    func testLinkedListAppend_givenNewIntegers_expectTailEqualToLastItem() {
        let newItems = [1, 2, 3, 4]
        let lastInsertedItem = LinkedListItem.number(value: newItems[newItems.count-1])
        appendContents(of: newItems, to: &sut)
        XCTAssertTrue(hasEqualItems(node: sut.tail, item: lastInsertedItem))
    }
    
    func testLinkedListNode_givenNewCharacter_expectHeadEqualToItem() {
        let newCharacter = "+"
        let newItem = LinkedListItem.symbol(value: newCharacter)
        sut.append(newCharacter)
        XCTAssertTrue(hasEqualItems(node: sut.head, item: newItem))
    }
    
    func testLinkedListAppend_givenNewIntegers_expectSameElements() {
        let newItems = [1,2,3,4,5,6,7,8,9,10]
        let convertedItems = convertToLinkedListArray(from: newItems)
        appendContents(of: newItems, to: &sut)
        XCTAssertEqual(sut.convertedToLinkedListArray, convertedItems)
    }
    
    func testLinkedListAppend_givenNewOperators_expectSameElements() {
        let newItems = ["+", "-", "*", "/"]
        let convertedItems = convertToLinkedListArray(from: newItems)
        appendContents(of: newItems, to: &sut)
        XCTAssertEqual(sut.convertedToLinkedListArray, convertedItems)
    }
    
    func testLinkedListAppend_givenMixedElements_expectSameElements() {
        let newItems: [Any] = [20, "+", 20, "-", 2]
        let convertedItems: [LinkedListItem] = convertToLinkedListArray(from: newItems)
        appendContents(of: newItems, to: &sut)
        XCTAssertEqual(sut.convertedToLinkedListArray, convertedItems)
    }
    
    func testLinkedListRemove_givenRemovedFront_expectCorrectElement() {
        let newItems: [Any] = [20, "+", 20, "-", 2]
        let firstItem = LinkedListItem.number(value: 20)
        appendContents(of: newItems, to: &sut)
        let removedNode = sut.removeHead()
        XCTAssertTrue(hasEqualItems(node: removedNode, item: firstItem))
    }
    
    func testLinkedListRemove_givenRemovedFront_expectCorrectElements() {
        let newItems: [Any] = [20, "+", 20, "-", 2]
        appendContents(of: newItems, to: &sut)
        let _ = sut.removeHead()
        let exepectedItems: [Any] = ["+", 20, "-", 2]
        let convertedExpectedItems: [LinkedListItem] = convertToLinkedListArray(from: exepectedItems)
        XCTAssertEqual(sut.convertedToLinkedListArray, convertedExpectedItems)
    }
    
    func testLinkedListRemove_givenMultipleRemovedFront_expectIsEmpty() {
        let newItems: [Any] = [20, "+", 20, "-", 2]
        appendContents(of: newItems, to: &sut)
        removeFrontUntilEmpty()
        XCTAssertTrue(sut.isEmpty)
    }
    
    private func hasEqualItems(node: Node<Any>?, item: LinkedListItem) -> Bool {
        guard let node = node else {
            return false
        }
        return node.convertToLinkedListItem == item
    }
    
    private func convertToLinkedListArray(from sequence: [Any]) -> [LinkedListItem] {
        var linkedListItemArray: [LinkedListItem] = []
        for item in sequence {
            if let convertedItem = convertToLinkedListItem(value: item) {
                linkedListItemArray.append(convertedItem)
            }
        }
        return linkedListItemArray
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
    
    private func appendContents(of items: [Any], to linkedList: inout LinkedList<Any>) {
        for item in items {
            linkedList.append(item)
        }
    }
}

extension LinkedList {
    var length: Int {
        var pointer = head
        var count = 0
        while pointer != nil {
            if let node = pointer {
                pointer = node.next
                count += 1
            }
        }
        return count
    }
    
    var convertedToLinkedListArray: [LinkedListItem] {
        var pointer = head
        var listContents: [LinkedListItem] = []
        while pointer != nil {
            if let node = pointer, let value = node.convertToLinkedListItem {
                listContents.append(value)
                pointer = node.next
            }
        }
        return listContents
    }
}

extension Node {
    var convertToLinkedListItem: LinkedListItem? {
        if let number = item as? Int {
            return LinkedListItem.number(value: number)
        }
        if let symbol = item as? String {
            return LinkedListItem.symbol(value: symbol)
        }
        return nil
    }
}
