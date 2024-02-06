//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Danny on 2/5/24.
//

import Foundation

struct CalculatorItemQueue: CalculateItem {
    private var queue: [String] = []
    private var valueOfOperations: Int = 0
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: String) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> String? {
        return queue.removeFirst()
    }
    
    public func showQueue() -> [String] {
        return queue
    }
    
    public func showValueOfOperations() -> String {
        return String(valueOfOperations)
    }
    
    public mutating func calculateOperations() {
        
        if let firstValueString = dequeue(), let firstValueInt = Int(firstValueString){
            valueOfOperations += firstValueInt
        }
        
        while queue.count > 0 {
            
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
