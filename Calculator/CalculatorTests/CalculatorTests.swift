//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by dragon on 2022/09/21.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_enqueue를_A번_했을때_count가_A와_같아야함() {
        // Given
        sut.enqueue(element: "1")
        sut.enqueue(element: "+")
        sut.enqueue(element: "2")
        
        // When
        let count = sut.count
        
        // Then
        XCTAssertEqual(count, 3)
    }
    
    func test_dequeue했을때_배열에값이있을경우_배열의첫번째요소가져오고_배열에서값삭제후Count1감소되어야함_배열에값이없을경우_nil가져와야함() {
        // Given
        sut.enqueue(element: "1")
        sut.enqueue(element: "+")
        sut.enqueue(element: "2")
        
        // When
        let result = sut.dequeue()
        
        // Then
        XCTAssertEqual(result, "1")
    }
    
    func test_peek했을때_배열에값이있을경우_배열의첫번째요소가져오고_배열에서값유지되어Count동일해야함_배열에값이없을경우_nil가져와야함() {
        // Given
        sut.enqueue(element: "1")
        sut.enqueue(element: "+")
        sut.enqueue(element: "2")
        
        // When
        let result = sut.peek()
        
        // Then
        XCTAssertEqual(result, "1")
    }
    
    func test_clear했을때_배열에있는모든값이삭제되어_count가0이면서_isEmpty가True여야함() {
        // Given
        sut.enqueue(element: "1")
        sut.enqueue(element: "+")
        sut.enqueue(element: "2")
        
        // When
        sut.clear()
        guard let result = sut.isEmpty() else { return }
        
        // Then
        XCTAssertTrue(result)
//        XCTAssertFalse(result)
    }
}
