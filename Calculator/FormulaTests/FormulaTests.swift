//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by jin on 9/21/22.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    
    var sut: Formula!

    override func setUpWithError() throws {
    
        try super.setUpWithError()
        
        let operands = CalculatorItemQueue<Double>()
        operands.enqueue(item: 10)
        operands.enqueue(item: 10)
        operands.enqueue(item: 5)
        
        let operators = CalculatorItemQueue<Operator>()
        operators.enqueue(item: .add)
        operators.enqueue(item: .divide)
        
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_Formula_result_should_be_4() {
        
        let result = sut.result()
        
        XCTAssertEqual(result, 4)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
