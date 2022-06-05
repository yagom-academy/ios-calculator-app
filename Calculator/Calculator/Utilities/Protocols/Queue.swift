//
//  Queue.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/17.
//

protocol Queue {
    associatedtype Element
    
    var peek: Element? { get }
    
    
    mutating func enqueue(_ data: Element)
    mutating func dequeue() -> Node<Element>?
    func isEmpty() -> Bool
}
