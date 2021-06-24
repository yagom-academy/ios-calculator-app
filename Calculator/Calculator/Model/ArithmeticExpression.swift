//
//  UserInput.swift
//  Calculator
//
//  Created by Nala on 2021/06/22.
//

import Foundation

public class Infix {
    var infix: Array<String> = []
}

class Postfix {
    var postfix: Array<String> = []
    var operatorsStack: Array<String> = []
    
    func separateNumberAndOperator(from infix: Array<String>) {
        // i 이름 바꾸기
        for item in infix {
            // 메서드로 바꾸기
            if isNumberInInfix(item: item) {
                addToPostfix(member: item)
            } else if operatorsStack.isEmpty {
                addToOperatorStack(of: item)
            } else {
                compareAndDecidePriority(lastStack: changeToOperatorsEnum(operatorsStack.last!),
                                            with: changeToOperatorsEnum(item))
            }
        }
    }
    
    func isNumberInInfix(item: String) -> Bool {
        let operators = ["+","−","×","÷"]
        
        if operators.contains(item) {
            return false
        }
        return true
    }
    
    func addToPostfix(member: String) {
        postfix.append(member)
    }
    
    func addToOperatorStack(of index: String) {
        operatorsStack.append(index)
    }
    
    func changeToOperatorsEnum(_ item: String) -> Operators {
        let lastStackOperator = item
        
        switch lastStackOperator {
        case "+":
            return Operators.plus
        case "−":
            return Operators.minus
        case "×":
            return Operators.multiply
        // 나누기 디폴트로 안하면 어떻게 해야할지 모르겠어요😭
        default:
            return Operators.divide
        }
    }
    
    // while문 반복해서 2가지 경우로 변형!
    func compareAndDecidePriority(lastStack: Operators, with input: Operators) {
        if lastStack < input {
            addToOperatorStack(of: input.operatorSymbol)
        } else if lastStack == input {
            addToPostfix(member: lastStack.operatorSymbol)
            operatorsStack.removeLast()
            addToOperatorStack(of: input.operatorSymbol)
        } else {
            while !operatorsStack.isEmpty {
                addToPostfix(member: lastStack.operatorSymbol)
                operatorsStack.removeLast()
            }
            addToOperatorStack(of: input.operatorSymbol)
        }
    }

    // 후위표기식 계산
    func calculatePostfix() {
    }
}
