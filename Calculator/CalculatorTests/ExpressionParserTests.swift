//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by junho lee on 2022/09/23.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {

    func test_parse에_문자열11더하기2곱하기3을전달했을때_operands에11과2와3을_operators에더하기와곱하기를담은_Formula를반환하는가(){
        // given
        let input: String = "11+2×3"
        
        // when
        var result: Formula = ExpressionParser.parse(from: input)
        var resultOpernads: Array<Double> = []
        while !result.operands.isEmpty {
            resultOpernads.append(result.operands.dequeue()!)
        }
        var resultOperators: Array<Operator> = []
        while !result.operators.isEmpty {
            resultOperators.append(result.operators.dequeue()!)
        }
        
        // then
        let expectedOperands: Array<Double> = [11, 2, 3]
        let expectedOperators: Array<Operator> = [.add, .multiply]
        
        XCTAssertTrue(resultOpernads == expectedOperands && resultOperators == expectedOperators)
    }
    
    func test_parse에_문자열12빼기마이너스1더하기마이너스3을전달했을때_operands에12와마이너스1와마이너스3을_operators에빼기와더하기를담은_Formula를반환하는가() {
        // given
        let input: String = "12--1+-3"
        
        // when
        var result: Formula = ExpressionParser.parse(from: input)
        var resultOpernads: Array<Double> = []
        while !result.operands.isEmpty {
            resultOpernads.append(result.operands.dequeue()!)
        }
        var resultOperators: Array<Operator> = []
        while !result.operators.isEmpty {
            resultOperators.append(result.operators.dequeue()!)
        }
        
        // then
        let expectedOperands: Array<Double> = [12, -1, -3]
        let expectedOperators: Array<Operator> = [.subtract, .add]
        
        XCTAssertTrue(resultOpernads == expectedOperands && resultOperators == expectedOperators)
    }
}
