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
        var components: [String] = []
        var currentNumber = ""
        
        input.forEach { character in
            let stringCharacter = String(character)
            if operators.filter({ $0 == stringCharacter }).isEmpty {
                currentNumber += stringCharacter
            } else {
                if !currentNumber.isEmpty {
                    components.append(currentNumber)
                    currentNumber = ""
                }
                components.append(stringCharacter)
            }
        }
        
        if !currentNumber.isEmpty {
            components.append(currentNumber)
        }
        
        return components
    }
}
