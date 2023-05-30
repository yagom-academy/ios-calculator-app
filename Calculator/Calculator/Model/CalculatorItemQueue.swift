//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by myungsun on 2023/05/30.
//

class CalculatorItemQueue {
    private var items: [CalculateItem] = []
    
    func enqueue(item: CalculateItem) {
        items.append(item)
    }
    
    func dequeue() -> CalculateItem? {
        guard !items.isEmpty else { return nil }
        
        return items.removeFirst()
    }
    
    func clear() {
        items.removeAll()
    }
    
    func calculate() -> String? {
        guard let firstItem = dequeue() as? NumberItem else { return nil }
        var currentOperation: OperatorItem?
        var result = firstItem.number
        
        while let item = dequeue() {
            if let numberItem = item as? NumberItem {
                guard let operation = currentOperation else { continue }
                switch operation {
                case .add:
                    result += numberItem.number
                case .subtract:
                    result -= numberItem.number
                case .multiply:
                    result *= numberItem.number
                case .divide:
                    guard numberItem.number != 0 else { return "NaN" }
                    result /= numberItem.number
                }
            } else if let operatorItem = item as? OperatorItem {
                currentOperation = operatorItem
            }
        }
        
        return NumberItem(number: result).numberDescription
    }
}
