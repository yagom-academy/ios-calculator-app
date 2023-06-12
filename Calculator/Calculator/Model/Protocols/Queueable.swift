//
//  Queueable.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/12.
//

protocol Queueable<T> {
	associatedtype T: CalculateItem
	var isEmpty: Bool? { get }
	var front: T? { get }
	func enqueue(_ value: T)
	func dequeue() -> T?
	init(list: LinkedList<T>)
}
