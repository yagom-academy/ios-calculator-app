//
//  Listable.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/04.
//

protocol Listable {
    associatedtype Data
    mutating func append(_ data: Data)
    mutating func removeFirst() -> Data?
}
