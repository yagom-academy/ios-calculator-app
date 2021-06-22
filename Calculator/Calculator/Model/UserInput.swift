//
//  UserInput.swift
//  Calculator
//
//  Created by Nala on 2021/06/22.
//

import Foundation

let operators = ["+","-","×","÷"]

class UserInput {
    var infix: Array<String> = []
    var postfix: Array<String> = []
    var operatorsStack: Array<String> = []
    
    func separateNumberAndOperator(from infix: Array<String>) {

    }
    
    func isEmptyOperators() -> Bool {
        if operatorsStack.isEmpty {
            return true
        }
        return false
    }
    
    func addToPostfix() {
        //postfix에 값추가
    }
    
    func addToOperators(of index: String) {
        if isEmptyOperators() {
            operatorsStack.append(index)
        } else {
            comparePriority(stack: operatorsStack, index: index)
        }
    }
    
    func comparePriority(stack:[String], index: String) {
        let tt = stack.last
        
        if tt == "+" || tt == "-" {
            operatorsStack.append(index)
        }else {
            if index == "+" || index == "-" {
                while !operatorsStack.isEmpty {
                    //addToPostfix()
                    postfix.append(operatorsStack.removeLast())
                }
                operatorsStack.append(index)
            } else {
                postfix.append(operatorsStack.removeLast())
                operatorsStack.append(index)
            }
        }
    }
}

