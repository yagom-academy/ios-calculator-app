//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hmeg on 2023/06/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        let components = componentsByOperators(from: input)
        
        components.compactMap { Double($0) }.forEach { operandQueue.enqueue(item: $0)}
        
        let operatorComponents = components.filter { Double($0) == nil }
        operatorComponents.compactMap { Operator(rawValue: Character($0))}
            .forEach{(operatorQueue.enqueue(item:$0))}
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { String($0.rawValue) }
        var components = [input]
        
        operators.forEach { operatorString in
            components = components.flatMap { component in
                let splitComponents = component.split(with: Character(operatorString))
                return splitComponents.map { String($0) }
            }
            
            
            (0..<components.count-1).forEach { _ in
                components.append(operatorString)
            }
        }
        
        return components
    }
}
