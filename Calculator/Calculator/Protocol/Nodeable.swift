//
//  NodeType.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

protocol Nodeable {
    associatedtype DataType
    func fetchData() -> DataType
    mutating func fetchNext() -> Self?
    mutating func updateNext(_ next: Self)
}
