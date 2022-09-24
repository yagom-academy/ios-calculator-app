//
//  ExpressionParserTests.swift
//  Created by Wonbi
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_componentsByOperators메서드에1더하기2곱하기3을넣었을때_1과2와3이나오는지() {
        let input = "1 + 2 × 3"
        
        let result = ExpressionParser.parse(from: input)
        guard let resultOperands = result.operands.statusQueue as? [Double],
              let resultOperators = result.operators.statusQueue as? [Operator]
        else {
            return
        }
        let expectedOperands: [Double] = [1.0, 2.0, 3.0]
        let expectedOperators: [Operator] = [Operator.add, Operator.multiply]
        
        XCTAssertEqual(expectedOperands, resultOperands)
        XCTAssertEqual(expectedOperators, resultOperators)
    }
}
