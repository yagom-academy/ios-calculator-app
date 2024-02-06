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
    var dll: DoublyLinkedList<Any>!
    
    override func setUpWithError() throws {
        dll = DoublyLinkedList()
    }

    override func tearDownWithError() throws {
        dll = nil
    }
    
    func test_AddFirst() {
        // Arrange
        let element = 30
        let expectedFirstValue = 30
        
        // Act
        dll.addFirst(element: element)
        let resultFirstValue = dll.first as? Int
        
        // Assert
        XCTAssertEqual(expectedFirstValue, resultFirstValue)
    }
    
    func test_AddLast() {
        // Arrange
        let element = 30
        let expectedLastValue = 30
        
        // Act
        dll.addLast(element: element)
        let resultLastValue = dll.last as? Int
        
        // Assert
        XCTAssertEqual(expectedLastValue, resultLastValue)
    }
    
    func test_RemoveFirstWhenListIsNotEmpty() {
        // Arrange
        dll.fromElements(20, 30)
        let expectedFirstValue = 20
        let expectedFirstValueAfterRemove = 30
        let expectedCount = 1
        
        // Act
        let resultFirstValue = dll.removeFirst() as? Int
        let resultFirstValueAfterRemove = dll.first as? Int
        let resultCount = dll.count
        
        // Assert
        XCTAssertEqual(expectedFirstValue, resultFirstValue)
        XCTAssertEqual(expectedFirstValueAfterRemove, resultFirstValueAfterRemove)
        XCTAssertEqual(expectedCount, resultCount)
    }
    
    func test_RemoveFirstWhenListIsEmpty() {
        // Act
        let result = dll.removeFirst()
        
        // Assert
        XCTAssertNil(result)
    }
    
    func test_RemoveLastWhenListIsNotEmpty() {
        // Arrange
        dll.fromElements(20, 30)
        let expectedLastValue = 30
        let expectedLastValueAfterRemove = 20
        let expectedCount = 1
        
        // Act
        let resultLastValue = dll.removeLast() as? Int
        let resultLastValueAfterRemove = dll.last as? Int
        let resultCount = dll.count
        
        // Assert
        XCTAssertEqual(expectedLastValue, resultLastValue)
        XCTAssertEqual(expectedLastValueAfterRemove, resultLastValueAfterRemove)
        XCTAssertEqual(expectedCount, resultCount)
    }
    
    func test_RemoveLastWhenListIsEmpty() {
        // Act
        let result = dll.removeLast()
        
        // Assert
        XCTAssertNil(result)
    }
}
