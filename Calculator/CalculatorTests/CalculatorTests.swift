//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by SummerCat on 2022/09/20.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    struct Item: CalculateItem, Equatable {
        var data: String
    }
    
    var sut: CalculatorItemQueue<Item>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_inputStack에_들어갔는지() {
        // given
        let item: Item = Item(data: "item data")
        let expected: [Item] = [item]
        
        // when
        sut.enqueue(item: item)
        
        // then
        XCTAssertEqual(sut.inputStack, expected)
    }
    
    func test_dequeue_빈배열에서디큐_nil반환하는지() {
        // given
        let expected: Item? = nil
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expected)
    }
    
    func test_dequeue_원소가2개이상일때_1개디큐() {
        // given
        let firstItem: Item = Item(data: "first item")
        let secondItem: Item = Item(data: "second item")
        let expectedDequeuedItem = firstItem
        let expectedOutputStack: [Item] = [secondItem]
        let expectedInputStack: [Item] = []
        
        // when
        sut.enqueue(item: firstItem)
        sut.enqueue(item: secondItem)
        let dequeued = sut.dequeue()
        
        // then
        XCTAssertEqual(dequeued, expectedDequeuedItem)
        XCTAssertEqual(expectedOutputStack, sut.outputStack)
        XCTAssertEqual(expectedInputStack, expectedInputStack)
    }
}


