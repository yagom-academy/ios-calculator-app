//
//  CalculateItem.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/17.
//

import Foundation

protocol CalculateItemProtocol {
    associatedtype Element
    
    mutating func enQueue(_ element: Element) -> Bool

    mutating func deQueue() -> Element?
    
    func removeAll()
    
    var isEmpty: Bool { get }
    
    var peek: Element? { get }
}
