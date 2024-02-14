//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by H on 2/12/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var calculatorSlut: CalculatorItemQueue?

    override func setUpWithError() throws {
        try super.setUpWithError()
        calculatorSlut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        calculatorSlut = nil
    }
    
    func test_빈배열에pop하면nil인지() {
        // given
        
        // when
        let result = calculatorSlut?.pop()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_빈배열에front하면nil인지() {
        // given
        
        // when
        let result = calculatorSlut?.front()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_빈배열에rear하면nil인지() {
        // given
        
        // when
        let result = calculatorSlut?.rear()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_빈배열에isEmpty하면true인지() {
        // given
        
        // when
        let result = calculatorSlut?.isEmpty
        let expectation = true
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈배열에size하면0인지() {
        // given
        
        // when
        let result = calculatorSlut?.size
        let expectation = 0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_push했을때size제대로반영되는지() {
        // given
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)

        // when
        let result = calculatorSlut?.size // 결과
        let expectation = 5 // 목표
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_push했을때isEmpty하면false인지() {
        // given
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        
        // when
        let result = calculatorSlut?.isEmpty
        let expectation = false
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_push했을때front정확히리턴하는지() {
        // given
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        
        // when
        let result = calculatorSlut?.front()
        let expectation = 0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_push했을때rear정확히리턴하는지() {
        // given
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        
        // when
        let result = calculatorSlut?.rear()
        let expectation = 4
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_pop했을때size제대로반영되는지() {
        // given
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        calculatorSlut?.pop()
        calculatorSlut?.pop()
        
        // when
        let result = calculatorSlut?.size
        let expectation = 3
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_pop했을때맨앞요소를정확히리턴하는지() {
        // given
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        
        // when
        let result = calculatorSlut?.pop()
        let expectation = 0
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_pop했을때front정확히리턴하는지() {
        // given
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        calculatorSlut?.pop()
        calculatorSlut?.pop()
        
        // when
        let result = calculatorSlut?.front()
        let expectation = 2
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_pop했을때rear정확히리턴하는지() {
        // given
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        calculatorSlut?.pop()
        calculatorSlut?.pop()
        
        // when
        let result = calculatorSlut?.rear()
        let expectation = 4
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
