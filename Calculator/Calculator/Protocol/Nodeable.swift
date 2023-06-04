//
//  NodeType.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

protocol Nodeable {
    associatedtype Data
    func fetchData() -> Data
    mutating func fetchNext() -> Node<Data>?
    mutating func updateNext(_ next: Node<Data>)
}
