//
//  Listable.swift
//  Calculator
//
//  Created by hoon, hemg on 2023/06/04.
//

protocol Listable {
    associatedtype DataType
    var first: DataType? { get }
    var last: DataType? { get }
    mutating func append(_ data: DataType)
    mutating func removeFirst() -> DataType?
}
