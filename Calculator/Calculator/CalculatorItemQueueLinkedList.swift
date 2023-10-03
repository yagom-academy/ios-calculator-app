//
//  CalculatorItemQueueLinkedList.swift
//  Calculator
//
//  Created by jyubong on 2023/10/03.
//

class CalculatorItemQueueLinkedList<DataType> {
    final class Node<DataType> {
        var data: DataType
        var next: Node?
        
        init(data: DataType) {
            self.data = data
        }
    }
    
    var head: Node<DataType>?
    var tail: Node<DataType>?
    var count: Int = 0
    
    var isEmpty: Bool {
        return count == 0 ? true : false
    }
    
    func append(_ item: DataType) {
        
    }
    
    func removeFirst() {
        
    }
}
