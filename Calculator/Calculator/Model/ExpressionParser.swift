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
        
        components.forEach { component in
            if let number = Double(component) {
                operandQueue.enqueue(item: number)
            } else if let currentOperator = Operator(rawValue: Character(component)) {
                operatorQueue.enqueue(item: currentOperator)
            }
        }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { String($0.rawValue)}.joined()
        var components = [input]
        
        operators.forEach { `operator` in
            var newComponents: [String] = []
            
            components.forEach { component in
                newComponents += component.split(with: `operator`).map {String($0)}
            }
            
            components = newComponents
        }
        return components
    }
}
