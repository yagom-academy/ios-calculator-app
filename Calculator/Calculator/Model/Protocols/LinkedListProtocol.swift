//
//  LinkedListProtocol.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/09.
//
protocol LinkedListProtocol {
	associatedtype T: Any
	var isEmpty: Bool { get }
	func append(value: T)
	func removeFirst() -> T?
}
