//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Hemg on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: NumberItemLinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = NumberItemLinkedList<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
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
    
    func testAppendItem() {
        // Given
        let item = 5
        
        // When
        sut.enqueueItem(item: item)
        let contains = sut.checkContainsItem(item)
        
        // Then
        XCTAssertTrue(contains.contains)
        XCTAssertEqual(contains.value, item)
    }
    
    func test_removeItem() {
        let firstItem = 5
        let secondItem = 6
        
        sut.enqueueItem(item: firstItem)
        sut.enqueueItem(item: secondItem)
        
        sut.dequeue()
        
        let contains = sut.checkContainsItem(firstItem)
       
        XCTAssertEqual(contains.value, firstItem)
        
        XCTAssertEqual(contains.contains, true)
        XCTAssertTrue(contains.contains)
        
        let contain = sut.checkContainsItem(secondItem)
        XCTAssertFalse(contain.contains)
    }
    
}
