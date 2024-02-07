//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Danny on 2/5/24.
//

import Foundation

struct CalculatorItemQueue: CalculateItem {
    private var list: [String] = []
    
    public var count: Int {
        return list.count
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public mutating func enqueue(_ element: String) {
        list.append(element)
    }
    
    public mutating func dequeue() -> String? {
        return list.removeFirst()
    }
    
    public func showQueue() -> [String] {
        return list
    }
    
    public func showValueOfOperations() -> String {
        return String(valueOfOperations)
    }
    
    public mutating func calculateOperations() {
        
        if let firstValueString = dequeue(), let firstValueInt = Int(firstValueString){
            valueOfOperations += firstValueInt
        }
        
        while list.count > 0 {
            
            let multiflex = dequeue()
            
            switch multiflex {
            case "+":
                if let firstValueString = dequeue(), let firstValueInt = Int(firstValueString){
                    valueOfOperations += firstValueInt
                }
            case "-":
                if let firstValueString = dequeue(), let firstValueInt = Int(firstValueString){
                    valueOfOperations -= firstValueInt
                }
            case "*":
                if let firstValueString = dequeue(), let firstValueInt = Int(firstValueString){
                    valueOfOperations *= firstValueInt
                }
            default:
                if let firstValueString = dequeue(), let firstValueInt = Int(firstValueString){
                    valueOfOperations /= firstValueInt
                }
            }
        }
        
    }
}
