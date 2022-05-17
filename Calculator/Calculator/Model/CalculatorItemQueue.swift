//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/17.
//

class CalculatorItemQueue: CalculatorItem {
    private var item = [String]()
    
    func convertToDouble(from data: String) -> Double? {
        guard let number = Double(data) else { return nil }
        return number
    }
}
