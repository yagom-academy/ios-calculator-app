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
    
    func test_빈배열에pop하면nil인지() {
        XCTAssertNil(calculatorSlut?.pop())
    }
    
    func test_빈배열에front하면nil인지() {
        XCTAssertNil(calculatorSlut?.front())
    }
    
    func test_빈배열에rear하면nil인지() {
        XCTAssertNil(calculatorSlut?.rear())
    }
    
    func test_빈배열에isEmpty하면true인지() {
        XCTAssertEqual(calculatorSlut?.isEmpty, true)
    }
    
    func test_빈배열에size하면0인지() {
        XCTAssertEqual(calculatorSlut?.size, 0)
    }
    
    func test_push했을때size제대로반영되는지() {
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        
        XCTAssertEqual(calculatorSlut?.size, 5)
    }
    
    func test_push했을때isEmpty하면false인지() {
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        
        XCTAssertEqual(calculatorSlut?.isEmpty, false)
    }
    
    func test_push했을때front정확히리턴하는지() {
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        
        XCTAssertEqual(calculatorSlut?.front(), 0)
    }
    
    func test_push했을때rear정확히리턴하는지() {
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        
        XCTAssertEqual(calculatorSlut?.rear(), 4)
    }
    
    func test_pop했을때size제대로반영되는지() {
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        calculatorSlut?.pop()
        calculatorSlut?.pop()
        
        XCTAssertEqual(calculatorSlut?.size, 3)
    }
    
    func test_pop했을때맨앞요소를정확히리턴하는지() {
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        
        XCTAssertEqual(calculatorSlut?.pop(), 0)
    }
    
    func test_pop했을때front정확히리턴하는지() {
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        calculatorSlut?.pop()
        calculatorSlut?.pop()
        
        XCTAssertEqual(calculatorSlut?.front(), 2)
    }
    
    func test_pop했을때rear정확히리턴하는지() {
        calculatorSlut?.push(0)
        calculatorSlut?.push(1)
        calculatorSlut?.push(2)
        calculatorSlut?.push(3)
        calculatorSlut?.push(4)
        calculatorSlut?.pop()
        calculatorSlut?.pop()
        
        XCTAssertEqual(calculatorSlut?.rear(), 4)
    }
}
