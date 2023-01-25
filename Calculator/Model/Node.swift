//
//  Node.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/25.
//

class Node<T> {
    var data: T
    var dataType: CalculatorDataType
    var next: Node<T>?
    
    init(_ data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
        
        if data is Double {
            self.dataType = CalculatorDataType.numberData
        } else {
            self.dataType = CalculatorDataType.operatorData
        }
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs === rhs
    }
}

