//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        // 코드 구현 예정
        return Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    static func componentsByOperators(from input: String) -> [String] {
        // 코드 구현 예정
        return ["0.0"]
    }
}
