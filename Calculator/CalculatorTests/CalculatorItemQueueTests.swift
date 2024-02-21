//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by H on 2/20/24.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_빈배열에pop하면nil인지() {
        // given
        
        // when
        let result = sut?.pop()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_빈배열에front하면nil인지() {
        // given
        
        // when
        let result = sut?.front()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_빈배열에rear하면nil인지() {
        // given
        
        // when
        let result = sut?.rear()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_빈배열에isEmpty하면true인지() {
        // given
        
        // when
        let result = sut?.isEmpty
        let expectation = true
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈배열에size하면0인지() {
        // given
        
        // when
        let result = sut?.size
        let expectation = 0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_push했을때size제대로반영되는지() {
        // given
        sut?.push(0)
        sut?.push(1)
        sut?.push(2)
        sut?.push(3)
        sut?.push(4)

        // when
        let result = sut?.size
        let expectation = 5
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_push했을때isEmpty하면false인지() {
        // given
        sut?.push(0)
        sut?.push(1)
        sut?.push(2)
        sut?.push(3)
        sut?.push(4)
        
        // when
        let result = sut?.isEmpty
        let expectation = false
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_push했을때front정확히리턴하는지() {
        // given
        sut?.push(0)
        sut?.push(1)
        sut?.push(2)
        sut?.push(3)
        sut?.push(4)
        
        // when
        let result = sut?.front()
        let expectation = 0.0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_push했을때rear정확히리턴하는지() {
        // given
        sut?.push(0)
        sut?.push(1)
        sut?.push(2)
        sut?.push(3)
        sut?.push(4)
        
        // when
        let result = sut?.rear()
        let expectation = 4.0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_pop했을때size제대로반영되는지() {
        // given
        sut?.push(0)
        sut?.push(1)
        sut?.push(2)
        sut?.push(3)
        sut?.push(4)
        sut?.pop()
        sut?.pop()
        
        // when
        let result = sut?.size
        let expectation = 3
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_pop했을때맨앞요소를정확히리턴하는지() {
        // given
        sut?.push(0)
        sut?.push(1)
        sut?.push(2)
        sut?.push(3)
        sut?.push(4)
        
        // when
        let result = sut?.pop()
        let expectation = 0.0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_pop했을때front정확히리턴하는지() {
        // given
        sut?.push(0)
        sut?.push(1)
        sut?.push(2)
        sut?.push(3)
        sut?.push(4)
        sut?.pop()
        sut?.pop()
        
        // when
        let result = sut?.front()
        let expectation = 2.0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_pop했을때rear정확히리턴하는지() {
        // given
        sut?.push(0)
        sut?.push(1)
        sut?.push(2)
        sut?.push(3)
        sut?.push(4)
        sut?.pop()
        sut?.pop()
        
        // when
        let result = sut?.rear()
        let expectation = 4.0
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
