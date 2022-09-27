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
    
    func test_enqueue한_요소의_갯수만큼_증가해야함() {
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
        XCTAssertNil(result)
    }
    
    func test_clear할때_배열에있는모든값이삭제되어_isEmpty가True여야함() {
        // Given
        sut.enqueue(element: 1.0)
        sut.enqueue(element: 2.0)
        sut.enqueue(element: 3.0)
        
        // When
        sut.clear()
        let result = sut.isEmpty()
        
        // Then
        XCTAssertTrue(result)
//        XCTAssertFalse(result)
    }
}
