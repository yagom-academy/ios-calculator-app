//
//  LinkedList.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

class Node<T> {
    let data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}
