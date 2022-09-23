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
    
    func test_enqueue와_count가_정상적으로_동작하는지_확인() {
        // Given
        sut.enqueue(element: "1")
        sut.enqueue(element: "+")
        sut.enqueue(element: "2")
        
        // When
        let count = sut.count
        
        // Then
        XCTAssertEqual(count, 3)
    }
    
    func test_queue에서_dequeue가_정상적으로_동작하는지_확인() {
        // Given
        sut.enqueue(element: "1")
        sut.enqueue(element: "+")
        sut.enqueue(element: "2")
        
        // When
        let result = sut.dequeue()
        
        // Then
        XCTAssertEqual(result, "1")
    }
    
    func test_queue에서_peek가_정상적으로_동작하는지_확인() {
        // Given
        sut.enqueue(element: "1")
        sut.enqueue(element: "+")
        sut.enqueue(element: "2")
        
        // When
        let result = sut.peek()
        
        // Then
        XCTAssertEqual(result, "1")
    }
    
    func test_queue에서_clear와_isEmpty가_정상적으로_동작하는지_확인() {
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
