//
//  Queueable.swift
//  Calculator
//
//  Created by MARY on 2023/05/31.
//

protocol Queueable {
    associatedtype Item
    
    var peek: Item? { get }
    mutating func enqueue(_ item: Item)
    mutating func dequeue() -> Item?
    mutating func removeAll()
}
