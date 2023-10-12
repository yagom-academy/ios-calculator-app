//
//  ExpressionParser.swift
//  CalculatorTests
//
//  Created by Hisop on 2023/10/12.
//

import Foundation

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_12345를_포함한_문자열을_전달하며_parse를_호출할때_Formula의_operands안에_1_2_3_4_5가_있는지() throws {
        let componentsWithOperatorString = "1 + 2 - 3 / 4*5"
        
        var formula = ExpressionParser.parse(from: componentsWithOperatorString)
        
        XCTAssertEqual(formula.operands.dequeue(), 1)
        XCTAssertEqual(formula.operands.dequeue(), 2)
        XCTAssertEqual(formula.operands.dequeue(), 3)
        XCTAssertEqual(formula.operands.dequeue(), 4)
        XCTAssertEqual(formula.operands.dequeue(), 5)
    }
    
    func test_Operator를_포함한_문자열을_전달하며_parse를_호출할때_Formula의_operators안에_정상적으로_들어갔는지() throws {
        let componentsWithOperatorString = "1 + 2 - 3 / 4*5"
        
        var formula = ExpressionParser.parse(from: componentsWithOperatorString)
        
        XCTAssertEqual(formula.operators.dequeue(), Operator.add)
        XCTAssertEqual(formula.operators.dequeue(), Operator.subtract)
        XCTAssertEqual(formula.operators.dequeue(), Operator.divide)
        XCTAssertEqual(formula.operators.dequeue(), Operator.multiply)
    }
}
