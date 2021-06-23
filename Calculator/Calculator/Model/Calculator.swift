//
//  Calculator.swift
//  Calculator
//
//  Created by Kim Do hyung on 2021/06/22.
//

import Foundation

struct Calculator {
    var stack = Stack<String>()
    var infix: [Computable]
    
    mutating func convertToPostFix(from infix: [String]) -> [String] {
        var postFixArray:[String] = []
        do {
            for character in infix {
                if character == "(" {
                    stack.push(object: character)
                } else if character == ")" {
                    while try stack.peek() != "(" {
                        postFixArray.append(try stack.peek())
                        try stack.pop()
                    }
                } else if character == "*" || character == "/" {
                    
                }
            }
        } catch {
            
        }
        return postFixArray
    }
}
