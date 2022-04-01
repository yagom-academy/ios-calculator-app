//
//  ArrayExtension.swift
//  Calculator
//
//  Created by marisol on 2022/04/01.
//

extension Array {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
