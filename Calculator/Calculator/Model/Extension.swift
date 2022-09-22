//
//  Extension.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

extension Double: CalculateItem {
    
}

extension Array {
    public subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil 
    }
}
