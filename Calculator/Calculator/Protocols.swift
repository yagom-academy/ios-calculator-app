//
//  Protocols.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/23.
//

protocol Computable {
    func add(firstNumber: String, secondNumber: String) throws -> String?
    func subtract(firstNumber: String, secondNumber: String) throws -> String?
}

protocol Resettable {
    func reset()
}

