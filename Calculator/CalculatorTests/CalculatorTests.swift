//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 박소연 on 2023/01/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Any>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue호출시_isEmpty는_False이다() {
        // given
        let input = 1
        let expectation = false
        
        // when
        sut.enqueue(input)
        
        // then
        XCTAssertFalse(expectation)
        
    }
    
    func test_enqueue호출시_count가증가된다() {
        // given
        let input = 1
        let expectation = 1
        
        // when
        sut.enqueue(input)
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
