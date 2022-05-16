//
//  Queue.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/17.
//

protocol Queue {
    associatedtype Element
    var isEmpty: Bool { get }
    var peek: Element? { get }
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
}
