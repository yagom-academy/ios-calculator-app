//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by karen on 2023/06/07.
//

final class Node<T> {
    var data: T
    var prev: Node?
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}
