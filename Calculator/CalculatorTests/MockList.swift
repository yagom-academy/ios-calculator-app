//
//  MockList.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/21.
//

import Foundation

class MockList<T>: List {
    
    var mockData: [T] = []
    
    var isEmpty: Bool { mockData.isEmpty }
    
    var count: Int { mockData.count }
    
    func append(_ data: T) {
        mockData.append(data)
    }
    
    func removeFirst() -> T? {
        return mockData.remove(at: 0)
    }
    
    func removeAll() {
        mockData.removeAll()
    }
}
