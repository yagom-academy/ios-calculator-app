//
//  CalculatorItemQueueExtension.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/10.
//

import Foundation

extension LinkedList {
    func searchAll() -> [CalcultorItem] {
        var searchedList:[CalcultorItem] = []
        if headForTest == nil {
            return []
        }
        
        var node = headForTest
        if let nodeData = node?.data {
            searchedList.append(nodeData)
        }
        
        while node?.next != nil {
            node = node?.next
            if let nodeData = node?.data {
                searchedList.append(nodeData)
            }
        }
        return searchedList
    }
}

extension NumberItem {
    var dataToString: String {
        return String(describing: self.data)
    }
}

extension OperatorItem {
    var operatorSymbol: String {
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
