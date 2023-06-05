//
//  Listable.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/04.
//

protocol Listable {
    associatedtype DataType
    mutating func append(_ data: DataType)
    mutating func removeFirst() -> DataType?
}
