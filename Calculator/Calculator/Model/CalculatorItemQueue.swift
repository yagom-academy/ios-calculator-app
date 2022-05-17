//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/17.
//

class CalculatorItemQueue: CalculatorItem {
    private(set) var item = [String]()
    
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
}
