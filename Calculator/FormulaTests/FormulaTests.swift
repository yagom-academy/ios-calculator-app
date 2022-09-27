//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Mangdi on 2022/09/23.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
        let calculateItemQueueDouble = CalculatorItemQueue<Double>()
        let calculateItemQueueOperator = CalculatorItemQueue<Operator>()
        sut?.operands = calculateItemQueueDouble
        sut?.operators = calculateItemQueueOperator
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result_호출할때_연산자가없을땨_0이반환되는지() {
        let result = sut?.result()
        
        XCTAssertEqual(0, result)
    }
    
    func test_result_호출할때_피연산자가0일경우_NaN가반환되는가() {
        sut?.operands?.enqueue(10)
        sut?.operators?.enqueue(.divide)
        sut?.operands?.enqueue(0)
        
        let result = sut?.result()
        
        XCTAssertEqual(Double.infinity, result)
    }
    
    func test_result_호출할때_연산자가1개일때_값이잘반환되는가() {
        sut?.operands?.enqueue(20)
        sut?.operators?.enqueue(.add)
        sut?.operands?.enqueue(30)
        
        let result = sut?.result()
        
        XCTAssertEqual(50, result)
    }
    
    func test_result_호출할때_연산자가2개일때_값이잘반환되는가() {
        sut?.operands?.enqueue(20)
        sut?.operators?.enqueue(.multiply)
        sut?.operands?.enqueue(30)
        sut?.operators?.enqueue(.subtract)
        sut?.operands?.enqueue(500)
        
        let result = sut?.result()
        
        XCTAssertEqual(100, result)
    }
    
    func test_result_호출할때_연산자가3개일때_값이잘반환되는가() {
        sut?.operands?.enqueue(20)
        sut?.operators?.enqueue(.multiply)
        sut?.operands?.enqueue(30)
        sut?.operators?.enqueue(.subtract)
        sut?.operands?.enqueue(500)
        sut?.operators?.enqueue(.divide)
        sut?.operands?.enqueue(10)
        
        let result = sut?.result()
        
        XCTAssertEqual(10, result)
    }
}
