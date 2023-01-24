//  CalculatorItemQueue.swift
//  Created by 레옹아범 on 2023/01/24.

struct CalculatorItemQueue: CalculateItem {
    var items = Queue()
    var numbers: String = ""
    
    mutating func finishInputNumbers() {
        if numbers == "" {
            return
        }
        
        let tempNode = Node(value: numbers)
        self.items.enqueue(tempNode)
    }
    
    mutating func pushNumber(_ number: String) {
        self.numbers += number
    }
}
