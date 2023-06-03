//
//  Protocol.swift
//  Calculator
//
//  Created by Yetti on 2023/06/01.
//

protocol DoubleStackQueue {
    var isEmpty: Bool { get }
    
    mutating func enqueue(_ element: String)
    mutating func dequeue() -> String?
    mutating func clear()
    func peek() -> String?
}

protocol CalculateItem { }

