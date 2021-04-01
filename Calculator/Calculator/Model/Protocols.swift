//
//  Protocols.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/23.
//
import Foundation

protocol Computable {
    static func add(firstNumber: String, secondNumber: String) -> String
    static func subtract(firstNumber: String, secondNumber: String) -> String
}
