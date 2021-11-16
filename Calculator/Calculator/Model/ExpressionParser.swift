//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        let allOperatorSymbols = Operator.allCases.map { String($0.rawValue) }
        
        let operatorComponents = components.filter { allOperatorSymbols.contains($0) }.map { Character($0) }
        let operandComponents = components.filter { !allOperatorSymbols.contains($0) }
        var formula = Formula()
        
        operatorComponents.forEach { operatorComponent in
            guard let enumOperator = Operator(rawValue: operatorComponent) else { return }
            formula.operators.insert(enumOperator)
        }
        
        operandComponents.forEach { operandComponent in
            guard let doubleOperand = Double(operandComponent) else { return }
            formula.operands.insert(doubleOperand)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let allOperatorSymbols = Operator.allCases.map { $0.rawValue }
        let multiplyDivideSymbols = [Operator.multiply.rawValue, Operator.divide.rawValue]
        let signs = [Operator.add.rawValue, Operator.subtract.rawValue]
        let emptySpace = Character(" ")
        
        let multiplyDivideSymbolsWithSign = multiplyDivideSymbols.flatMap { operatorSymbol in
            signs.map { sign in "\(operatorSymbol)\(sign)" }
        }
        
        let inputWithoutWhitespace = input.components(separatedBy: .whitespacesAndNewlines).joined()
        
        var components = multiplyDivideSymbolsWithSign.reduce([inputWithoutWhitespace]) {
            (result: [String], operatorSymbolWithSign: String) in
            guard let operatorSymbol = operatorSymbolWithSign.first else { return result }
            guard let sign = operatorSymbolWithSign.last else { return result }
            let operatorSymbolWithEmptySpaceAndSign = "\(emptySpace)\(operatorSymbol)\(emptySpace)\(sign)"
            
            return result
                        .map {
                            $0.replacingOccurrences(of: operatorSymbolWithSign, with: operatorSymbolWithEmptySpaceAndSign)
                        }
                        .flatMap { $0.components(separatedBy: "\(emptySpace)") }
        }
        
        components = allOperatorSymbols.reduce(components) {
            (result: [String], operatorSymbol: Character) in
            return result
                        .flatMap { component -> [String] in
                            let splittedComponents = component.split(with: operatorSymbol)
                            guard let firstString = splittedComponents.first, firstString.count == 1, splittedComponents.count > 1 else { return splittedComponents }
                            let firstCharacter = Character(firstString)
                            guard signs.contains(firstCharacter) else { return splittedComponents }
                            let firstOpponent = "\(firstString)\(splittedComponents[1])"
                            guard splittedComponents.count > 2 else { return [firstOpponent] }
                            return ([firstOpponent] + Array(splittedComponents[2...]))
                        }
        }
        
        return components
    }
}
