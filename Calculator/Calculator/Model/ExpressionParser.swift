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
            } else {
                let operators = Operator.allCases.filter{ String($0.rawValue) == component }
                operators.forEach{ operatorQueue.enqueue(item: $0) }
            }
        }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { String($0.rawValue)}.joined()
        let components = [input]
        
        let reducedComponents = operators.reduce(components) { result, operatorString in
            return result.flatMap {$0.split(with: operatorString)}
            
        }
        return reducedComponents
    }
}
