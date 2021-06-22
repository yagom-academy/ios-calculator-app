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
    
    func addToOperators() {
        //operators에 값추가
    }
    
    func comparePriority() {
        //연산자 비교 
    }
}

