//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Ari on 2021/11/11.
//

import XCTest

extension String {
    func split(with target: Character) -> [String] {
        var result = [String]()
        var number = ""
        self.forEach{ element in
            let isOperator: Bool = element.isNumber == false && element != "."
            if isOperator {
                result.append(String(number))
                result.append(String(element))
                number = ""
            } else {
                number += String(element)
            }
        }
        result.append(String(number))
        return result
    }
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = componentsByOperators(from: input)
                        .map { Double($0)! }
        let operators = input.map{ $0 }
                        .filter{ Operator(rawValue: $0) != nil }
                        .map{ Operator(rawValue: $0)! }
        return Formula(operands: CalculatorItemQueue(operands),
                       operators: CalculatorItemQueue(operators))
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let sliceInput = input.split(with: "+")
        let operands = sliceInput.filter { Double($0.description) != nil }
        return operands
    }
}

class ExpressionParserTests: XCTestCase {

    func test_연산자와숫자가_한개씩() {
        let input = ExpressionParser.parse(from: "12+!@#")

        XCTAssertTrue(input.operands.count == 1)
        XCTAssertTrue(input.operators.count == 1)
    }
}
