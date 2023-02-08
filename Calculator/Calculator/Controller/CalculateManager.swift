//
//  CalculateManager.swift
//  Calculator
//
//  Created by 혜모리, 릴라 on 2023/02/08.
//

final class CalculateManager {
    static let shared = CalculateManager()
    
    private init() { }
    
    private var expressions: [String] = []
    private var isCalculatedStatus: Bool = false
    
    func calculrateExpressions(operatorSign: String, operand: String) -> Double {
        expressions.append(operatorSign)
        expressions.append(operand)
        
        let input = expressions.joined(separator: Sign.blank)
        return ExpressionParser.parse(from: input).result()
    }
    
    func updateOperand(input: String?, at currentOperand: String) -> String? {
        guard let inputNumber = input else { return nil }
        guard currentOperand.removeDotAndNegative().count < 20 else { return nil }
        
        guard isCalculatedStatus != true else {
            isCalculatedStatus = false
            return inputNumber.applyFormatter()
        }
        
        if currentOperand == Sign.zero {
            guard currentOperand != Sign.zeroZero else { return nil }
            return inputNumber.applyFormatter()
        } else {
            guard currentOperand.contains(Sign.dot) == false else {
                return currentOperand + inputNumber
            }
            return (currentOperand + inputNumber).applyFormatter()
        }
    }
}
