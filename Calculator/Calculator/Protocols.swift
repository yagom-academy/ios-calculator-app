//
//  Protocols.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/23.
//

protocol Computable {
    func add<T: SignedNumeric>(firstNumber: T, secondNumber: T) -> T
    func subtract<T: SignedNumeric>(firstNumber: T, secondNumber: T) -> T
}

extension Computable {
    func add<T: SignedNumeric>(firstNumber: T, secondNumber: T) -> T {
        return firstNumber + secondNumber
    }
    
    func subtract<T: SignedNumeric>(firstNumber: T, secondNumber: T) -> T {
        return firstNumber - secondNumber
    }
}

protocol Resettable {
    func reset()
}
