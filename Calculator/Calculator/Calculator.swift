//
//  Calculator.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue {
    var queueList: [String] = ["1"]
    
    mutating func append(item: String?) {
        guard let item = item else {
            return
        }
        queueList.append(item)
    }
    
    mutating func remove() -> String? {
        guard queueList == [] else {
            return nil
        }
        let removedItem = queueList.removeFirst()
        
        return removedItem
    }
    
    mutating func clearList() {
        queueList = []
    }
    
}
