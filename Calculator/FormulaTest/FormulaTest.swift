//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by Lee minyeol on 2023/10/11.
//

import XCTest
@testable import Calculator

final class FormulaTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func test_2더하기3이_들어있을때_result실행시_결과는5가된다() {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        //given
        operands.enqueue(2.0)
        operands.enqueue(3.0)
        operators.enqueue(.add)
        
        let expectation = 5.0
        //when
        var formula = Formula(operands: operands, operators: operators)
        let result = formula.result()
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_2곱하기3과4가_들어있을때_result실행시_결과는6이된다() {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        //given
        operands.enqueue(2.0)
        operands.enqueue(3.0)
        operands.enqueue(4.0)
        operators.enqueue(.multiply)
        
        
        let expectation = 6.0
        //when
        var formula = Formula(operands: operands, operators: operators)
        let result = formula.result()
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_2빼기3곱하기4가_들어있을때_result실행시_결과는마이너스4가된다() {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        //given
        operands.enqueue(2.0)
        operands.enqueue(3.0)
        operands.enqueue(4.0)
        operators.enqueue(.substract)
        operators.enqueue(.multiply)
        
        
        let expectation = -4.0
        //when
        var formula = Formula(operands: operands, operators: operators)
        let result = formula.result()
        //then
        XCTAssertEqual(result, expectation)
    }

}
