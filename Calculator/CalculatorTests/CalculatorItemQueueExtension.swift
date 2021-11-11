//
//  CalculatorItemQueueExtension.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/10.
//

import Foundation

extension LinkedList {
    func searchAll() -> [CalculateItem?] {
        var searchedList: [CalculateItem?] = []
        if front() == nil {
            return []
        }
        
        var node = front()
        searchedList.append(node?.data)
        
        
        while node?.next != nil {
            node = node?.next
            searchedList.append(node?.data)
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
