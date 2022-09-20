//
//  Protocols.swift
//  Calculator
//
//  Created by 유제민 on 2022/09/20.
//

protocol CalculatorItem { }
protocol QueueManager {
    mutating func add(item: Item)
    mutating func getFirst() -> Item?
    mutating func getLast() -> Item?
    mutating func removeAll()
}
