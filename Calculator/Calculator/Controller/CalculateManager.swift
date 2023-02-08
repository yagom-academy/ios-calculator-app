//
//  CalculateManager.swift
//  Calculator
//
//  Created by 혜모리, 릴라 on 2023/02/08.
//

final class CalculateManager {
    
    static let shared = CalculateManager()
    private init() { }
    
    private var currentOperand: String = ""
    private var expressions: [String] = []
    private var isCalculatedStatus: Bool = false
    
    func setCurrentOperand(to operand: String?) {
        currentOperand = operand ?? ""
    }
    
    func calculateExpressions(operatorSign: String, operand: String) -> Double {
        expressions.append(operatorSign)
        expressions.append(operand)
        
        let input = expressions.joined(separator: Sign.blank)
        return ExpressionParser.parse(from: input).result()
    }
    
    func updateOperand(input: String?) -> String? {
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
    
    func updateDot(at currentOperand: String) -> String? {
        guard currentOperand.contains(Sign.dot) == false else { return nil }
        return currentOperand.applyFormatter() + String(Sign.dot)
    }
    
    func updateOperator(with currentOperator: String?, at currentOperand: String) {
        let operand = currentOperand.removeComma()
    
        
        
        guard expressions.isEmpty == false else {
            let operand = currentOperand.removeComma()
            expressions.append(operand)
            isCalculatedStatus = false
            return
        }
        
        guard currentOperand != Sign.zero else {
            operatorLabel.text = sign
            return
        }
             
        expressions.append(currentOperator!)
        expressions.append(operand)
        
        isCalculatedStatus = false
 
    }
}
