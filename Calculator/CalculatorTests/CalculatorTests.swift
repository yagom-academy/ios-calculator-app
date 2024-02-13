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
        calculatorSlut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        calculatorSlut = nil
    }
    
    func test_빈배열에pop() throws {
        XCTAssertNil(calculatorSlut?.pop())
    }
    
    func test_빈배열에front() throws {
        
    }
}
