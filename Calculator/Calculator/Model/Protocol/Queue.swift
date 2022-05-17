//
//  Queue.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/16.
//

protocol Queue {
    associatedtype T
    var isEmpty: Bool { get }
    var peek: T? { get }

    mutating func enQueue(_ T: T) -> Bool
    mutating func deQueue() -> T?
}
