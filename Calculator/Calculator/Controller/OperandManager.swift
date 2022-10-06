//
//  OperandHandler.swift
//  Created by Wonbi
//

struct OperandManager {
    private(set) var currentOperand: String = ExpressionText.zero
    private(set) var expression: String = ExpressionText.empty
    
    mutating func setCurrentOperand(_ operand: String) {
        currentOperand = operand
    }
    
    mutating func clearExpression() {
        expression = ExpressionText.empty
    }
    
    mutating func appendToExpression(_ expr: String) {
        expression.append(expr)
    }
    
    mutating func handleSignButton() {
        guard currentOperand != ExpressionText.zero else { return }
        
        if currentOperand.first == ExpressionText.minus {
            currentOperand.removeFirst()
        } else {
            currentOperand = String(ExpressionText.minus) + currentOperand
        }
    }
    
    mutating func handleDotButton() {
        guard !currentOperand.contains(ExpressionText.dot) else { return }
        currentOperand.append(ExpressionText.dot)
    }
    
    mutating func handleZeroButtons(from operand: String) {
        guard currentOperand != ExpressionText.zero else { return }
        currentOperand.append(operand)
    }
    
    mutating func appendOperands(from operand: String) {
        if currentOperand == ExpressionText.zero {
            currentOperand = operand
        } else {
            currentOperand.append(operand)
        }
    }
}
