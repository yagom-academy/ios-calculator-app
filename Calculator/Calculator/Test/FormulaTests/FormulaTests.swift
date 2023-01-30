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

    func test_result를_실행하면_피연산자와_연산자의_계산이_순차적으로_이루어진다() {
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

    func test_result를_실행하때_피연산자의갯수가_연산자보다_2개이상이_많으면_nil을_반환한다() {
        //give
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        operands.enqueue(5)
        operands.enqueue(10)
        operands.enqueue(15)
        operands.enqueue(20)
        operands.enqueue(30)
        
        operators.enqueue(.multiply)
        operators.enqueue(.subtract)
        operators.enqueue(.add)
        
        var formula = Formula(operands: operands, operators: operators)
        //when
        let result = formula.result()
        let expectation: Double? = nil
        //then
        XCTAssertEqual(result, expectation)
    }
}
