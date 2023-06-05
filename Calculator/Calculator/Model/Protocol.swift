//
//  Protocol.swift
//  Calculator
//
//  Created by Yetti on 2023/06/01.
//

protocol DoubleStackQueue {
    associatedtype T
    var isEmpty: Bool { get }
    
    mutating func enqueue(_ element: T)
    mutating func dequeue() -> T?
    mutating func clear()
    func peek() -> T?
}

protocol CalculateItem { }

extension Int: CalculateItem {}
extension Double: CalculateItem {}
extension String: CalculateItem {}
extension String {
    func split(with target: Character) -> [String] { }
}
