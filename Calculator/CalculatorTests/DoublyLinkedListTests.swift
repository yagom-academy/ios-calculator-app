//
//  DoublyLinkedListTests.swift
//  CalculatorTests
//
//  Created by Jaehun Lee on 2/6/24.
//

import XCTest
@testable import Calculator

extension DoublyLinkedList {
    mutating func fromElements(_ elements: Element...) {
        for element in elements {
            addLast(element: element)
        }
    }
}

final class DoublyLinkedListTests: XCTestCase {
    var sut: DoublyLinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = DoublyLinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_AddElementAsFirstOfTheList() {
        // Given
        let element = 30
        let expectedFirstValue = 30
        
        // When
        sut.addFirst(element: element)
        let resultFirstValue = sut.first
        
        // Then
        XCTAssertEqual(expectedFirstValue, resultFirstValue)
    }
    
    func test_AddElementAsLastOfTheList() {
        // Given
        let element = 30
        let expectedLastValue = 30
        
        // When
        sut.addLast(element: element)
        let resultLastValue = sut.last
        
        // Then
        XCTAssertEqual(expectedLastValue, resultLastValue)
    }
    
    func test_RemoveFirstWhenListIsNotEmpty() {
        // Given
        sut.fromElements(20, 30)
        let expectedRemovedValue = 20
        let expectedFirstValueAfterRemove = 30
        let expectedCount = 1
        
        // When
        let resultRemovedValue = sut.removeFirst()
        let resultFirstValueAfterRemove = sut.first
        let resultCount = sut.count
        
        // Then
        XCTAssertEqual(expectedRemovedValue, resultRemovedValue)
        XCTAssertEqual(expectedFirstValueAfterRemove, resultFirstValueAfterRemove)
        XCTAssertEqual(expectedCount, resultCount)
    }
    
    func test_RemoveFirstWhenListIsEmpty() {
        // When
        let result = sut.removeFirst()
        
        // Then
        XCTAssertNil(result)
    }
    
    func test_RemoveLastWhenListIsNotEmpty() {
        // Given
        sut.fromElements(20, 30)
        let expectedRemovedValue = 30
        let expectedLastValueAfterRemove = 20
        let expectedCount = 1
        
        // When
        let resultRemovedValue = sut.removeLast()
        let resultLastValueAfterRemove = sut.last
        let resultCount = sut.count
        
        // Then
        XCTAssertEqual(expectedRemovedValue, resultRemovedValue)
        XCTAssertEqual(expectedLastValueAfterRemove, resultLastValueAfterRemove)
        XCTAssertEqual(expectedCount, resultCount)
    }
    
    func test_RemoveLastWhenListIsEmpty() {
        // When
        let result = sut.removeLast()
        
        // Then
        XCTAssertNil(result)
    }
}
