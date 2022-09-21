//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by dragon on 2022/09/21.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Any>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue개수와_count개수가_동일한지_확인() {
        // Given
        sut.enqueue(element: 1)
        sut.enqueue(element: "+")
        sut.enqueue(element: 2)
        
        // When
        let count = sut.count
        
        // Then
        XCTAssertEqual(count, 3)
    }
}
