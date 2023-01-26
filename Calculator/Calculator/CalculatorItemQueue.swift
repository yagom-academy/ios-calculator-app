//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Seoyeon Hong on 2023/01/26.
//

class CalculatorItemQueue<T>: CalculateItem {
    private var queue: Node<T>? = nil
}

//MARK: Node 타입 생성
class Node<T> {
    var data: T
    var nextData: Node?
    
    init(data: T, nextData: Node? = nil) {
        self.data = data
        self.nextData = nextData
    }
}
