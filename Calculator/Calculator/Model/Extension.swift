//
//  Extension.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

extension Double: CalculateItem {
    
}

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
}

extension Array {
    public subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
