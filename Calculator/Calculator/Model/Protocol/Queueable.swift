//
//  Queueable.swift
//  Calculator
//
//  Created by Zion & Dasan on 2023/06/16.
//

protocol Queueable {
    associatedtype Element
    
    init()
    mutating func enqueue(_ data: Element)
    mutating func dequeue() -> Element?
}
