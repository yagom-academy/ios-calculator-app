//
//  Queueable.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/12.
//

protocol Queueable {
    associatedtype T
    
    var isEmpty: Bool { get }
    
    mutating func enqueue(_ element: T)
    
    mutating func dequeue() -> T?
    
    mutating func clearQueue()
}
