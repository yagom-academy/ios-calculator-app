//
//  Protocol.swift
//  Calculator
//
//  Created by Yetti on 2023/06/01.
//

protocol DoubleStackQueue {
    var isEmpty: Bool { get }
    
    mutating func enQueue(_ element: String)
    mutating func deQueue() -> String?
    mutating func clear()
    func peek() -> String?
}

protocol CalculateItem { }

