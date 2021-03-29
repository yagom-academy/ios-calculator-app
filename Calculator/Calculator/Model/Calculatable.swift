//
//  CalCulator.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/22.
//
import Foundation

protocol Calculatable {
    var stack: Stack<String> { get }
    var postfix: [String] { get }
    var numberInput: String { get }
    var operatorArray: [String] { get }
    
    func reset()
    func input(_ input: String)
    func display() -> String?
}
