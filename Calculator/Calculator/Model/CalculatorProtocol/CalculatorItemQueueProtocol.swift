//
//  CalculatorItemQueueProtocol.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/01.
//

protocol CalculatorItemQueueProtocol {
    associatedtype T
    
    mutating func enqueue(_ element: T)
    mutating func dequeue() -> T?
}
