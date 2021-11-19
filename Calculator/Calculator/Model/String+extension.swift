//
//  String.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/12.
//

import Foundation

// MARK: property
extension String {
    var isZeroValue: Bool {
        return self == "0" ? true : false
    }
}

// MARK: method

extension String {
    func split(with target: Character) -> [String] {
        var seperatedValue: [String] = []
        var valueToSeperate: String = self
        
        while let targetIndex: String.Index = valueToSeperate.firstIndex(of: target) {
            let targetBeforeValue = valueToSeperate[..<targetIndex]
            let targetAfterValue = valueToSeperate[index(after: targetIndex)...]
            
            seperatedValue.append(String(targetBeforeValue))
            seperatedValue.append(String(target))
            
            valueToSeperate = String(targetAfterValue)
        }
        seperatedValue.append(valueToSeperate)
        
        return seperatedValue
    }
}
