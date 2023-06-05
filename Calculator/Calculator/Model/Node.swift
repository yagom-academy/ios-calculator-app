//
//  Node.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/30.
//

final class Node<DataType>: Nodeable {
    private let data: DataType
    private var next: Node<DataType>?
    
    init(data: DataType, next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    func fetchData() -> DataType {
        return data
    }
    
    func fetchNext() -> Node<DataType>? {
        return next
    }
    
    func updateNext(_ next: Node<DataType>) {
        self.next = next
    }
}
