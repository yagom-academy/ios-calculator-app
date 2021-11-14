//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/14.
//

import XCTest
@testable import Calculator
class ExpressionParserTests: XCTestCase {
    
    func testExpressionParserParse_givenMixedExpression_expectCorrectFormula() {
        let testOperands: [Double] = [10, 23, 4]
        let testOperators: [Operator] = [.add, .divide]
        let mockFormula = createMockFormula(operands: testOperands, operators: testOperators)
        XCTAssertTrue(isSameFormula(formula: ExpressionParser.parse(from: "10+23/4"), otherFormula: mockFormula))
    }
    
}
