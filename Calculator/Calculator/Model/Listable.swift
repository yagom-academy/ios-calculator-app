//
//  Listable.swift
//  Calculator
//
//  Created by Harry on 2023/01/26.
//

protocol Listable {
    var first: Node<CalculateItem>? { get }
    var last: Node<CalculateItem>? { get }
    var count: Int { get }
    
    mutating func appendLast(_ value: CalculateItem)
    mutating func removeFirst() -> CalculateItem?
    mutating func removeAll()
}
