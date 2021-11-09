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
        let firstInsertedItem = newItems[0]
        appendContents(of: newItems, to: &sut)
        XCTAssertTrue(hasEqualItems(node: sut.head, item: firstInsertedItem))
    }
    
    func testLinkedListAppend_givenNewIntegers_expectTailEqualToLastItem() {
        let newItems = [1, 2, 3, 4]
        let lastInsertedItem = newItems[newItems.count-1]
        appendContents(of: newItems, to: &sut)
        XCTAssertTrue(hasEqualItems(node: sut.tail, item: lastInsertedItem))
    }
    
    func testLinkedListAppend_givenNewIntegers_expectSameElements() {
        let newItems = [1,2,3,4,5,6,7,8,9,10]
        appendContents(of: newItems, to: &sut)
        XCTAssertEqual(sut.convertedToIntArray, newItems)
    }
    
    func testLinkedListAppend_givenNewOperators_expectSameElements() {
        let newItems: [Character] = ["+", "-", "/", "*"]
        appendContents(of: newItems, to: &sut)
        XCTAssertEqual(sut.convertedToCharacterArray, newItems)
    }
    
    private func hasEqualItems(node: Node<Any>?, item: Int) -> Bool {
        guard let node = node else {
            return false
        }
        return node.item as? Int == item
    }
    
    private func appendContents(of items: [Any], to linkedList: inout LinkedList<Any>) {
        for item in items {
            linkedList.append(item)
        }
    }
}

extension LinkedList {
    var convertedToIntArray: [Int] {
        var pointer = head
        var listContents: [Int] = []
        while pointer != nil {
            if let node = pointer, let value = node.item as? Int {
                listContents.append(value)
                pointer = node.next
            }
        }
        return listContents
    }
    
    var convertedToCharacterArray: [Character] {
        var pointer = head
        var listContents: [Character] = []
        while pointer != nil {
            if let node = pointer, let value = node.item as? Character {
                listContents.append(value)
                pointer = node.next
            }
        }
        return listContents
    }
}
