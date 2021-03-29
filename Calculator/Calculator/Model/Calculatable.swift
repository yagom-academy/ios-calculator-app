//
//  CalCulator.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/22.
//
import Foundation

protocol Calculatable {
    var stack: Stack<String> { get }
    var postfixNumbers: [String] { get }
    var operand: String { get }
    var operators: [String] { get }
    
    func reset()
    func input(_ input: String)
    func display() -> String?
    func calculate(using operatorValue: String)
}
