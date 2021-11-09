//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/09.
//

import Foundation

typealias List = Array

protocol CalculateItem {
}

struct CalculatorItemQueue<T>: CalculateItem {
    private let items: List<T>
    
    init() {
        self.items = List<T>()
    }
    
    func insert(_ item: T) -> Bool {
        return false
    }
    
    func delete() -> T? {
        return nil
    }
}
