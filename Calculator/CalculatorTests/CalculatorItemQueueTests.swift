//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by dragon on 2022/09/21.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_enqueue를_A번_할때_count가_A와_같아야함() {
        // Given
        sut.enqueue(element: 1.0)
        sut.enqueue(element: 2.0)
        sut.enqueue(element: 3.0)
        
        // When
        let count = sut.count
        
        // Then
        XCTAssertEqual(count, 3)
    }
    
    func test_dequeue할때_배열에값이있을경우_배열의첫번째요소가져와야함() {
        // Given
        sut.enqueue(element: 1.0)
        sut.enqueue(element: 2.0)
        sut.enqueue(element: 3.0)
        
        // When
        let result = sut.dequeue()
        
        // Then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_dequeue할때_배열에값이없을경우_nil가져와야함() {
        // Given
        
        // When
        let result = sut.dequeue()
        
        // Then
        XCTAssertEqual(result, nil)
    }
    
    func test_peek할때_배열에값이있을경우_배열의첫번째요소가져와야함() {
        // Given
        sut.enqueue(element: 1.0)
        sut.enqueue(element: 2.0)
        sut.enqueue(element: 3.0)
        
        // When
        let result = sut.peek()
        
        // Then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_peek할때_배열에값이없을경우_nil가져와야함() {
        // Given
        
        // When
        let result = sut.peek()
        
        // Then
        XCTAssertEqual(result, nil)
    }
    
    func test_clear할때_배열에있는모든값이삭제되어_isEmpty가True여야함() {
        // Given
        sut.enqueue(element: 1.0)
        sut.enqueue(element: 2.0)
        sut.enqueue(element: 3.0)
        
        // When
        sut.clear()
        guard let result = sut.isEmpty() else { return }
        
        // Then
        XCTAssertTrue(result)
//        XCTAssertFalse(result)
    }
}
