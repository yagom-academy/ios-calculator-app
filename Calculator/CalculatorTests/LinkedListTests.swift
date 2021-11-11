//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/09.
//

import XCTest
@testable import Calculator

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
    
    func testLinkedListAppend_givenNewNode_expectNotEmpty() {
        let newItem = 10
        sut.append(newItem)
        XCTAssertTrue(sut.isNotEmpty)
    }
    
    func testLinkedListAppend_givenNewIntegers_expectHeadEqualToFirstInsertedItem() {
        let newItems = [1, 2]
        appendContents(of: newItems, to: &sut)
        let firstInsertedItem = DummyItem.number(value: newItems[0])
        XCTAssertTrue(hasEqualItems(node: sut.first, item: firstInsertedItem))
    }
    
    func testLinkedListAppend_givenNewIntegers_expectTailEqualToLastInsertedItem() {
        let newItems = [1, 2, 3, 4]
        appendContents(of: newItems, to: &sut)
        let lastInsertedItem = DummyItem.number(value: newItems[newItems.count-1])
        XCTAssertTrue(hasEqualItems(node: sut.last, item: lastInsertedItem))
    }

    func testLinkedListNode_givenNewOperator_expectHeadEqualToInsertedItem() {
        let newCharacter = "+"
        sut.append(newCharacter)
        let newInsertedItem = DummyItem.symbol(value: newCharacter)
        XCTAssertTrue(hasEqualItems(node: sut.first, item: newInsertedItem))
    }
    
    func testLinkedListAppend_givenNewIntegers_expectCorrectSequence() {
        let newItems = [1,2,3,4,5,6,7,8,9,10]
        appendContents(of: newItems, to: &sut)
        let convertedNewItems = convertToLinkedListArray(from: newItems)
        XCTAssertEqual(sut.convertedToLinkedListItemArray, convertedNewItems)
    }
    
    func testLinkedListAppend_givenNewOperators_expectCorrectSequence() {
        let newItems = ["+", "-", "*", "/"]
        appendContents(of: newItems, to: &sut)
        let convertedNewItems = convertToLinkedListArray(from: newItems)
        XCTAssertEqual(sut.convertedToLinkedListItemArray, convertedNewItems)
    }
    
    func testLinkedListAppend_givenMixedElements_expectCorrectSequence() {
        let newItems: [Any] = [20, "+", 30, "-", 2]
        appendContents(of: newItems, to: &sut)
        let convertedNewItems = convertToLinkedListArray(from: newItems) as [DummyItem]
        XCTAssertEqual(sut.convertedToLinkedListItemArray, convertedNewItems)
    }
    
    func testLinkedListRemoveHead_givenRemovedHeadFromMixedElements_expectRemovedHeadEqualsFirstInsertedItem() {
        let newItems: [Any] = [20, "+", 30, "-", 2]
        appendContents(of: newItems, to: &sut)
        let removedValue = sut.retrieveHeadValue()
        let firstInsertedItem = DummyItem.number(value: 20)
        XCTAssertEqual(convertToLinkedListItem(value: removedValue as Any), firstInsertedItem)
    }
    
    func testLinkedListRemoveAll_givenRemoveAllFromElements_expectIsEmpty() {
        let newItems: [Any] = [20, "+", 30, "-", 2]
        appendContents(of: newItems, to: &sut)
        sut.removeAll()
        XCTAssertTrue(sut.isEmpty)
    }
    
    private func hasEqualItems(node: Node<Any>?, item: DummyItem) -> Bool {
        guard let node = node else {
            return false
        }
        return node.convertToLinkedListItem == item
    }
    
    private func convertToLinkedListArray(from sequence: [Any]) -> [DummyItem] {
        var linkedListItemArray: [DummyItem] = []
        for item in sequence {
            if let convertedItem = convertToLinkedListItem(value: item) {
                linkedListItemArray.append(convertedItem)
            }
        }
        return linkedListItemArray
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
    
    private func appendContents(of items: [Any], to linkedList: inout LinkedList<Any>) {
        for item in items {
            linkedList.append(item)
        }
    }
}

fileprivate extension LinkedList {
    var convertedToLinkedListItemArray: [DummyItem] {
        var pointer = first
        var listContents: [DummyItem] = []

        while pointer != nil {
            if let node = pointer, let value = node.convertToLinkedListItem {
                listContents.append(value)
                pointer = node.next
            }
        }
        return listContents
    }
}

fileprivate extension Node {
    var convertToLinkedListItem: DummyItem? {
        if let number = item as? Int {
            return DummyItem.number(value: number)
        }
        if let symbol = item as? String {
            return DummyItem.symbol(value: symbol)
        }
        return nil
    }
}
