//
//  TypeConvertible.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/27.
//

import Foundation

protocol TypeConvertible {
    associatedtype T: Numeric
    
    var userInput: T { get }
}

extension TypeConvertible {
    
    var userInput: T {
        guard let userInputOfString = readLine() else { fatalError() }
        guard let userInputOfT = userInputOfString as? Self.T else { fatalError() }
        return userInputOfT
    }
}





