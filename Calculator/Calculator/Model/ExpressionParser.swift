////
////  ExpressionParser.swift
////  Calculator
//
//
//import Foundation
//
//enum ExpressionParser {
//    static func parse(from input: String) -> Formula {
//        let operators = input.filter {
//            "0123456789".contains($0) == false }.compactMap {
//                Operator(rawValue: $0) }
//        
//        let operands = componentsByOperators(from: input).compactMap {
//            Double($0)
//        }
//        
//        return Formula(operands: CalculatorItemQueue(operands),
//                       operators: CalculatorItemQueue(operators))
//    }
//    
//    private static func componentsByOperators(from input: String) -> [String] {
//        var result: [String]
//        
//        result = input.split(with: " ")
//        Operator.allCases.forEach { operators in
//            result = result.flatMap {
//                $0.split(with: Character(operators.description))}
//        }
//        return result
//    }
//}
