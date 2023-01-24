//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 강민수 on 2023/01/24.
//

struct CalculatorItemQueue: CaculateItem {
    var items = Queue()
    private var numbers: String = "123"
    
    mutating func finishInputNumbers() {
        let tempNode = Node(value: numbers)
        
        self.items.enqueue(tempNode)
    }
}
