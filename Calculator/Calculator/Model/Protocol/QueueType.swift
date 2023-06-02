//
//  QueueType.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/02.
//

protocol QueueType {
    associatedtype Item
    
    mutating func enqueue(_ value: Item)
    mutating func dequeue() throws -> Item
    mutating func removeAll()
}
