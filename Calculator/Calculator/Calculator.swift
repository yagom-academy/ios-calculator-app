//
//  Calculator.swift
//  Calculator
//
//  Created by 신동훈 on 2021/06/23.
//

import Foundation

class Calculator {
    func calculate(infix: [String]) -> String {
        var result: String = ""
        let postfix: [String] = changeToPostfix(infix: infix)
        return result
    }
    
    func changeToPostfix(infix: [String]) -> [String] {
        var temporarySignStack = Stack<String>()
        var postfix: [String] = []
        for element in infix {
            if let _ = Double(element) {
                postfix.append(element)
            } else {
                popAndAppend(sign: element, from: &temporarySignStack, to: &postfix)
                temporarySignStack.push(element)
            }
        }
        
        while !temporarySignStack.isEmpty {
            let poppedSign = temporarySignStack.pop()
            postfix.append(poppedSign!)
        }
        return postfix
    }
    
    func hasHigherPriority(this: String, than: String) -> Bool {
        return (this == "/" || this == "x") && (than == "+" || than == "-")
    }
    
    func popAndAppend( sign: String, from temporarySignStack: inout Stack<String>, to postfix: inout [String]) {
        while let topOfTemporarySignStcak = temporarySignStack.top,
              !hasHigherPriority(this: sign, than: topOfTemporarySignStcak) {
            if let poppedSign = temporarySignStack.pop() {
                postfix.append(poppedSign)
            }
        }
    }
}
