//
//  CalculatorItemQueueProtocol.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/01.
//

protocol CalculatorItemQueueProtocol {
    associatedtype T
    
    var first: Node<T>? { get }
    var last: Node<T>? { get }
    
    mutating func enqueue(_ element: T)
    mutating func dequeue() -> T?
}
