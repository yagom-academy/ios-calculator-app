//
//  Queueable.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/15.
//

protocol Queueable {
	associatedtype Item where Item: CalculateItem
	
	mutating func enqueue(_ value: Item)
	mutating func dequeue() throws -> Item
	mutating func removeAll()
}
