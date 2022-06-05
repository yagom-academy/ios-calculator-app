//
//  Queue.swift
//  Calculator
//
//  Created by 나이든별, 민쏜
//

protocol Queue {
    associatedtype Element
    var isEmpty: Bool { get }
    var peek: Element? { get }
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
}
