//
//  Collection+.swift
//  Calculator
//
//  Created by Minsup on 2023/06/07.
//

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
