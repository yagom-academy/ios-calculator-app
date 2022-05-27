//
//  Queue.swift
//  Calculator
//
//  Created by bard on 2022/05/16.
//

protocol Queue {
    associatedtype T

    mutating func enQueue(_ T: T) 
    mutating func deQueue() throws -> T
    mutating func clearAllStacks()
}
