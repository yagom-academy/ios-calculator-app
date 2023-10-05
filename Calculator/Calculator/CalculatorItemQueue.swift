//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hisop on 2023/10/05.
//

protocol CalculateItem {
   
}

class CalculateItemNode: CalculateItem {
   var value: Double
   var operatorType: OperatorType
   var next: CalculateItemNode?
   
   init (value: Double, operatorType: OperatorType) {
       self.value = value
       self.operatorType = operatorType
   }
}

struct CalculateItemQueue {
    var head: CalculateItemNode?
    var tail: CalculateItemNode?
    
    mutating func enqueue(value: Double, operatorType: OperatorType) {
        
    }
    
    mutating func dequeue() -> Double? {
        return 0
    }
    
    mutating func clear() {

    }
    
    func isEmpty() -> Bool {
        return false
    }
    
    func count() -> Int {
        var count = 0
        
        return count
    }
}
