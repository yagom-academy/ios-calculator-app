//
//  Calculator.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue {
    var queueList: [CalcultorItem] = []
    
    mutating func append(item: CalcultorItem?) {
        guard let item = item else {
            return
        }
        
        if let number = item as? NumberItem {
            queueList.append(number)
        }
        
        if let operatorItem = item as? OperatorItem {
            queueList.append(operatorItem)
        }
    }
    
    mutating func remove() -> CalcultorItem? {
        if queueList.isEmpty {
            return nil
        }
        let removedItem = queueList.removeFirst()
        
        return removedItem
    }
    
    mutating func clearList() {
        self.queueList = []
    }
}

struct NumberItem: CalcultorItem {
    let data: Int
    
    var dataToString: String {
        return String(describing: self.data)
    }
}

enum OperatorItem: CalcultorItem, CustomStringConvertible {
    case add
    case substract
    case multiple
    case divide
    
    var description: String {
        switch self {
        case .add:
            return "+"
        case .substract:
            return "-"
        case .multiple:
            return "*"
        case .divide:
            return "/"
        }
    }
}

protocol CalcultorItem { }
