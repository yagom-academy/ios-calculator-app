//
//  ExpressionParserTDD.swift
//  CalculatorTests
//
//  Created by LeeChiheon on 2022/05/20.
//

import XCTest

class ExpressionParserTDD: XCTestCase {
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_스트링을받아서_Formula타입으로_반환() throws {
        // given
        let inputExpression: String = "  -4 +  4 ×  5 ÷ -10  "
        let expectationOperands: [Double] = [-4.0, 4.0, 5.0, -10.0]
        let expectationOperators: [Operator] = [.add, .multiply, .divide]
        
        // what
        let resultFormula = ExpressionParser.parse(from: inputExpression)
        
        // then
        for (formulaOperand, expectationOperand) in zip(resultFormula.operands, expectationOperands) {
            XCTAssertEqual(formulaOperand, expectationOperand)
        }
        
        // then
        for (formulaOperator, expectationOperator) in zip(resultFormula.operators, expectationOperators) {
            XCTAssertEqual(formulaOperator, expectationOperator)
        }
    }
}
