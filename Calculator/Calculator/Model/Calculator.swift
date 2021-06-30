//
//  Calculator.swift
//  Calculator
//
//  Created by Kim Do hyung on 2021/06/22.
//

import Foundation

enum CalculatorError: Error {
    case dividedByZero
    case stackError
    case unknownError
}

protocol Computable { }

extension Operator: Computable {}
extension Operand: Computable {}

class Calculator {
    
    /// 전위식을 후위식으로 변경
    /// convertToPostFix(infix: [Operand("1"), .plus, Operand("2")])
    /// -> [Operand("1"), Operand("2"), .plus]
    private func convertToPostFix(infix: [Computable]) -> [Computable] {
        var postfix: [Computable] = []
        let operatorStack = Stack<Operator>()
        
        for character in infix {
            if let value = character as? Operand {
                postfix.append(value)
            } else if let value = character as? Operator {
                while !operatorStack.isEmpty(),
                      let postfixItem = operatorStack.peek(),
                      value.isLowerPriority(than: postfixItem) {
                    postfix.append(postfixItem)
                    operatorStack.pop()
                }
                operatorStack.push(object: value)
            }
        }
        
        while let postfixItem = operatorStack.pop() {
            postfix.append(postfixItem)
        }
        
        return postfix
    }
    
    /// evaluate(postfix: [Operand("1"), Operand("2"), .plus]) -> Operand(3)
    private func evaluate(postfix: [Computable]) throws -> Operand? {
        let operandStack = Stack<Operand>()
        
        for postfixItem in postfix {
            if let operandValue = postfixItem as? Operand {
                operandStack.push(object: operandValue)
            } else if let operatorValue = postfixItem as? Operator,
                      let rhs = operandStack.pop(),
                      let lhs = operandStack.pop() {
                let result = try operatorValue.calculate(lhs, with: rhs)
                operandStack.push(object: Operand(operand: result))
            }
        }
        return operandStack.pop()
    }
    
    /// pushToInfix(with: ["1", "+", "2"]) -> [Operand("1"), .plus, Operand("2")]
    private func pushToInfix(with inputNotation: [String]) -> [Computable] {
        var infix: [Computable] = []
        for value in inputNotation {
            if let operatorValue = Operator(rawValue: value) {
                infix.append(operatorValue)
            } else if let operandValue = Operand(operand: value) {
                infix.append(operandValue)
            }
        }
        return infix
    }
    
    func runCalculator(on inputNotation: [String]) -> Result<Double, CalculatorError> {
        do {
            let infix = pushToInfix(with: inputNotation)
            let postfix = convertToPostFix(infix: infix)
            
            guard let result = try evaluate(postfix: postfix) else {
                throw StackError.stackIsEmpty
            }
            
            return .success(result.getOperandValue)
        } catch CalculatorError.dividedByZero {
            return .failure(CalculatorError.dividedByZero)
        } catch StackError.stackIsEmpty {
            return .failure(CalculatorError.stackError)
        } catch {
            return .failure(CalculatorError.unknownError)
        }
    }
}

