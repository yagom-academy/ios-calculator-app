//
//  ExpressionParserTests.swift
//  Created by Wonbi
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_parse메서드에1더하기2곱하기3을넣었을때_연산자와피연산자가제대로파싱되는지() {
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
    
    func test_parse메서드에랜덤한피연산자와연산자를넣었을때_파싱이정상적으로이루어지는지() {
        // given
        let routine = Int.random(in: 2...50)
        let operators = ["+", "-", "÷", "×"]
        var inputOperands = [Double]()
        var inputOperators = [Operator]()
        var input: String = ""
        
        for _ in 1...routine {
            inputOperands.append(Double.random(in: -100.0...100.0))
        }
        input = String(inputOperands[0])
        
        for _ in 1..<routine {
            inputOperators.append(Operator(rawValue: Character(operators[Int.random(in: 0...3)])) ?? Operator.add)
        }
        
        for index in 1..<routine {
            input.append(" \(String(inputOperators[index - 1].identifier))")
            input.append(" \(String(inputOperands[index]))")
        }
        
        // when
        let result = ExpressionParser.parse(from: input)
        guard let resultOperands = result.operands.statusQueue as? [Double],
              let resultOperators = result.operators.statusQueue as? [Operator]
        else {
            return
        }
        
        // then
        XCTAssertEqual(inputOperands, resultOperands)
        XCTAssertEqual(inputOperators, resultOperators)
    }
}
