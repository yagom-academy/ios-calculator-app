//
//  Queue.swift
//  Calculator
//
//  Created by 나이든별, 민쏜
//

protocol Queue {
    associatedtype Element
    
    var peek: Element? { get }
    
    
    mutating func enqueue(_ data: Element)
    mutating func dequeue() -> Node<Element>?
    func isEmpty() -> Bool
}
