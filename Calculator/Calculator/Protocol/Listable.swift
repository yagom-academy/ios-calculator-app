//
//  Listable.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/04.
//

protocol Listable {
    associatedtype T
    mutating func append(_ data: T)
    mutating func removeFirst() -> T?
}
