//
//  Multiply.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/27.
//

import Foundation

protocol Multiply: TypeConvertible {
    
    mutating func multiply(_ operatedNumber: Int, and operatingNumber: Int)
}

extension Addable {
    
    //
    mutating func add(_ operatedNumber: Int, and operatingNumber: Int) {
        let sumResult = stack.sumAllElements()
        
        stack.push(userInput)
        
        stack.push(stack.pop() * userInput)
        
    }
    
}
