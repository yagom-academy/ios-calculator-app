//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 김성준 on 2023/01/28.
//

import XCTest

final class FormulaTests: XCTestCase {
    
    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {

    }

    func test_() {
        //give
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        operands.enqueue(5)
        operands.enqueue(10)
        operands.enqueue(15)
        operands.enqueue(20)
        
        operators.enqueue(.multiply)
        operators.enqueue(.subtract)
        operators.enqueue(.add)
        
        var formula = Formula(operands: operands, operators: operators)
        //when
        let result = formula.result()
        let expectation: Double = 5*10-15+20
        //then
        XCTAssertEqual(result, expectation)
    }

}
