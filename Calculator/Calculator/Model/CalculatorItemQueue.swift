//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/17.
//

class CalculatorItemQueue: CalculatorItem {
    private(set) var items = [String?]()
    private var head = 0
    
    func convertToDouble(from data: String) -> Double? {
        guard let number = Double(data) else { return nil }
        return number
    }
    
    func enqueue(_ data: String) {
        for element in Operator.allCases {
            if element.symbol == data.suffix(1) {
                items.append(data)
            }
        }
    }
    
    func dequeue() -> String? {
        guard head < items.count, let element = items[head] else {
            return nil
        }
        items[head] = nil
        head += 1
        
        if head > items.count / 2 {
            items.removeFirst(head)
            head = 0
        }
        return element
    }
}
