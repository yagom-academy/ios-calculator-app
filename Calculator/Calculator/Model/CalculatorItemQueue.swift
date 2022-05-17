//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/17.
//

class CalculatorItemQueue: CalculatorItem {
    private(set) var item = [String?]()
    private var head = 0
    
    func convertToDouble(from data: String) -> Double? {
        guard let number = Double(data) else { return nil }
        return number
    }
    
    func enqueue(_ data: String) {
        for element in Operator.allCases {
            if element.symbol == data.suffix(1) {
                item.append(data)
            }
        }
    }
    
    func dequeue() -> String? {
        guard head < item.count, let element = item[head] else {
            return nil
        }
        item[head] = nil
        head += 1
        
        if head > item.count / 2 {
            item.removeFirst(head)
            head = 0
        }
        return element
    }
}
