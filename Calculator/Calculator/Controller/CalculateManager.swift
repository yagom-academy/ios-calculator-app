//
//  CalculateManager.swift
//  Calculator
//
//  Created by 혜모리, 릴라 on 2023/02/08.
//

final class CalculateManager {
    private var currentOperand: String = Sign.empty
    private var expressions: [String] = []
    private var isCalculatedStatus: Bool = false
    
    func clearExpressions() {
        expressions.removeAll()
    }
    
    func setCurrentOperand(to operand: String?) {
        currentOperand = operand ?? Sign.empty
    }
    
    func calculateExpressions(operatorSign: String) -> Double {
        isCalculatedStatus = true
        expressions.removeLast()
        expressions.append(operatorSign)
        expressions.append(currentOperand.removeComma())
        
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
        return inspectOperand(input: inputNumber)
    }
    
    func inspectOperand(input: String) -> String? {
        if currentOperand == Sign.zero {
            guard currentOperand != Sign.zeroZero else { return nil }
            return input.applyFormatter()
        } else {
            guard currentOperand.contains(Sign.dot) == false else {
                return currentOperand + input
            }
            return (currentOperand + input).applyFormatter()
        }
    }
    
    func updateDot() -> String? {
        guard currentOperand.contains(Sign.dot) == false else { return nil }
        return currentOperand.applyFormatter() + String(Sign.dot)
    }
    
    func updateOperator(with currentOperator: String?) -> Bool {
        let operand = currentOperand.removeComma()
        
        guard expressions.isEmpty == false else {
            let operand = currentOperand.removeComma()
            expressions.append(operand)
            expressions.append(currentOperator!)
            isCalculatedStatus = false
            return true
        }
        
        guard currentOperand != Sign.zero else {
            return false
        }
        
        expressions.append(operand)
        expressions.append(currentOperator!)
        isCalculatedStatus = false
        return true
    }
    
    func convertPositiveNegative() -> String {
        guard currentOperand != Sign.zero else { return Sign.zero }
        
        if currentOperand.first == Sign.negative {
            currentOperand.removeFirst()
        } else {
            currentOperand = "\(Sign.negative)" + currentOperand
        }
        return currentOperand
    }
}
