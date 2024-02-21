//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Prism, Hamzzi on 2/13/24.
//

import Foundation

protocol Parsable {
    associatedtype Input
    associatedtype Output
    static func parse(from input: Input) -> Output
}

enum ExpressionParser: Parsable {
    typealias Input = String
    typealias Output = Formula

    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()

        let components = componentsByOperators(from: input)

        components.forEach { component in
            if let value = Double(component) {
                operands.enqueue(value)
            }
        }

        input.forEach { char in
            if let operatorValue = Operator(rawValue: char) {
                operators.enqueue(operatorValue)
            }
        }

        return Formula(operands: operands, operators: operators)
    }

    static func componentsByOperators(from input: String) -> [String] {
        let inputThatOperatorTransposedWithBlank = input
            .map { Operator(rawValue: $0) != nil ? " " : String($0) }
            .joined()

        return inputThatOperatorTransposedWithBlank.split(with: " ")
    }
}

fileprivate extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}

