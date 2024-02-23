//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by JIWOONG on 2024/02/05.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_input4ToQueue() throws {
        // given
        let expectation = false
        
        // when
        sut.enqueue(element: 4.0)
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue에_성공하는가() throws {
        // given
        let expectation = 4.0
        
        // when
        sut.enqueue(element: 4.0)
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_Queue에서_3을_count하는가() throws {
        // given
        let expectation = 3

        // when
        sut.enqueue(element: 3.0)
        sut.enqueue(element: 4.0)
        sut.enqueue(element: 24.2)
        let result = sut.count

        // then
        XCTAssertEqual(expectation, result)
    }

    func test_Queue가_첫번째요소를_반환하는가() throws {
        // given
        let expectation = 3.0

        // when
        sut.enqueue(element: 3.0)
        sut.enqueue(element: 4.0)
        sut.enqueue(element: 24.2)
        let result = sut.first()

        XCTAssertEqual(expectation, result)
    }
    
    func test_Queue가_없을때_nil을_반환하는가() throws {
        let result = sut.first()
        
        XCTAssertNil(result)
    }

    func test_Queue가_비워지는가() throws {
        // given
        let expectation = true

        // when
        sut.enqueue(element: 3.0)
        sut.enqueue(element: 4.0)
        sut.enqueue(element: 24.2)
        sut.clear()
        let result = sut.isEmpty

        // then
        XCTAssertEqual(expectation, result)
    }

}
